Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD82415B2DF
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 22:39:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1zh3-0006CQ-0B; Wed, 12 Feb 2020 21:37:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N7rY=4A=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1j1zh1-0006CE-51
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 21:37:11 +0000
X-Inumbo-ID: d2b11bc4-4ddf-11ea-b7f6-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2b11bc4-4ddf-11ea-b7f6-12813bfff9fa;
 Wed, 12 Feb 2020 21:37:09 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j1zgz-0000ap-1Q; Wed, 12 Feb 2020 21:37:09 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j1zgy-0003NQ-OW; Wed, 12 Feb 2020 21:37:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1j1zgy-0006Nk-Nt; Wed, 12 Feb 2020 21:37:08 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-146973-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-amd64-libvirt:libvirt-build:fail:regression
 xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
 xen-unstable-smoke:build-armhf:xen-build:fail:regression
 xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=af09b7d79cb8ae7498882e61efec75486eb69544
X-Osstest-Versions-That: xen=6c47c37b9b40d6fe40bce8c8fd39135f6d549c8c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Feb 2020 21:37:08 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 146973: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ZmxpZ2h0IDE0Njk3MyB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0Njk3My8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogYnVpbGQtYW1kNjQtbGlidmlydCAg
ICAgICAgICAgNiBsaWJ2aXJ0LWJ1aWxkICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQ2ODgy
CiBidWlsZC1hcm02NC14c20gICAgICAgICAgICAgICA2IHhlbi1idWlsZCAgICAgICAgICAgICAg
ICBmYWlsIFJFR1IuIHZzLiAxNDY4ODIKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAgIDYg
eGVuLWJ1aWxkICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0Njg4MgoKVGVzdHMgd2hp
Y2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRlc3QtYXJtaGYtYXJt
aGYteGwgICAgICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBu
L2EKIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAg
ICAgICAgICBibG9ja2VkICBuL2EKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydCAgICAgIDEgYnVp
bGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKCnZlcnNpb24gdGFyZ2V0ZWQg
Zm9yIHRlc3Rpbmc6CiB4ZW4gICAgICAgICAgICAgICAgICBhZjA5YjdkNzljYjhhZTc0OTg4ODJl
NjFlZmVjNzU0ODZlYjY5NTQ0CmJhc2VsaW5lIHZlcnNpb246CiB4ZW4gICAgICAgICAgICAgICAg
ICA2YzQ3YzM3YjliNDBkNmZlNDBiY2U4YzhmZDM5MTM1ZjZkNTQ5YzhjCgpMYXN0IHRlc3Qgb2Yg
YmFzaXMgICAxNDY4ODIgIDIwMjAtMDItMTEgMTY6MDA6NTQgWiAgICAxIGRheXMKRmFpbGluZyBz
aW5jZSAgICAgICAgMTQ2ODkzICAyMDIwLTAyLTExIDIwOjAxOjAyIFogICAgMSBkYXlzICAgMTEg
YXR0ZW1wdHMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTQ2OTM1ICAyMDIwLTAyLTEyIDExOjA2OjEw
IFogICAgMCBkYXlzICAgIDUgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNp
b25zIHVuZGVyIHRlc3Q6CiAgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KICBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KICBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CiAgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgog
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CiAgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Cgpqb2JzOgogYnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiBidWlsZC1hbWQ2NCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxk
LWFybWhmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
YWlsICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGZhaWwgICAgCiB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYXJtNjQtYXJtNjQteGwt
eHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1h
bWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJpYW5odm0tYW1kNjQgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYmxvY2tlZCAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRl
c3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21l
L2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAog
ICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBs
YW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBh
dAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9i
O2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3
ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNz
IGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9w
PW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKCk5vdCBwdXNoaW5nLgoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmNvbW1pdCBhZjA5Yjdk
NzljYjhhZTc0OTg4ODJlNjFlZmVjNzU0ODZlYjY5NTQ0CkF1dGhvcjogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgpEYXRlOiAgIFdlZCBGZWIgMTIgMTA6NTU6MDYgMjAyMCArMDEwMAoK
ICAgIHhlbjogcmVtb3ZlIGVtcHR5IHNvZnRpcnFfaW5pdCgpCiAgICAKICAgIHNvZnRpcnFfaW5p
dCgpIGlzIGVtcHR5IHNpbmNlIFhlbiA0LjEuIFJlbW92ZSBpdCB0b2dldGhlciB3aXRoIGl0cyBj
YWxsCiAgICBzaXRlcy4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgogICAgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Cgpjb21taXQgNjZiMjgyYmJiMWFhNjRhM2Q3YTZmN2Q3MDVjZjEwYmE4NDRj
ZDYxMQpBdXRob3I6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KRGF0ZTogICBXZWQg
RmViIDEyIDEwOjU0OjA4IDIwMjAgKzAxMDAKCiAgICBBTUQvSU9NTVU6IGRyb3AgcmVkdW5kYW50
IGNvZGUKICAgIAogICAgVGhlIGxldmVsIDEgc3BlY2lhbCBleGl0IHBhdGggaXMgdW5uZWNlc3Nh
cnkgaW4gaW9tbXVfcGRlX2Zyb21fZGZuKCkgLQogICAgdGhlIHN1YnNlcXVlbnQgY29kZSB0YWtl
cyBjYXJlIG9mIHRoaXMgY2FzZSBxdWl0ZSBmaW5lLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CiAgICBSZXZpZXdlZC1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCmNvbW1pdCA2ODI3YmVhMmIzYjk5MTUz
ODIxYjhiNzQ0NmJkY2VkMjdmNzIwMTg4CkF1dGhvcjogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgpEYXRlOiAgIFdlZCBGZWIgMTIgMTA6NTI6MjAgMjAyMCArMDEwMAoKICAgIGRvbTAt
YnVpbGQ6IGZpeCBidWlsZCB3aXRoIGNsYW5nNQogICAgCiAgICBXaXRoIG5vbi1lbXB0eSBDT05G
SUdfRE9NMF9NRU0gY2xhbmc1IHByb2R1Y2VzCiAgICAKICAgIGRvbTBfYnVpbGQuYzozNDQ6MjQ6
IGVycm9yOiB1c2Ugb2YgbG9naWNhbCAnJiYnIHdpdGggY29uc3RhbnQgb3BlcmFuZCBbLVdlcnJv
ciwtV2NvbnN0YW50LWxvZ2ljYWwtb3BlcmFuZF0KICAgICAgICBpZiAoICFkb20wX21lbV9zZXQg
JiYgQ09ORklHX0RPTTBfTUVNWzBdICkKICAgICAgICAgICAgICAgICAgICAgICAgICAgXiAgfn5+
fn5+fn5+fn5+fn5+fn5+CiAgICBkb20wX2J1aWxkLmM6MzQ0OjI0OiBub3RlOiB1c2UgJyYnIGZv
ciBhIGJpdHdpc2Ugb3BlcmF0aW9uCiAgICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJ
R19ET00wX01FTVswXSApCiAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICYKICAgIGRvbTBfYnVpbGQuYzozNDQ6MjQ6IG5vdGU6IHJlbW92ZSBj
b25zdGFudCB0byBzaWxlbmNlIHRoaXMgd2FybmluZwogICAgICAgIGlmICggIWRvbTBfbWVtX3Nl
dCAmJiBDT05GSUdfRE9NMF9NRU1bMF0gKQogICAgICAgICAgICAgICAgICAgICAgICAgIH5efn5+
fn5+fn5+fn5+fn5+fn5+fn4KICAgIDEgZXJyb3IgZ2VuZXJhdGVkLgogICAgCiAgICBPYnZpb3Vz
bHkgbmVpdGhlciBvZiB0aGUgdHdvIHN1Z2dlc3Rpb25zIGFyZSBhbiBvcHRpb24gaGVyZS4gT2Rk
bHkKICAgIGVub3VnaCBzd2FwcGluZyB0aGUgb3BlcmFuZHMgb2YgdGhlICYmIGhlbHBzLCB3aGls
ZSBlLmcuIGNhc3Rpbmcgb3IKICAgIHBhcmVudGhlc2l6aW5nIGRvZXNuJ3QuIEFub3RoZXIgd29y
a2FibGUgdmFyaWFudCBsb29rcyB0byBiZSB0aGUgdXNlIG9mCiAgICAhISBvbiB0aGUgY29uc3Rh
bnQuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KICAgIEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgogICAgQWNrZWQt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKY29tbWl0IDFiM2Nl
YzY5YmYzMDBlMDEyYTAyNjlmMGE0ZjI4Y2NhMWViZjIyYzkKQXV0aG9yOiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpEYXRlOiAgIFdlZCBGZWIgNSAxNToyNToyMSAy
MDIwICswMDAwCgogICAgdG9vbHMvbGlieGw6IENvbWJpbmUgbGVnYWN5IENQVUlEIGhhbmRsaW5n
IGxvZ2ljCiAgICAKICAgIFdoaWxlIHdlIGFyZSBpbiB0aGUgcHJvY2VzcyBvZiBvdmVyaGF1bGlu
ZyBib290IHRpbWUgQ1BVSUQvTVNSIGhhbmRsaW5nLCB0aGUKICAgIGV4aXN0aW5nIGxvZ2ljIGlz
IGdvaW5nIHRvIGhhdmUgdG8gcmVtYWluIGluIHJvdWdobHkgdGhpcyBmb3JtIGZvciBiYWNrd2Fy
ZHMKICAgIGNvbXBhdGliaWxpdHkuCiAgICAKICAgIEZvbGQgbGlieGxfX2NwdWlkX2FwcGx5X3Bv
bGljeSgpIGFuZCBsaWJ4bF9fY3B1aWRfc2V0KCkgdG9nZXRoZXIgaW50byBhIHNpbmdsZQogICAg
bGlieGxfX2NwdWlkX2xlZ2FjeSgpIHRvIHJlZHVjZSB0aGUgY29tcGxleGl0eSBmb3IgY2FsbGVy
cy4KICAgIAogICAgTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CiAgICBBY2tlZC1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cgpjb21taXQgZGFjYjgwZjk3
NTdjMDExMTYxY2VjNjYwOWYzOTgzN2M5ZWE4Y2FhOApBdXRob3I6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkRhdGU6ICAgV2VkIEphbiA4IDEyOjUzOjQ5IDIwMjAg
KzAwMDAKCiAgICB0b29scy9saWJ4bDogUmVtb3ZlIGxpYnhsX2NwdWlkX3tzZXQsYXBwbHlfcG9s
aWN5fSgpIGZyb20gdGhlIEFQSQogICAgCiAgICBUaGVzZSBmdW5jdGlvbnMgc2hvdWxkIG5ldmVy
IGhhdmUgYmVlbiBleHBvc2VkLiAgVGhleSBkb24ndCBoYXZlIGV4dGVybmFsCiAgICB1c2Vycywg
YW5kIGNhbid0IHVzZWZ1bGx5IGJlIHVzZWQgZm9yIHNldmVyYWwgcmVhc29ucy4KICAgIAogICAg
TW92ZSBsaWJ4bF9jcHVpZF97c2V0LGFwcGx5X3BvbGljeX0oKSB0byBiZWluZyBpbnRlcm5hbCBm
dW5jdGlvbnMsIGFuZCBsZWF2ZQogICAgYW4gZXF1aXZhbGVudCBvZiB0aGUgbm9wIHN0dWJzIGlu
IHRoZSBBUEkgZm9yIGNhbGxlciBjb21wYXRpYmlsaXR5LgogICAgCiAgICBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgogICAgQWNrZWQtYnk6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoocWVtdSBjaGFuZ2VzIG5v
dCBpbmNsdWRlZCkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
