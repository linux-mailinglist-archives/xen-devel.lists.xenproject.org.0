Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4146445D8A0
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:02:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230868.399102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCUr-0000mv-Sr; Thu, 25 Nov 2021 11:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230868.399102; Thu, 25 Nov 2021 11:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCUr-0000jz-P7; Thu, 25 Nov 2021 11:00:57 +0000
Received: by outflank-mailman (input) for mailman id 230868;
 Thu, 25 Nov 2021 11:00:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ia/m=QM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mqCUq-0000jt-KQ
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:00:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f61e58d3-4dde-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 12:00:55 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 97C802193C;
 Thu, 25 Nov 2021 11:00:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1CBCD13466;
 Thu, 25 Nov 2021 11:00:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JcWZBOZsn2HtUQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 25 Nov 2021 11:00:54 +0000
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
X-Inumbo-ID: f61e58d3-4dde-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637838054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NDeBCeEDHfhcuV9LoQQGH8DRzUoHtcpF+S1lG8XAmDc=;
	b=fSGDAl1/wR0xexqTNERUnDbRCqcGzrf36fXk0U8Vy8829LwowfxZuyPRowQ1GVaTmE5sKD
	oBG29X+5oWuvsrL7v71ISYfMyr3uulguvENQqnFNYcN+AY+lQPrebOvGLMjFFtW9/+u6rP
	yqAMzRENTLG4CcjMUOgX9QDeCHle8yw=
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-4-jgross@suse.com>
 <b1599a82-052f-9369-3774-69c5c570370c@suse.com>
 <5ea7400b-448b-039b-6d95-2552c9ae7cd4@suse.com>
 <e64c22c7-992b-9fdf-a276-263e9173a313@suse.com>
 <fffb492e-f570-069b-7355-c00f48215dad@suse.com>
 <8512f6a7-0b79-8fff-49fb-80c3d8a7a436@suse.com>
 <db2a0bc9-386e-3198-f8f8-95121571abdc@suse.com>
 <587fd950-ffdc-1888-5f97-2ea142069f57@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 3/4] xen: add new stable control hypercall
Message-ID: <5c3a28f5-6620-7e5e-03ef-454d26a7aa01@suse.com>
Date: Thu, 25 Nov 2021 12:00:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <587fd950-ffdc-1888-5f97-2ea142069f57@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Icn0KwlSQM6w454Fv5RqYpqmo7NkxVfWo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Icn0KwlSQM6w454Fv5RqYpqmo7NkxVfWo
Content-Type: multipart/mixed; boundary="IERTyVQq9c6wSQKBEfbNSf3OzItntHnep";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5c3a28f5-6620-7e5e-03ef-454d26a7aa01@suse.com>
Subject: Re: [PATCH RFC 3/4] xen: add new stable control hypercall
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-4-jgross@suse.com>
 <b1599a82-052f-9369-3774-69c5c570370c@suse.com>
 <5ea7400b-448b-039b-6d95-2552c9ae7cd4@suse.com>
 <e64c22c7-992b-9fdf-a276-263e9173a313@suse.com>
 <fffb492e-f570-069b-7355-c00f48215dad@suse.com>
 <8512f6a7-0b79-8fff-49fb-80c3d8a7a436@suse.com>
 <db2a0bc9-386e-3198-f8f8-95121571abdc@suse.com>
 <587fd950-ffdc-1888-5f97-2ea142069f57@suse.com>
In-Reply-To: <587fd950-ffdc-1888-5f97-2ea142069f57@suse.com>

--IERTyVQq9c6wSQKBEfbNSf3OzItntHnep
Content-Type: multipart/mixed;
 boundary="------------A17716D857B0CCF3B2E537E9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A17716D857B0CCF3B2E537E9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 25.11.21 11:51, Jan Beulich wrote:
