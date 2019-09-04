Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7416A8735
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 20:14:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Zlu-0004mx-GW; Wed, 04 Sep 2019 18:12:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WgxQ=W7=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i5Zls-0004mS-JO
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 18:12:44 +0000
X-Inumbo-ID: 8d7b386a-cf3f-11e9-a337-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d7b386a-cf3f-11e9-a337-bc764e2007e4;
 Wed, 04 Sep 2019 18:12:27 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i5ZlX-0005xF-4H; Wed, 04 Sep 2019 18:12:23 +0000
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i5ZlW-0000JA-U7; Wed, 04 Sep 2019 18:12:23 +0000
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  4 Sep 2019 19:12:16 +0100
Message-Id: <cover.1567620587.git.lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] Code of Conduct (based on Contributor
 Covenant v1.4)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Lars Kurth <lars.kurth@citrix.com>, xen-api@lists.xenproject.org,
 minios-devel@lists.xenproject.org, committers@xenproject.org,
 mirageos-devel@lists.xenproject.org, win-pv-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============1638448313967496902=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1638448313967496902==
Content-Type: text/plain; charset=N
Content-Transfer-Encoding: 8bit

This series proposes a concrete version of the Xen Project
CoC based on v1.4 of the Contributor Covenant. See [1]

It also reflects the discussion in [2] and some private
discussions on IRC to identify initial members of the Xen
Project’s CoC team.

For convenence of review and in line with other policy documents
I created a git repository at [3]. This series can be found at [5].

The series is incomplete in that it does not yet contain the document
on positive behavior: this will be based on [4]. My intention is to
use a lightwight process based on
* Documentation to set expectations, share tips and best practices - with the
hope that people in the community reflect occasionally on how they are doing
against these (or are maybe prompted by peers to do so)
* A safe back-channel to ask for advice when a conversation becomes inefficient,
unactionable, is unfriendly, ... with a view to recover it
* Arbitration in cases where there is some friction amongst participants in a
discussion, which was not resolvable by any of the before. After all, when this
happens there is a risk that a working relationship gets negatively impacted. It
is actually in the interest of each participant to improve to avoid friction,
stress, etc.

I hope that we can approve the series without the first part, but I do not mind
if people feel this needs to be done in one go.

[1] https://www.contributor-covenant.org/version/1/4/code-of-conduct.md
[2] https://xen.markmail.org/thread/56ao2gyhpltqmrew
[3] http://xenbits.xen.org/gitweb/?p=people/larsk/code-of-conduct.git;a=summary
[4] https://www.slideshare.net/xen_com_mgr/xpdds19-keynote-patch-review-for-nonmaintainers-george-dunlap-citrix-systems-uk-ltd
[5] http://xenbits.xen.org/gitweb/?p=people/larsk/code-of-conduct.git;a=shortlog;h=refs/heads/CoC-v1

Cc: minios-devel@lists.xenproject.org
Cc: xen-api@lists.xenproject.org
Cc: win-pv-devel@lists.xenproject.org
Cc: mirageos-devel@lists.xenproject.org
Cc: committers@xenproject.org


Lars Kurth (2):
  Import v1.4 of Contributor Covenant CoC
  Xen Project Code of Conduct

-- 
2.13.0



--===============1638448313967496902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1638448313967496902==--
