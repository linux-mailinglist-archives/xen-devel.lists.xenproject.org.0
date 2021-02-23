Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881BB322741
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 09:53:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88628.166750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lETRJ-0001jB-2V; Tue, 23 Feb 2021 08:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88628.166750; Tue, 23 Feb 2021 08:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lETRI-0001im-Vj; Tue, 23 Feb 2021 08:53:04 +0000
Received: by outflank-mailman (input) for mailman id 88628;
 Tue, 23 Feb 2021 08:53:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YqHm=HZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lETRH-0001ig-7e
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 08:53:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1246c04-3ba0-47cb-a34b-3ff73b12a8c2;
 Tue, 23 Feb 2021 08:53:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A1BA4ACBF;
 Tue, 23 Feb 2021 08:53:00 +0000 (UTC)
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
X-Inumbo-ID: f1246c04-3ba0-47cb-a34b-3ff73b12a8c2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614070380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HzZGoE20qkrk+cOtWLJdne7w3nvphGvj6RPYFs7gYSA=;
	b=gYZaL0jSdHiHuCLuPXf0dPoBZveZlYn+jBU9JFfXWh7dW7MQl7al0Wc3yqDhBFbwmSLHzU
	DpMB5X0PwVm3pOZveqLWQAeDdLxowgnepodJct6p+PYTuCGuVWD0ZcdtqYPzTb0AF8q8Zi
	gIWO57rn0Eng2+n1QprdCw0fRf7iyvg=
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
 <20210223023428.757694-2-volodymyr_babchuk@epam.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [RFC PATCH 01/10] sched: core: save IRQ state during locking
Message-ID: <4f7b4788-3b2e-8501-6aec-948b70320af2@suse.com>
Date: Tue, 23 Feb 2021 09:52:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210223023428.757694-2-volodymyr_babchuk@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pCfBWb9QPFsr4MRSolY7kw1TRfAHKnqoQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pCfBWb9QPFsr4MRSolY7kw1TRfAHKnqoQ
Content-Type: multipart/mixed; boundary="90dSW4K7AGrBTbuCGBLPvpLH1tLm7uEIH";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Message-ID: <4f7b4788-3b2e-8501-6aec-948b70320af2@suse.com>
Subject: Re: [RFC PATCH 01/10] sched: core: save IRQ state during locking
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
 <20210223023428.757694-2-volodymyr_babchuk@epam.com>
In-Reply-To: <20210223023428.757694-2-volodymyr_babchuk@epam.com>

--90dSW4K7AGrBTbuCGBLPvpLH1tLm7uEIH
Content-Type: multipart/mixed;
 boundary="------------9E3D4271ACE632562E1CB367"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9E3D4271ACE632562E1CB367
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 23.02.21 03:34, Volodymyr Babchuk wrote:
> With XEN preemption enabled, scheduler functions can be called with
> IRQs disabled (for example, at end of IRQ handler), so we should
> save and restore IRQ state in schedulers code.

This breaks core scheduling.

Waiting for another sibling with interrupts disabled is an absolute
no go, as deadlocks are the consequence.

You could (in theory) make preemption and core scheduling mutually
exclusive, but this would break the forward path to mutexes etc.


Juergen

