Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A18129C90BB
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 18:23:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836680.1252594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBdZC-0002IX-Js; Thu, 14 Nov 2024 17:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836680.1252594; Thu, 14 Nov 2024 17:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBdZC-0002GK-Gm; Thu, 14 Nov 2024 17:23:38 +0000
Received: by outflank-mailman (input) for mailman id 836680;
 Thu, 14 Nov 2024 17:23:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6dbb=SJ=bounce.vates.tech=bounce-md_30504962.67363213.v1-410b407c407648fe8b6e847a0512f0b0@srs-se1.protection.inumbo.net>)
 id 1tBdZA-0002G9-W2
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 17:23:37 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bcd869f-a2ad-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 18:23:33 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4Xq6SM0RpMz3sSNqc
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 17:23:31 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 410b407c407648fe8b6e847a0512f0b0; Thu, 14 Nov 2024 17:23:31 +0000
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
X-Inumbo-ID: 2bcd869f-a2ad-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC44IiwiaGVsbyI6Im1haWwxODAtOC5zdXczMS5tYW5kcmlsbGFwcC5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjJiY2Q4NjlmLWEyYWQtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjA1MDEzLjM5OTA0Niwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3MzYzMjEzLnYxLTQxMGI0MDdjNDA3NjQ4ZmU4YjZlODQ3YTA1MTJmMGIwQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1731605011; x=1731865511;
	bh=DmsYrpayBFhzQtv35fjH6zaL5aZ7ENyeE8wRS5J0E0o=;
	h=From:Subject:To:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=EpitENwucQ+6FmnOkxsPXr8J21JCmXIBLHBy9XAAfMPLO8NZCOLdup5HGWHSgr76S
	 bOIN9TuGH08OVKwBoyqDFPTnTqoqa8Hs3atHl1u2uYHNz6zSlDJoJGqez9kMTMD6L8
	 vcDMVW7c2+vVnIwsJDt8R8jbujSklH/ghGa/Bjdc2Hv8TZuHm0B2l1z8uxIA1SWffc
	 nLZHKYNCsxaeJcOJi197KR9dDZGbCR3tRUrnbsClmUhGy3i5rxahThvvblmF/u83fg
	 aAIcBOTqTA/Mf6iM3JIJVQldhf94/b5oaaoWfV/LuzN7PheXIhW9nd9C6SvKIULPw8
	 /2FTtUYcKx9gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1731605011; x=1731865511; i=anthony.perard@vates.tech;
	bh=DmsYrpayBFhzQtv35fjH6zaL5aZ7ENyeE8wRS5J0E0o=;
	h=From:Subject:To:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=uit5El4Lks22IissCITgT0biUaBMtq9KV/6Lu7Uz6CUCYOOYrZWtEZpJULH9g7zh1
	 Jjz4dJY+19P3UGnjXDKlCus/8VOxRgneDTFECkmpSHuwGaGmw1Rjjgk1MBcJWFl143
	 XCYsCT5cZJpJ9skFX1ch2gnQYF7R4ovCcA51uZFYgYX1pej87W0m5yLaACslvbR5Gh
	 DnhCQ+COq3eZjuY8wHMwqgkk4P+2AVNfxmFOe/zYWuIwVsmWBk4kkAYvG5/H9yEHMy
	 9H4tX/fjx8zgIrtoW/R+Nz0Tw6Q1b7LOfLY/DJAPxoXbUWhg9d5z0XgaoPWe5WBCzE
	 Sk1myuFTe80zQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Toolstack=20working=20group=20(replace=20libxl)?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1731605010467
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Message-Id: <ZzYyEZcpA_JwOLIy@l14>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.410b407c407648fe8b6e847a0512f0b0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241114:md
Date: Thu, 14 Nov 2024 17:23:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

I'd like to start a working group on the future of the toolstack.

The main objective would be have a way to managed domain that is common
to more project.

(The hidden goal would be to get rid of libxl, and replace it with a
new tool written in Rust.)

Right now, we have the CLI `xl` and the library `libxl` or
`libxenlight` that is promote upstream to be the way to create and
manage domains. But the reality is that `libxl` isn't really used to
it's full potential, or at all, by other projects to manage Xen guest.
`libvirt` does link with `libxl` but it doesn't use the asynchronous
API. Then, other project don't even use `libxl` and have a different
tool, e.g. `xenopsd` for XenServer / XCP-ng.

I've gather some more notes on the why and how on this page:
https://gitlab.com/xen-project/collab/wg-toolstack-refactoring/-/wikis/home
(There's more of my research notes in other wiki pages.)

What do you think about the initial goal in this home wiki page?
Did I miss something? Or shall we talk interface between libxl's
replacement and higher level guest management? (Likely an RPC)

I've created a mailing list where we can talk about it:
https://lists.xenproject.org/mailman/listinfo/wg-toolstack
wg-toolstack@lists.xenproject.org

And I've created a GitLab project where we can share more, use issue
or other features:
https://gitlab.com/xen-project/collab/wg-toolstack-refactoring

And at some point, we should have regular meeting.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

