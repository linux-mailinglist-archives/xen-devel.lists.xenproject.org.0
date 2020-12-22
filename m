Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D932E05D7
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 06:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57640.100928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kraWt-0000xN-GJ; Tue, 22 Dec 2020 05:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57640.100928; Tue, 22 Dec 2020 05:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kraWt-0000wy-CR; Tue, 22 Dec 2020 05:48:15 +0000
Received: by outflank-mailman (input) for mailman id 57640;
 Tue, 22 Dec 2020 05:48:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xN4y=F2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kraWr-0000wt-TA
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 05:48:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d15dd0cc-6006-486e-8c06-c61a2d16af39;
 Tue, 22 Dec 2020 05:48:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3CC72AC63;
 Tue, 22 Dec 2020 05:48:11 +0000 (UTC)
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
X-Inumbo-ID: d15dd0cc-6006-486e-8c06-c61a2d16af39
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608616091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sgj1oDj20FaqvojIiBYkspp1MXr9eQlsW86rFhnOuN4=;
	b=JvI3TzeOIhEbwstuUMkn+FiIfEvQXQkOh2jqzoVeoNGshCTz7fuAv39kcf0n70Wm4At26u
	4vNuPZL0gsHy0dxKbSpP7lttx0dEQoFr41e0Ifz2oW0mpxtpsB4yqRZE0CnlDS6VyKpfSg
	e2LJiQlZuIu6xYntBZ/bnwMcvbkEbc0=
Subject: Re: [PATCH v5 1/3] xen/arm: add support for
 run_in_exception_handler()
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201215063319.23290-1-jgross@suse.com>
 <20201215063319.23290-2-jgross@suse.com>
 <94e85d88-b0f0-01f6-99e0-386326bc044a@suse.com>
 <2ffa6302-5368-61c6-8564-6d3f828e2163@xen.org>
 <26480338-56f4-6a61-e776-78727fce0910@suse.com>
 <93d71f68-c561-6fe0-8433-66745d153217@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1411b326-a0b6-b086-51d1-9827b43587fa@suse.com>
Date: Tue, 22 Dec 2020 06:48:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <93d71f68-c561-6fe0-8433-66745d153217@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xq0RyeyQscSAyELZXxYI8cr4HO1zef9zh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xq0RyeyQscSAyELZXxYI8cr4HO1zef9zh
Content-Type: multipart/mixed; boundary="UVPciloastc1eekVqdZTuv8lX978t8p5I";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <1411b326-a0b6-b086-51d1-9827b43587fa@suse.com>
Subject: Re: [PATCH v5 1/3] xen/arm: add support for
 run_in_exception_handler()
References: <20201215063319.23290-1-jgross@suse.com>
 <20201215063319.23290-2-jgross@suse.com>
 <94e85d88-b0f0-01f6-99e0-386326bc044a@suse.com>
 <2ffa6302-5368-61c6-8564-6d3f828e2163@xen.org>
 <26480338-56f4-6a61-e776-78727fce0910@suse.com>
 <93d71f68-c561-6fe0-8433-66745d153217@xen.org>
In-Reply-To: <93d71f68-c561-6fe0-8433-66745d153217@xen.org>

--UVPciloastc1eekVqdZTuv8lX978t8p5I
Content-Type: multipart/mixed;
 boundary="------------70B7CDF08F13852D6285050C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------70B7CDF08F13852D6285050C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 21.12.20 17:50, Julien Grall wrote:
> Hi Jan,
>=20
> On 15/12/2020 13:59, Jan Beulich wrote:
>> On 15.12.2020 14:39, Julien Grall wrote:
>>> On 15/12/2020 09:02, Jan Beulich wrote:
>>>> On 15.12.2020 07:33, Juergen Gross wrote:
>>>>> --- a/xen/include/asm-arm/bug.h
>>>>> +++ b/xen/include/asm-arm/bug.h
>>>>> @@ -15,65 +15,62 @@
>>>>> =C2=A0=C2=A0 struct bug_frame {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 signed int loc_disp;=C2=A0=C2=A0=
=C2=A0 /* Relative address to the bug=20
>>>>> address */
>>>>> -=C2=A0=C2=A0=C2=A0 signed int file_disp;=C2=A0=C2=A0 /* Relative a=
ddress to the filename */
>>>>> +=C2=A0=C2=A0=C2=A0 signed int ptr_disp;=C2=A0=C2=A0=C2=A0 /* Relat=
ive address to the filename or=20
>>>>> function */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 signed int msg_disp;=C2=A0=C2=A0=
=C2=A0 /* Relative address to the predicate=20
>>>>> (for ASSERT) */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint16_t line;=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Line number */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t pad0:16;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* Padding for 8-bytes align */
>>>>> =C2=A0=C2=A0 };
>>>>> =C2=A0=C2=A0 #define bug_loc(b) ((const void *)(b) + (b)->loc_disp)=

