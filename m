Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAD14322D3
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 17:29:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212440.370308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcUZ5-0002J0-NL; Mon, 18 Oct 2021 15:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212440.370308; Mon, 18 Oct 2021 15:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcUZ5-0002HB-Js; Mon, 18 Oct 2021 15:28:39 +0000
Received: by outflank-mailman (input) for mailman id 212440;
 Mon, 18 Oct 2021 15:28:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6zTk=PG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mcUZ3-0002H5-K0
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 15:28:37 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0efe71cd-3028-11ec-82dc-12813bfff9fa;
 Mon, 18 Oct 2021 15:28:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 23DCD21961;
 Mon, 18 Oct 2021 15:28:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D620713E74;
 Mon, 18 Oct 2021 15:28:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id U4d7MqKSbWFPHgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 18 Oct 2021 15:28:34 +0000
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
X-Inumbo-ID: 0efe71cd-3028-11ec-82dc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634570915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QFjP2hNYhxPS6S4BoqPzQbGj+c/hgrgoGlj9aGHN00Q=;
	b=N0MXcy2X0L9n4swS1ptdmE6KQ41i7GdI1G2/G1r3B8NEKvMU0LoEUcgeBzSFo+8iWKQkL5
	dArlO9Ap4tF6FFJUJd2zvKDGRPNCurELDjCeKdv2H1hB1cZZEebhI/EjiOCFUjL2W3X1xE
	KIHxt28d9Rd2Ow5ihIzZ1SpO1YyBWgE=
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-7-jgross@suse.com>
 <e5f55c9e-5615-7d10-c86c-db1a3c724f43@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 06/12] xen: generate hypercall interface related code
Message-ID: <e547b584-54e6-3227-82a8-ff1301eddb21@suse.com>
Date: Mon, 18 Oct 2021 17:28:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <e5f55c9e-5615-7d10-c86c-db1a3c724f43@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2RKxFNcEw5MU18cdbwBvKt3FP4g34xJQK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2RKxFNcEw5MU18cdbwBvKt3FP4g34xJQK
Content-Type: multipart/mixed; boundary="0lJ9s4wegrUNL2FbXAwlKyrFlW1RG0e4Z";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <e547b584-54e6-3227-82a8-ff1301eddb21@suse.com>
Subject: Re: [PATCH 06/12] xen: generate hypercall interface related code
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-7-jgross@suse.com>
 <e5f55c9e-5615-7d10-c86c-db1a3c724f43@suse.com>
In-Reply-To: <e5f55c9e-5615-7d10-c86c-db1a3c724f43@suse.com>

--0lJ9s4wegrUNL2FbXAwlKyrFlW1RG0e4Z
Content-Type: multipart/mixed;
 boundary="------------8A7DC5D6DB39D196B931251F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8A7DC5D6DB39D196B931251F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.10.21 14:58, Jan Beulich wrote:
> On 15.10.2021 14:51, Juergen Gross wrote:
>> Instead of repeating similar data multiple times use a single source
>> file and a generator script for producing prototypes and call sequence=
s
>> of the hypercalls.
>>
>> As the script already knows the number of parameters used add generati=
ng
>> a macro for populating an array with the number of parameters per
>> hypercall.
>=20
> Isn't that array intended to go away?

I thought so, yes, but on Arm there is a case where it is needed.

So generating it from the available data is the sensible thing to do
IMO.

