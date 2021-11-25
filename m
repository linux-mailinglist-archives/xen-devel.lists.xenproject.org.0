Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A5645D501
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 07:55:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230675.398824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mq8f6-0008HK-CQ; Thu, 25 Nov 2021 06:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230675.398824; Thu, 25 Nov 2021 06:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mq8f6-0008FI-8g; Thu, 25 Nov 2021 06:55:16 +0000
Received: by outflank-mailman (input) for mailman id 230675;
 Thu, 25 Nov 2021 06:55:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ia/m=QM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mq8f3-0008FC-T8
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 06:55:14 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2e7cb33-4dbc-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 07:55:12 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 10CB921959;
 Thu, 25 Nov 2021 06:55:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 409EF13A98;
 Thu, 25 Nov 2021 06:55:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sYoGDU8zn2F5fAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 25 Nov 2021 06:55:11 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a2e7cb33-4dbc-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637823312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KQV28t7w0eqLFuxJa8mEkpoXbrSA0O3UATVsW+dfjiQ=;
	b=DRkCR7Iz870mUJNra6E/CBLwI7c6pbiUXBjIaSS7VB/XSG/t946WkWsXi3TOd0jEl63BEn
	Wg9AjXRmC834/5HSfEmrhY9pZb7erfccFezxn0lrRJ6zOninN2zp40PYMl+WvYa7hPqHiK
	BVqwWcbJCP7BZU+RZHReR5OvPWHH2pg=
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-4-jgross@suse.com>
 <b1599a82-052f-9369-3774-69c5c570370c@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 3/4] xen: add new stable control hypercall
Message-ID: <5ea7400b-448b-039b-6d95-2552c9ae7cd4@suse.com>
Date: Thu, 25 Nov 2021 07:55:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <b1599a82-052f-9369-3774-69c5c570370c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="W0mp1AbQJNjFVknpmPv1FA5JVYdyMGzJs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--W0mp1AbQJNjFVknpmPv1FA5JVYdyMGzJs
Content-Type: multipart/mixed; boundary="fqJMgs5afiwo4M0GyhuJJxG0D2JfEDHmr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <5ea7400b-448b-039b-6d95-2552c9ae7cd4@suse.com>
Subject: Re: [PATCH RFC 3/4] xen: add new stable control hypercall
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-4-jgross@suse.com>
 <b1599a82-052f-9369-3774-69c5c570370c@suse.com>
In-Reply-To: <b1599a82-052f-9369-3774-69c5c570370c@suse.com>

--fqJMgs5afiwo4M0GyhuJJxG0D2JfEDHmr
Content-Type: multipart/mixed;
 boundary="------------4FD88E805B6B1FA0F0939003"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4FD88E805B6B1FA0F0939003
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.11.21 16:39, Jan Beulich wrote:
> On 14.09.2021 14:35, Juergen Gross wrote:
>> The sysctl and domctl hypercalls are not stable, so tools using those
>> need to be in sync with the hypervisor.
>>
>> In order to decouple (some) tools from the hypervisor add a new stable=

>> hypercall __HYPERVISOR_control_op
>=20
> I'm not convinced we need a new hypercall. New sub-ops of the existing =
ones
> can be declared stable (and be made bypass the interface version checks=
).
> If we want/need a new one, "control" is too generic: There's a reason w=
e
> currently have separate domctl and sysctl, and I think if we want new
> hypercalls rather than new sub-ops, then we'd again want a global and a=

> per-domain one (unless the new one had provisions to be able to serve
> both purposes).

It would be nice to settle on a plan for stable [dom|sys]ctl interfaces.

Andrew, I think you already have some plans for that. Mind to share your
thoughts?

>=20
>> with (for now) two sub-options:
>>
>> - XEN_CONTROL_OP_get_version for retrieving the max version of the new=