>>>>> -#define bug_file(b) ((const void *)(b) + (b)->file_disp);
>>>>> +#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp);
>>>>> =C2=A0=C2=A0 #define bug_line(b) ((b)->line)
>>>>> =C2=A0=C2=A0 #define bug_msg(b) ((const char *)(b) + (b)->msg_disp)=

>>>>> -#define BUGFRAME_warn=C2=A0=C2=A0 0
>>>>> -#define BUGFRAME_bug=C2=A0=C2=A0=C2=A0 1
>>>>> -#define BUGFRAME_assert 2
>>>>> +#define BUGFRAME_run_fn 0
>>>>> +#define BUGFRAME_warn=C2=A0=C2=A0 1
>>>>> +#define BUGFRAME_bug=C2=A0=C2=A0=C2=A0 2
>>>>> +#define BUGFRAME_assert 3
>>>>> -#define BUGFRAME_NR=C2=A0=C2=A0=C2=A0=C2=A0 3
>>>>> +#define BUGFRAME_NR=C2=A0=C2=A0=C2=A0=C2=A0 4
>>>>> =C2=A0=C2=A0 /* Many versions of GCC doesn't support the asm %c par=
ameter=20
>>>>> which would
>>>>> =C2=A0=C2=A0=C2=A0 * be preferable to this unpleasantness. We use m=
ergeable string
>>>>> =C2=A0=C2=A0=C2=A0 * sections to avoid multiple copies of the strin=
g appearing in the
>>>>> =C2=A0=C2=A0=C2=A0 * Xen image.
>>>>> =C2=A0=C2=A0=C2=A0 */
>>>>> -#define BUG_FRAME(type, line, file, has_msg, msg) do=20
>>>>> {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> +#define BUG_FRAME(type, line, ptr, msg) do=20
>>>>> {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON((line) >>=20
>>>>> 16);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON((type) >=3D=20
>>>>> BUGFRAME_NR);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm=20
>>>>> ("1:"BUG_INSTR"\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".pushsection .ro=
data.str, \"aMS\", %progbits,=20
>>>>> 1\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2:\t.asciz " __s=
tringify(file)=20
>>>>> "\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> -        =20
>>>>> "3:\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
\
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".if " #has_msg=20
>>>>> "\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "\t.asciz " #msg =

>>>>> "\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> -        =20
>>>>> ".endif\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> -        =20
>>>>> ".popsection\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".pushsection .bu=
g_frames." __stringify(type) ", \"a\",=20
>>>>> %progbits\n"\
>>>>> -        =20
>>>>> "4:\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
\
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".pushsection .bu=
g_frames." __stringify(type) ", \"a\",=20
>>>>> %%progbits\n"\
>>>>> +        =20
>>>>> "2:\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
\
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
".p2align=20
>>>>> 2\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".long (1b -=20
>>>>> 4b)\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".long (2b -=20
>>>>> 4b)\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".long (3b -=20
>>>>> 4b)\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".long (1b -=20
>>>>> 2b)\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".long (%0 -=20
>>>>> 2b)\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".long (%1 -=20
>>>>> 2b)\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
".hword " __stringify(line) ",=20
>>>>> 0\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> -        =20
>>>>> ".popsection");=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".popsection" :: =
"i" (ptr), "i"=20
>>>>> (msg));=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> =C2=A0=C2=A0 } while (0)
>>>>
>>>> The comment ahead of the construct now looks to be at best stale, if=

>>>> not entirely pointless. The reference to %c looks quite strange here=