>=20
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -332,10 +332,12 @@ xen/include/asm-x86/asm-macros.h
>>   xen/include/compat/*
>>   xen/include/config/
>>   xen/include/generated/
>> +xen/include//hypercall-defs.i
>=20
> Nit: Stray double slash (unless this has a meaning I'm unaware of).

Oh, right. No special meaning AFAIK.

> Yet then I wonder: Shouldn't *.i be among the patterns at the top of
> the file, like *.o is?

Yes, I can do that. Probably via a separate patch then.
>> @@ -466,6 +468,14 @@ include/asm-$(TARGET_ARCH)/asm-offsets.h: asm-off=
sets.s
>>   	  echo ""; \
>>   	  echo "#endif") <$< >$@
>>  =20
>> +quiet_cmd_genhyp =3D GEN     $@
>> +define cmd_genhyp
>> +    awk -f scripts/gen_hypercall.awk <$< >$@
>> +endef
>> +
>> +include/xen/hypercall-defs.h: include/hypercall-defs.i scripts/gen_hy=
percall.awk FORCE
>> +	$(call if_changed,genhyp)
>=20
> As per patch 5 there are quite a few sources including xen/hypercall.h
> and hence (in one of the next patches) the header generated here. If
> this one gets re-generated for a benign reason (i.e. without changing
> the header), all dependents will get rebuilt for no reason. Use
> $(move-if-changed ...)?

The reasons for re-generating are quite limited. The most probable case
is a .config change, which will trigger quite some rebuild anyway.

If you think its is really worth the effort, I can use move-if-changed.

>=20
>> +prefix: do
>> +set_timer_op(s_time_t timeout)
>> +console_io(unsigned int cmd, unsigned int count, char *buffer)
>> +vm_assist(unsigned int cmd, unsigned int type)
>> +event_channel_op(int cmd, void *arg)
>> +mmuext_op(mmuext_op_t *uops, unsigned int count, unsigned int *pdone,=
 unsigned int foreigndom)
>> +multicall(multicall_entry_t *call_list, unsigned int nr_calls)
>> +#ifdef CONFIG_PV
>> +mmu_update(mmu_update_t *ureqs, unsigned int count, unsigned int *pdo=
ne, unsigned int foreigndom)
>> +stack_switch(unsigned long ss, unsigned long esp)
>> +fpu_taskswitch(int set)
>> +set_debugreg(int reg, unsigned long value)
>> +get_debugreg(int reg)
>> +set_segment_base(unsigned int which, unsigned long base)
>> +mca(xen_mc_t *u_xen_mc)
>> +set_trap_table(const_trap_info_t *traps)
>> +set_gdt(xen_ulong_t *frame_list, unsigned int entries)
>> +set_callbacks(unsigned long event_address, unsigned long failsafe_add=
ress, unsigned long syscall_address)
>> +update_descriptor(uint64_t gaddr, seg_desc_t desc)
>> +update_va_mapping(unsigned long va, uint64_t val64, unsigned long fla=
gs)
>> +update_va_mapping_otherdomain(unsigned long va, uint64_t val64, unsig=
ned long flags, domid_t domid)
>> +#endif
>> +#ifdef CONFIG_IOREQ_SERVER
>> +dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
>> +#endif
>> +#ifndef CONFIG_PV_SHIM_EXCLUSIVE
>> +sysctl(xen_sysctl_t *u_sysctl)
>> +domctl(xen_domctl_t *u_domctl)
>> +paging_domctl_cont(xen_domctl_t *u_domctl)
>> +#endif
>> +#ifdef CONFIG_HVM
>> +hvm_op(unsigned long op, void *arg)
>> +#endif
>> +#ifdef CONFIG_HYPFS
>> +hypfs_op(unsigned int cmd, const char *arg1, unsigned long arg2, void=
 *arg3, unsigned long arg4)
>> +#endif
>> +#ifdef CONFIG_X86
>> +xenpmu_op(unsigned int op, xen_pmu_params_t *arg)
>> +#endif
>> +
>> +#ifdef CONFIG_PV
>> +caller: pv64
>> +#ifdef CONFIG_PV32
>> +caller: pv32
>> +#endif
>> +#endif
>> +#ifdef CONFIG_HVM
>> +caller: hvm64
>> +#ifdef CONFIG_COMPAT
>> +caller: hvm32
>> +#endif
>=20
> HVM selects COMPAT, so I don't see a point in this inner conditional.

Ah, indeed.

>=20
>> +#endif
>> +#ifdef CONFIG_ARM
>> +caller: arm
>> +#endif
>> +
>> +table:                             pv32    pv64    hvm32   hvm64   ar=
m
>> +set_trap_table                     compat  do      -       -       -
>> +mmu_update                         do      do      -       -       -
>> +set_gdt                            compat  do      -       -       -
>> +stack_switch                       do      do      -       -       -
>> +set_callbacks                      compat  do      -       -       -
>> +fpu_taskswitch                     do      do      -       -       -
>> +sched_op_compat                    do      do      -       -       de=
p
>> +#ifndef CONFIG_PV_SHIM_EXCLUSIVE
>> +platform_op                        compat  do      compat  do      do=

>> +#endif
>> +set_debugreg                       do      do      -       -       -
>> +get_debugreg                       do      do      -       -       -
>> +update_descriptor                  compat  do      -       -       -
>> +memory_op                          compat  do      hvm     hvm     do=

>> +multicall                          compat  do      compat  do      do=

>> +update_va_mapping                  compat  do      -       -       -
>> +set_timer_op                       compat  do      compat  do      -
>> +event_channel_op_compat            do      do      -       -       de=
p
>> +xen_version                        compat  do      compat  do      do=

>> +console_io                         do      do      do      do      do=

>> +physdev_op_compat                  compat  do      -       -       de=
p
>> +#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
>> +grant_table_op                     compat  do      hvm     hvm     do=

>> +#endif
>> +vm_assist                          do      do      do      do      do=

>> +update_va_mapping_otherdomain      compat  do      -       -       -
>> +iret                               compat  do      -       -       -
>> +vcpu_op                            compat  do      compat  do      do=

>> +set_segment_base                   do      do      -       -       -
>> +#ifdef CONFIG_PV
>> +mmuext_op                          compat  do      compat  do      -
>> +#endif
>> +xsm_op                             compat  do      compat  do      do=

>> +nmi_op                             compat  do      -       -       -
>> +sched_op                           compat  do      compat  do      do=

>> +callback_op                        compat  do      -       -       -
>> +#ifdef CONFIG_XENOPROF
>> +xenoprof_op                        compat  do      -       -       -
>> +#endif
>> +event_channel_op                   do      do      do      do      do=

>> +physdev_op                         compat  do      hvm     hvm     do=

>> +#ifdef CONFIG_HVM
>> +hvm_op                             do      do      do      do      do=

>> +#endif
>> +#ifndef CONFIG_PV_SHIM_EXCLUSIVE
>> +sysctl                             do      do      do      do      do=

>> +domctl                             do      do      do      do      do=

>> +#endif
>> +#ifdef CONFIG_KEXEC
>> +kexec_op                           compat  do      -       -       -
>> +#endif
>> +tmem_op                            -       -       -       -       -
>> +#ifdef CONFIG_ARGO
>> +argo_op                            compat  do      compat  do      do=

>> +#endif
>> +xenpmu_op                          do      do      do      do      -
>> +#ifdef CONFIG_IOREQ_SERVER
>> +dm_op                              compat  do      compat  do      do=

>> +#endif
>> +#ifdef CONFIG_HYPFS
>> +hypfs_op                           do      do      do      do      do=

>> +#endif
>> +mca                                do      do      -       -       -
>> +#ifndef CONFIG_PV_SHIM_EXCLUSIVE
>> +paging_domctl_cont                 do      do      do      do      -
>> +#endif
>=20
> I assume the intention here is to sort by hypercall number. This result=
s
> in 3 PV_SHIM_EXCLUSIVE conditionals when one might do. Just a remark fo=
r
> consideration, not strictly a request to change anything.

I intentionally sorted this by hypercall number, yes.

This makes it much easier to spot any missing case IMO. I can change
that if wanted.


Juergen

--------------8A7DC5D6DB39D196B931251F
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

--------------8A7DC5D6DB39D196B931251F--

--0lJ9s4wegrUNL2FbXAwlKyrFlW1RG0e4Z--

--2RKxFNcEw5MU18cdbwBvKt3FP4g34xJQK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFtkqIFAwAAAAAACgkQsN6d1ii/Ey8H
/AgAgRCUdtNbHokndjUFVftflThctHR7C/GWJ5NJvOJwJiuvai0u0eSG9uQtLnhWlLMo70ZTC1Xz
D/uI6uCfKoGxrJogiSikp4A6Bm45gC7uyzJ35GcDr9d41MHhpx+niC17/xxK+WM5OvDPnDsUW985
5BL5mY1Tcu+mELqwHNssCKGTBl6q6iqmtsplavCtzF1IUnZ9rWWB8HwDsHS6S9YBuVCuemnfY9CK
LbTgSGLv161yb5Wt0aGooNu6cN+pEFuiLMPqZZP1TFhBqV6Frav0qxakUdI38dl36ynueUckhJYD
Esr0KQWrSjh5rKgJvISHfaW3zqjs33NsoPWQfS4iYQ==
=38Tw
-----END PGP SIGNATURE-----

--2RKxFNcEw5MU18cdbwBvKt3FP4g34xJQK--