>>    hypercall supported by the hypervisor
>> - XEN_CONTROL_OP_get_state_changed_domain for retrieving some state
>>    data of a domain which changed state (this is needed by Xenstore).
>>    The returned state just contains the domid, the domain unique id,
>>    and some flags (existing, shutdown, dying).
>=20
> If we go with a new hypercall, I think you want to split its introducti=
on
> (with just the version sub-op) from the addition of get_state_changed_d=
om.
>=20
>> --- /dev/null
>> +++ b/xen/common/control.c
>> @@ -0,0 +1,52 @@
>> +/********************************************************************=
**********
>> + *
>> + * control.c
>> + *
>> + * Entry point of the stable __HYPERVISOR_control_op hypercall.
>> + */
>> +#include <xen/err.h>
>> +#include <xen/event.h>
>> +#include <xen/guest_access.h>
>> +#include <xen/hypercall.h>
>> +#include <public/control.h>
>> +
>> +long do_control_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg=
)
>> +{
>> +    int ret =3D 0;
>> +
>> +    if ( xsm_control_op(XSM_OTHER, cmd) )
>> +        return -EPERM;
>> +
>> +    switch ( cmd )
>> +    {
>> +    case XEN_CONTROL_OP_get_version:
>> +        if ( !guest_handle_is_null(arg) )
>> +            return -EINVAL;
>> +
>> +        ret =3D XEN_CONTROL_VERSION;
>> +        break;
>> +
>> +    case XEN_CONTROL_OP_get_state_changed_domain:
>> +    {
>> +        struct xen_control_changed_domain info =3D { };
>> +
>> +        if ( get_global_virq_handler(VIRQ_DOM_EXC) !=3D current->doma=
in )
>> +            return -EPERM;
>=20
> The function result is stale by the time it gets made use of here. If t=
his
> is deemed not to be a problem, then I guess it wants saying so in the
> description.

I can add something to lock VIRQ_DOM_EXC to the hardware domain in case
it hasn't been registered yet.

>=20
>> @@ -103,6 +104,43 @@ void domain_reset_states(void)
>>       rcu_read_unlock(&domlist_read_lock);
>>   }
>>  =20
>> +int domain_get_dom_state_changed(struct xen_control_changed_domain *i=
nfo)
>> +{
>> +    unsigned int dom;
>> +    struct domain *d;
>> +
>> +    while ( (dom =3D find_first_bit(dom_state_changed, DOMID_MASK + 1=
)) <
>> +            DOMID_FIRST_RESERVED )
>=20
> As per my comment on the earlier patch - the use of DOMID_MASK + 1 vs
> is quite puzzling here.

Okay, will change that.

>=20
>> +    {
>> +        d =3D rcu_lock_domain_by_id(dom);
>> +
>> +        if ( test_and_clear_bit(dom, dom_state_changed) )
>> +        {
>> +            info->domid =3D dom;
>> +            if ( d )
>> +            {
>> +                info->state =3D XEN_CONTROL_CHANGEDDOM_STATE_EXIST;
>> +                if ( d->is_shut_down )
>> +                    info->state |=3D XEN_CONTROL_CHANGEDDOM_STATE_SHU=
TDOWN;
>> +                if ( d->is_dying =3D=3D DOMDYING_dead )
>> +                    info->state |=3D XEN_CONTROL_CHANGEDDOM_STATE_DYI=
NG;
>> +                info->unique_id =3D d->unique_id;
>> +
>> +                rcu_unlock_domain(d);
>> +            }
>> +
>> +            return 0;
>=20
> With rapid creation of short lived domains, will the caller ever get to=

> see information on higher numbered domains (if, say, it gets "suitably"=

> preempted within its own environment)? IOW shouldn't there be a way for=

> the caller to specify a domid to start from?

I'd rather have a local variable for the last reported domid and start
from that.

>=20
>> +        }
>> +
>> +        if ( d )
>> +        {
>> +            rcu_unlock_domain(d);
>> +        }
>=20
> Nit: Unnecessary braces.
>=20
>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -894,11 +894,16 @@ static struct domain *global_virq_handlers[NR_VI=
RQS] __read_mostly;
>>  =20
>>   static DEFINE_SPINLOCK(global_virq_handlers_lock);
>>  =20
>> -void send_global_virq(uint32_t virq)
>> +struct domain *get_global_virq_handler(uint32_t virq)
>>   {
>>       ASSERT(virq_is_global(virq));
>>  =20
>> -    send_guest_global_virq(global_virq_handlers[virq] ?: hardware_dom=
ain, virq);
>> +    return global_virq_handlers[virq] ?: hardware_domain;
>> +}
>> +
>> +void send_global_virq(uint32_t virq)
>> +{
>> +    send_guest_global_virq(get_global_virq_handler(virq), virq);
>>   }
>=20
> Following my comment further up, I think external exposure of this requ=
ires
> to finally eliminate the (pre-existing) risk of race here. I think
> get_knownalive_domain() is all it takes to at least prevent the domain
> disappearing behind our backs, with the extra reference transferred to =
the
> caller. Yet we may want to additionally be assured that the domain in
> question continues to be the one handling the respective vIRQ ...

Okay. Will look into this.

>=20
>> --- /dev/null
>> +++ b/xen/include/public/control.h
>> @@ -0,0 +1,80 @@
>> +/********************************************************************=
**********
>> + * Xen Control Hypercall
>> + *
>> + * Copyright (c) 2021, SUSE Software Solutions Germany GmbH
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtain=
ing a copy
>> + * of this software and associated documentation files (the "Software=
"), to
>> + * deal in the Software without restriction, including without limita=
tion the
>> + * rights to use, copy, modify, merge, publish, distribute, sublicens=
e, and/or
>> + * sell copies of the Software, and to permit persons to whom the Sof=
tware is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be inc=
luded in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL THE
>> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING
>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHE=
R
>> + * DEALINGS IN THE SOFTWARE.
>> + *
>> + */
>> +
>> +#ifndef __XEN_PUBLIC_CONTROL_H__
>> +#define __XEN_PUBLIC_CONTROL_H__
>> +
>> +#include "xen.h"
>> +
>> +/*
>> + * Definitions for the __HYPERVISOR_control_op hypercall.
>> + */
>> +
>> +/* Highest version number of the control interface currently defined.=
 */
>> +#define XEN_CONTROL_VERSION      1
>> +
>> +/*
>> + * Hypercall operations.
>> + */
>> +
>> +/*
>> + * XEN_CONTROL_OP_get_version
>> + *
>> + * Read highest interface version supported by the hypervisor.
>> + *
>> + * arg: NULL
>> + *
>> + * Possible return values:
>> + * >0: highest supported interface version
>> + * <0: negative Xen errno value
>> + */
>> +#define XEN_CONTROL_OP_get_version                  0
>=20
> What would a caller use the returned value for? I guess this follows
> XEN_HYPFS_OP_get_version, but I'm less certain of the utility here.
> Incompatible extensions are easy to make use separate sub-ops, unlike
> possible extensions there to struct xen_hypfs_dir{,list}entry.

I think can be discussed finally when we have settled on a plan for
stable control interfaces.

>=20
>> +/*
>> + * XEN_CONTROL_OP_get_state_changed_domain
>> + *
>> + * Get information about a domain having changed state and reset the =
state
>> + * change indicator for that domain. This function is usable only by =
a domain
>> + * having registered the VIRQ_DOM_EXC event (normally Xenstore).
>> + *
>> + * arg: XEN_GUEST_HANDLE(struct xen_control_changed_domain)
>> + *
>> + * Possible return values:
>> + * 0: success
>> + * <0 : negative Xen errno value
>> + */
>> +#define XEN_CONTROL_OP_get_state_changed_domain     1
>> +struct xen_control_changed_domain {
>> +    domid_t domid;
>> +    uint16_t state;
>> +#define XEN_CONTROL_CHANGEDDOM_STATE_EXIST     0x0001  /* Domain is e=
xisting. */
>> +#define XEN_CONTROL_CHANGEDDOM_STATE_SHUTDOWN  0x0002  /* Shutdown fi=
nished. */
>> +#define XEN_CONTROL_CHANGEDDOM_STATE_DYING     0x0004  /* Domain dyin=
g. */
>> +    uint32_t pad1;           /* Returned as 0. */
>> +    uint64_t unique_id;      /* Unique domain identifier. */
>> +    uint64_t pad2[6];        /* Returned as 0. */
>=20
> I think the padding fields have to be zero on input, not just on return=
=2E

I don't see why this would be needed, as this structure is only ever
copied to the caller, so "on input" just doesn't apply here.

> Unless you mean to mandate them to be OUT only now and forever. I also

The whole struct is OUT only.

> wonder how the trailing padding plays up with the version sub-op: Do we=

> really need such double precaution?

I can remove it.

> Also - should we use uint64_aligned_t here?

Yes.


Juergen

--------------4FD88E805B6B1FA0F0939003
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------4FD88E805B6B1FA0F0939003--

--fqJMgs5afiwo4M0GyhuJJxG0D2JfEDHmr--

--W0mp1AbQJNjFVknpmPv1FA5JVYdyMGzJs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGfM04FAwAAAAAACgkQsN6d1ii/Ey8A
ogf+N1MGJSzpmbTWPnZL3d5f2abG/aZVF2N21D7iaQ+GyZ01m8v4OQj5+aBWZpPKOgjN3/GM8KPK
SjSp6/svdZQtW/UM4CWwwzgWhe/lgfjJk19LNKhZL+b8KZ1qvEqGGtChUt/j8sc47cC7fs/OOjpy
2KzPwAb7T6YpaUgfQXA4uwCE4otH5AQL1pF0B1Gm49cW53DNLugITzNHeEta7ezEl7HWfbxM1ct2
YEcCawS++3xzrNYBT1eNjgtIwD3K7yEnEbZQvoBnnQgN+0NrU7AQnI2JKhnCqoQi44NmIyoUGfSf
d1z77ZeOo34UEPMw1fc6iXPN6sLyz7CBq6H4s+cEUA==
=Cx2K
-----END PGP SIGNATURE-----

--W0mp1AbQJNjFVknpmPv1FA5JVYdyMGzJs--