>>>> to me anyway - I can only guess it appeared here because on x86 one
>>>> has to use %c to output constants as operands for .long and alike,
>>>> and this was then tried to use on Arm as well without there really
>>>> being a need.
>>>
>>> Well, %c is one the reason why we can't have a common BUG_FRAME
>>> implementation. So I would like to retain this information before
>>> someone wants to consolidate the code and missed this issue.
>>
>> Fair enough, albeit I guess this then could do with re-wording.
>=20
> I agree.
>=20
>>
>>> Regarding the mergeable string section, I agree that the comment in n=
ow
>>> stale. However,=C2=A0 could someone confirm that "i" will still retai=
n the
>>> same behavior as using mergeable string sections?
>>
>> That's depend on compiler settings / behavior.
>=20
> Ok. I wanted to see the difference between before and after but it look=
s=20
> like I can't compile Xen after applying the patch:
>=20
>=20
> In file included from=20
> /home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/xen/lib.h:23:0,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from=20
> /home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/xen/bitmap.h:6,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from bitmap.c:10:
> bitmap.c: In function =E2=80=98bitmap_allocate_region=E2=80=99:
> /home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/asm/bug.h:44:5:=20
> error: asm operand 0 probably doesn=E2=80=99t match constraints [-Werro=
r]
>  =C2=A0=C2=A0=C2=A0=C2=A0 asm ("1:"BUG_INSTR"\n" =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0 ^
> /home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/asm/bug.h:60:5:=20
> note: in expansion of macro =E2=80=98BUG_FRAME=E2=80=99
>  =C2=A0=C2=A0=C2=A0=C2=A0 BUG_FRAME(BUGFRAME_bug,=C2=A0 __LINE__, __FIL=
E__, "");=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~
> /home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/xen/lib.h:25:42: =

> note: in expansion of macro =E2=80=98BUG=E2=80=99
>  =C2=A0#define BUG_ON(p)=C2=A0 do { if (unlikely(p)) BUG();=C2=A0 } whi=
le (0)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ^~~
> bitmap.c:330:2: note: in expansion of macro =E2=80=98BUG_ON=E2=80=99
>  =C2=A0 BUG_ON(pages > BITS_PER_LONG);
>  =C2=A0 ^~~~~~
> /home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/asm/bug.h:44:5:=20
> error: asm operand 1 probably doesn=E2=80=99t match constraints [-Werro=
r]
>  =C2=A0=C2=A0=C2=A0=C2=A0 asm ("1:"BUG_INSTR"\n" =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0 ^
> /home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/asm/bug.h:60:5:=20
> note: in expansion of macro =E2=80=98BUG_FRAME=E2=80=99
>  =C2=A0=C2=A0=C2=A0=C2=A0 BUG_FRAME(BUGFRAME_bug,=C2=A0 __LINE__, __FIL=
E__, "");=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~
> /home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/xen/lib.h:25:42: =

> note: in expansion of macro =E2=80=98BUG=E2=80=99
>  =C2=A0#define BUG_ON(p)=C2=A0 do { if (unlikely(p)) BUG();=C2=A0 } whi=
le (0)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ^~~
> bitmap.c:330:2: note: in expansion of macro =E2=80=98BUG_ON=E2=80=99
>  =C2=A0 BUG_ON(pages > BITS_PER_LONG);
>  =C2=A0 ^~~~~~
> /home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/asm/bug.h:44:5:=20
> error: impossible constraint in =E2=80=98asm=E2=80=99
>  =C2=A0=C2=A0=C2=A0=C2=A0 asm ("1:"BUG_INSTR"\n" =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0 ^
> /home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/asm/bug.h:60:5:=20
> note: in expansion of macro =E2=80=98BUG_FRAME=E2=80=99
>  =C2=A0=C2=A0=C2=A0=C2=A0 BUG_FRAME(BUGFRAME_bug,=C2=A0 __LINE__, __FIL=
E__, "");=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~
> /home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/xen/lib.h:25:42: =

> note: in expansion of macro =E2=80=98BUG=E2=80=99
>  =C2=A0#define BUG_ON(p)=C2=A0 do { if (unlikely(p)) BUG();=C2=A0 } whi=
le (0)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ^~~
> bitmap.c:330:2: note: in expansion of macro =E2=80=98BUG_ON=E2=80=99
>  =C2=A0 BUG_ON(pages > BITS_PER_LONG);
>  =C2=A0 ^~~~~~
> cc1: all warnings being treated as errors
>=20
> I am using GCC 7.5.0 built by Linaro (cross-compiler). Native=20
> compilation with GCC 10.2.1 leads to the same error.
>=20
> @Juergen, which compiler did you use?
>=20

gcc 7.4.0 aarch64 cross-compiler (SUSE)


Juergen

--------------70B7CDF08F13852D6285050C
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

--------------70B7CDF08F13852D6285050C--

--UVPciloastc1eekVqdZTuv8lX978t8p5I--

--xq0RyeyQscSAyELZXxYI8cr4HO1zef9zh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/hiJoFAwAAAAAACgkQsN6d1ii/Ey9Y
zwf+PrmUi6qmv1WSu4qD2zea/B5q8mXUUc2V38epRRvm9emT+tPbkQ/rxQi9IjSXfQl2pJynFe9y
34zA6azuDBHmcRF9wggWgQWqf6Pze5y/gSn30EWvz6Yl8H3wEjdm7RXY8OiQ/Zf3B2CrF31s1Xar
22byymYIsJ0+Fg6ktNC/Ws29jsjwPaMYhqTspdOfyKurZFUSws1fEt6rg9+FkLwf1iTkm4uOrKFa
FYo2raUDSIEHkBzTrvxJlR+pnYDQ3zVUt2kG5YgfdSjNJg9r23EK4p1B3Lwsi2jyQD4De/l4XXcz
utLx+H7lwSLbhQW/qS+c+eNICao1kS3ioRyk8n/Ihg==
=6i+Z
-----END PGP SIGNATURE-----

--xq0RyeyQscSAyELZXxYI8cr4HO1zef9zh--

