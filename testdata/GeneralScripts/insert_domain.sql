DELETE FROM public.v_domains WHERE domain_name='tests.atdomain';

INSERT INTO public.v_domains(domain_uuid, domain_name, domain_description)
VALUES('99992222-3333-4444-5555-666677778888', 'tests.atdomain', 'Domain for Automatic Tests');