>=20
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   xen/common/sched/core.c | 33 ++++++++++++++++++---------------
>   1 file changed, 18 insertions(+), 15 deletions(-)
>=20
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 9745a77eee..7e075613d5 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -2470,7 +2470,8 @@ static struct vcpu *sched_force_context_switch(st=
ruct vcpu *vprev,
>    * sched_res_rculock has been dropped.
>    */
>   static struct sched_unit *sched_wait_rendezvous_in(struct sched_unit =
*prev,
> -                                                   spinlock_t **lock, =
int cpu,
> +                                                   spinlock_t **lock,
> +                                                   unsigned long *flag=
s, int cpu,
>                                                      s_time_t now)
>   {
>       struct sched_unit *next;
> @@ -2500,7 +2501,7 @@ static struct sched_unit *sched_wait_rendezvous_i=
n(struct sched_unit *prev,
>                   prev->rendezvous_in_cnt++;
>                   atomic_set(&prev->rendezvous_out_cnt, 0);
>  =20
> -                pcpu_schedule_unlock_irq(*lock, cpu);
> +                pcpu_schedule_unlock_irqrestore(*lock, *flags, cpu);
>  =20
>                   sched_context_switch(vprev, v, false, now);
>  =20
> @@ -2530,7 +2531,7 @@ static struct sched_unit *sched_wait_rendezvous_i=
n(struct sched_unit *prev,
>               prev->rendezvous_in_cnt++;
>               atomic_set(&prev->rendezvous_out_cnt, 0);
>  =20
> -            pcpu_schedule_unlock_irq(*lock, cpu);
> +            pcpu_schedule_unlock_irqrestore(*lock, *flags, cpu);
>  =20
>               raise_softirq(SCHED_SLAVE_SOFTIRQ);
>               sched_context_switch(vprev, vprev, false, now);
> @@ -2538,11 +2539,11 @@ static struct sched_unit *sched_wait_rendezvous=
_in(struct sched_unit *prev,
>               return NULL;         /* ARM only. */
>           }
>  =20
> -        pcpu_schedule_unlock_irq(*lock, cpu);
> +        pcpu_schedule_unlock_irqrestore(*lock, *flags, cpu);
>  =20
>           cpu_relax();
>  =20
> -        *lock =3D pcpu_schedule_lock_irq(cpu);
> +        *lock =3D pcpu_schedule_lock_irqsave(cpu, flags);
>  =20
>           /*
>            * Check for scheduling resource switched. This happens when =
we are
> @@ -2557,7 +2558,7 @@ static struct sched_unit *sched_wait_rendezvous_i=
n(struct sched_unit *prev,
>               ASSERT(is_idle_unit(prev));
>               atomic_set(&prev->next_task->rendezvous_out_cnt, 0);
>               prev->rendezvous_in_cnt =3D 0;
> -            pcpu_schedule_unlock_irq(*lock, cpu);
> +            pcpu_schedule_unlock_irqrestore(*lock, *flags, cpu);
>               rcu_read_unlock(&sched_res_rculock);
>               return NULL;
>           }
> @@ -2574,12 +2575,13 @@ static void sched_slave(void)
>       spinlock_t           *lock;
>       bool                  do_softirq =3D false;
>       unsigned int          cpu =3D smp_processor_id();
> +    unsigned long         flags;
>  =20
>       ASSERT_NOT_IN_ATOMIC();
>  =20
>       rcu_read_lock(&sched_res_rculock);
>  =20
> -    lock =3D pcpu_schedule_lock_irq(cpu);
> +    lock =3D pcpu_schedule_lock_irqsave(cpu, &flags);
>  =20
>       now =3D NOW();
>  =20
> @@ -2590,7 +2592,7 @@ static void sched_slave(void)
>  =20
>           if ( v )
>           {
> -            pcpu_schedule_unlock_irq(lock, cpu);
> +            pcpu_schedule_unlock_irqrestore(lock, flags, cpu);
>  =20
>               sched_context_switch(vprev, v, false, now);
>  =20
> @@ -2602,7 +2604,7 @@ static void sched_slave(void)
>  =20
>       if ( !prev->rendezvous_in_cnt )
>       {
> -        pcpu_schedule_unlock_irq(lock, cpu);
> +        pcpu_schedule_unlock_irqrestore(lock, flags, cpu);
>  =20
>           rcu_read_unlock(&sched_res_rculock);
>  =20
> @@ -2615,11 +2617,11 @@ static void sched_slave(void)
>  =20
>       stop_timer(&get_sched_res(cpu)->s_timer);
>  =20
> -    next =3D sched_wait_rendezvous_in(prev, &lock, cpu, now);
> +    next =3D sched_wait_rendezvous_in(prev, &lock, &flags, cpu, now);
>       if ( !next )
>           return;
>  =20
> -    pcpu_schedule_unlock_irq(lock, cpu);
> +    pcpu_schedule_unlock_irqrestore(lock, flags, cpu);
>  =20
>       sched_context_switch(vprev, sched_unit2vcpu_cpu(next, cpu),
>                            is_idle_unit(next) && !is_idle_unit(prev), n=
ow);
> @@ -2637,6 +2639,7 @@ static void schedule(void)
>       s_time_t              now;
>       struct sched_resource *sr;
>       spinlock_t           *lock;
> +    unsigned long         flags;
>       int cpu =3D smp_processor_id();
>       unsigned int          gran;
>  =20
> @@ -2646,7 +2649,7 @@ static void schedule(void)
>  =20
>       rcu_read_lock(&sched_res_rculock);
>  =20
> -    lock =3D pcpu_schedule_lock_irq(cpu);
> +    lock =3D pcpu_schedule_lock_irqsave(cpu, &flags);
>  =20
>       sr =3D get_sched_res(cpu);
>       gran =3D sr->granularity;
> @@ -2657,7 +2660,7 @@ static void schedule(void)
>            * We have a race: sched_slave() should be called, so raise a=
 softirq
>            * in order to re-enter schedule() later and call sched_slave=
() now.
>            */
> -        pcpu_schedule_unlock_irq(lock, cpu);
> +        pcpu_schedule_unlock_irqrestore(lock, flags, cpu);
>  =20
>           rcu_read_unlock(&sched_res_rculock);
>  =20
> @@ -2676,7 +2679,7 @@ static void schedule(void)
>           prev->rendezvous_in_cnt =3D gran;
>           cpumask_andnot(mask, sr->cpus, cpumask_of(cpu));
>           cpumask_raise_softirq(mask, SCHED_SLAVE_SOFTIRQ);
> -        next =3D sched_wait_rendezvous_in(prev, &lock, cpu, now);
> +        next =3D sched_wait_rendezvous_in(prev, &lock, &flags, cpu, no=
w);
>           if ( !next )
>               return;
>       }
> @@ -2687,7 +2690,7 @@ static void schedule(void)
>           atomic_set(&next->rendezvous_out_cnt, 0);
>       }
>  =20
> -    pcpu_schedule_unlock_irq(lock, cpu);
> +    pcpu_schedule_unlock_irqrestore(lock, flags, cpu);
>  =20
>       vnext =3D sched_unit2vcpu_cpu(next, cpu);
>       sched_context_switch(vprev, vnext,
>=20


--------------9E3D4271ACE632562E1CB367
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
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

--------------9E3D4271ACE632562E1CB367--

--90dSW4K7AGrBTbuCGBLPvpLH1tLm7uEIH--

--pCfBWb9QPFsr4MRSolY7kw1TRfAHKnqoQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB4BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmA0wmsFAwAAAAAACgkQsN6d1ii/Ey9P
Igf3SnsyG0rDRCsIe6iKgPryLM6LTNlH4Xy54m8ksV5+5DCXRQOms6Casc66APflJj426Y/G445J
FivS2JuAgPT0DmeloHMKjAiSUBJIRK/YN2VqA2avMaGpTX6dnXzsfyDy8vRpf3RhBqaqXeG9lmvF
VlWT8GvCM4Z+uvAAbif19CHuuKpmr7skWSAk9o58SEOg9sTiODdyt10d6zKTFqChrNlQkrool9qi
bYEogwwWs34JTVBvXoYM9iAlfg2QwTtFI6xLHOs9zZlh+wuRB3N+/QVtLFlHXtG4tB2jI3+BdOxB
I6TVYFm9jW30sss0b01QvzqU8MpSdrIggVBoscxp
=1TRy
-----END PGP SIGNATURE-----

--pCfBWb9QPFsr4MRSolY7kw1TRfAHKnqoQ--