> On 25.11.2021 11:33, Juergen Gross wrote:
>> On 25.11.21 11:19, Jan Beulich wrote:
>>> On 25.11.2021 11:12, Juergen Gross wrote:
>>>> On 25.11.21 10:38, Jan Beulich wrote:
>>>>> On 25.11.2021 07:55, Juergen Gross wrote:
>>>>>> On 22.11.21 16:39, Jan Beulich wrote:
>>>>>>> On 14.09.2021 14:35, Juergen Gross wrote:
>>>>>>>> @@ -103,6 +104,43 @@ void domain_reset_states(void)
>>>>>>>>          rcu_read_unlock(&domlist_read_lock);
>>>>>>>>      }
>>>>>>>>     =20
>>>>>>>> +int domain_get_dom_state_changed(struct xen_control_changed_dom=
ain *info)
>>>>>>>> +{
>>>>>>>> +    unsigned int dom;
>>>>>>>> +    struct domain *d;
>>>>>>>> +
>>>>>>>> +    while ( (dom =3D find_first_bit(dom_state_changed, DOMID_MA=
SK + 1)) <
>>>>>>>> +            DOMID_FIRST_RESERVED )
>>>>>>>
>>>>>>> As per my comment on the earlier patch - the use of DOMID_MASK + =
1 vs
>>>>>>> is quite puzzling here.
>>>>>>
>>>>>> Okay, will change that.
>>>>>>
>>>>>>>
>>>>>>>> +    {
>>>>>>>> +        d =3D rcu_lock_domain_by_id(dom);
>>>>>>>> +
>>>>>>>> +        if ( test_and_clear_bit(dom, dom_state_changed) )
>>>>>>>> +        {
>>>>>>>> +            info->domid =3D dom;
>>>>>>>> +            if ( d )
>>>>>>>> +            {
>>>>>>>> +                info->state =3D XEN_CONTROL_CHANGEDDOM_STATE_EX=
IST;
>>>>>>>> +                if ( d->is_shut_down )
>>>>>>>> +                    info->state |=3D XEN_CONTROL_CHANGEDDOM_STA=
TE_SHUTDOWN;
>>>>>>>> +                if ( d->is_dying =3D=3D DOMDYING_dead )
>>>>>>>> +                    info->state |=3D XEN_CONTROL_CHANGEDDOM_STA=
TE_DYING;
>>>>>>>> +                info->unique_id =3D d->unique_id;
>>>>>>>> +
>>>>>>>> +                rcu_unlock_domain(d);
>>>>>>>> +            }
>>>>>>>> +
>>>>>>>> +            return 0;
>>>>>>>
>>>>>>> With rapid creation of short lived domains, will the caller ever =
get to
>>>>>>> see information on higher numbered domains (if, say, it gets "sui=
tably"
>>>>>>> preempted within its own environment)? IOW shouldn't there be a w=
ay for
>>>>>>> the caller to specify a domid to start from?
>>>>>>
>>>>>> I'd rather have a local variable for the last reported domid and s=
tart
>>>>>> from that.
>>>>>
>>>>> Well, it probably doesn't matter much to have yet one more aspect m=
aking
>>>>> this a single-consumer-only interface.
>>>>
>>>> For making it an interface consumable by multiple users you'd need t=
o
>>>> have a per-consumer data set, which would include the bitmap of chan=
ged
>>>> domains and could include the domid last tested.
>>>>
>>>> As one consumer is Xenstore, and Xenstore can run either in a dedica=
ted
>>>> domain or in dom0, I believe a multiple user capable interface would=

>>>> even need to support multiple users in the same domain, which would =
be
>>>> even more complicated. So I continue to be rather hesitant to add th=
is
>>>> additional complexity with only some vague idea of "might come handy=
 in
>>>> the future".
>>>>
>>>>>
>>>>>>>> +/*
>>>>>>>> + * XEN_CONTROL_OP_get_state_changed_domain
>>>>>>>> + *
>>>>>>>> + * Get information about a domain having changed state and rese=
t the state
>>>>>>>> + * change indicator for that domain. This function is usable on=
ly by a domain
>>>>>>>> + * having registered the VIRQ_DOM_EXC event (normally Xenstore)=
=2E
>>>>>>>> + *
>>>>>>>> + * arg: XEN_GUEST_HANDLE(struct xen_control_changed_domain)
>>>>>>>> + *
>>>>>>>> + * Possible return values:
>>>>>>>> + * 0: success
>>>>>>>> + * <0 : negative Xen errno value
>>>>>>>> + */
>>>>>>>> +#define XEN_CONTROL_OP_get_state_changed_domain     1
>>>>>>>> +struct xen_control_changed_domain {
>>>>>>>> +    domid_t domid;
>>>>>>>> +    uint16_t state;
>>>>>>>> +#define XEN_CONTROL_CHANGEDDOM_STATE_EXIST     0x0001  /* Domai=
n is existing. */
>>>>>>>> +#define XEN_CONTROL_CHANGEDDOM_STATE_SHUTDOWN  0x0002  /* Shutd=
own finished. */
>>>>>>>> +#define XEN_CONTROL_CHANGEDDOM_STATE_DYING     0x0004  /* Domai=
n dying. */
>>>>>>>> +    uint32_t pad1;           /* Returned as 0. */
>>>>>>>> +    uint64_t unique_id;      /* Unique domain identifier. */
>>>>>>>> +    uint64_t pad2[6];        /* Returned as 0. */
>>>>>>>
>>>>>>> I think the padding fields have to be zero on input, not just on =
return.
>>>>>>
>>>>>> I don't see why this would be needed, as this structure is only ev=
er
>>>>>> copied to the caller, so "on input" just doesn't apply here.
>>>>>>
>>>>>>> Unless you mean to mandate them to be OUT only now and forever. I=
 also
>>>>>>
>>>>>> The whole struct is OUT only.
>>>>>
>>>>> Right now, yes. I wouldn't exclude "pad1" to become a flags field,
>>>>> controlling some future behavioral aspect of the operation.
>>>>
>>>> Right now I don't see the need for that, see my reasoning above.
>>>
>>> If your reference is to the single consumer aspect, then I don't see
>>> why that would matter here. Future xenstore may want/need to make
>>> use of such a future flag, yet older xenstore still wouldn't know
>>> about it.
>>
>> I'm not sure it is a good idea to mix IN and OUT fields in such a stru=
ct
>> which is meant to return information only.
>>
>> I'd rather add a new sub-op in this case taking another parameter for
>> specifying additional options or a struct prepending the needed IN
>> fields to above struct.
>=20
> Well, okay. May ask for a /* OUT */ comment then ahead of the first of
> the struct fields?

Yes, will add it.

>=20
>>>>>>> wonder how the trailing padding plays up with the version sub-op:=
 Do we
>>>>>>> really need such double precaution?
>>>>>>
>>>>>> I can remove it.
>>>>>>
>>>>>>> Also - should we use uint64_aligned_t here?
>>>>>>
>>>>>> Yes.
>>>>>
>>>>> But you realize this isn't straightforward, for the type not being
>>>>> available in plain C89 (nor C99)? That's why it's presently used in=

>>>>> tools-only interfaces only, and the respective header are excluded
>>>>> from the "is ANSI compatible" checking (memory.h and hvm/dm_op.h
>>>>> have special but imo crude "precautions").
>>>>
>>>> No, I didn't realize that. I just looked how it is used today and
>>>> agreed I should follow current usage.
>>>>
>>>> But even with using a stable interface I'm not sure we need to make =
it
>>>> strictly ANSI compatible, as usage of this interface will still be
>>>> restricted to tools.
>>>
>>> True. Problem is that our present __XEN_TOOLS__ guards have effective=
ly
>>> dual meaning - "tools only" and "unstable". We merely need to be sure=

>>> everyone understands that this is changing. Perhaps when you add such=
 a
>>> guard here, it may want accompanying by a respective comment.
>>
>> I'd be fine with that.
>>
>> Maybe we want a new guard "__XEN_INTERNAL__" for that (new) purpose?
>=20
> Not sure - this may result in undesirable code churn elsewhere.

I won't insist on it. :-)


Juergen

--------------A17716D857B0CCF3B2E537E9
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

--------------A17716D857B0CCF3B2E537E9--

--IERTyVQq9c6wSQKBEfbNSf3OzItntHnep--

--Icn0KwlSQM6w454Fv5RqYpqmo7NkxVfWo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGfbOUFAwAAAAAACgkQsN6d1ii/Ey9u
dwf+JVvv2iGy/tK/Z/oTG06w1xkhJlYBWUDgiKX0nqCn7sCpmt7aV/gUabpFs8SYyzjXnR25J5Br
r5iHXDocvueC6ycGlOtwoKCmWwOMvIgFrDyqgUPBjS7NsxLEViDCoKtE68vCcuwBrHTDmqPf1ji0
B0ZNXyuem8MW+Z4ryAhiDv7OJ6sXb+j5lFiOiQX52n6+NCtkxD8cdBbLJ7r87nt+nxSrdjxotxNA
JBTX3ZUo7CwNKq6xZX24zOBOHe2ooiwsB1NCC4PIjuLAXuynHpi+/Qq1pWv7ou/WoQjxdKoUowN2
OGcQBkK6F2100aWJgUSelJVq4y1K6bAQejKHrkjsDg==
=cIe1
-----END PGP SIGNATURE-----

--Icn0KwlSQM6w454Fv5RqYpqmo7NkxVfWo--

