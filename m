Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8B2BEBA9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 07:34:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDMLY-0004xC-8U; Thu, 26 Sep 2019 05:29:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WM9k=XV=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iDMLW-0004x7-Kd
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 05:29:42 +0000
X-Inumbo-ID: a3162dac-e01e-11e9-9643-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by localhost (Halon) with ESMTPS
 id a3162dac-e01e-11e9-9643-12813bfff9fa;
 Thu, 26 Sep 2019 05:29:40 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iDMLT-0000MG-F6; Thu, 26 Sep 2019 05:29:39 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iDMLS-0001jn-TI; Thu, 26 Sep 2019 05:29:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iDMLS-0006wb-Sb; Thu, 26 Sep 2019 05:29:38 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-141841-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
 xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=433387661ec789962dffd8ec929f59fdee78194c
X-Osstest-Versions-That: xen=ff22a91b4c45f9310d0ec0d7ee070d84a373dd87
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 26 Sep 2019 05:29:38 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 141841: regressions - FAIL
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

ZmxpZ2h0IDE0MTg0MSB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MTg0MS8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogdGVzdC1hcm02NC1hcm02NC14bC14
c20gICAgICAgNyB4ZW4tYm9vdCAgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQxODIx
CiB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgICA3IHhlbi1ib290ICAgICAgICAgICAgICAg
ICBmYWlsIFJFR1IuIHZzLiAxNDE4MjEKClRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCwgYnV0
IGFyZSBub3QgYmxvY2tpbmc6CiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgIDEzIG1pZ3Jh
dGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKCnZlcnNpb24gdGFyZ2V0
ZWQgZm9yIHRlc3Rpbmc6CiB4ZW4gICAgICAgICAgICAgICAgICA0MzMzODc2NjFlYzc4OTk2MmRm
ZmQ4ZWM5MjlmNTlmZGVlNzgxOTRjCmJhc2VsaW5lIHZlcnNpb246CiB4ZW4gICAgICAgICAgICAg
ICAgICBmZjIyYTkxYjRjNDVmOTMxMGQwZWMwZDdlZTA3MGQ4NGEzNzNkZDg3CgpMYXN0IHRlc3Qg
b2YgYmFzaXMgICAxNDE4MjEgIDIwMTktMDktMjUgMTQ6MDA6NTkgWiAgICAwIGRheXMKVGVzdGlu
ZyBzYW1lIHNpbmNlICAgMTQxODI3ICAyMDE5LTA5LTI1IDE4OjAwOjQ4IFogICAgMCBkYXlzICAg
IDMgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6
CiAgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KICBDaHJpc3RpYW4g
TGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+CiAgSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+CiAgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgog
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CiAgUGF1bCBEdXJyYW50IDxwYXVs
LmR1cnJhbnRAY2l0cml4LmNvbT4KICBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZl
bmRlci5jb20+CiAgVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29t
PgogIFdlaSBMaXUgPHdsQHhlbi5vcmc+Cgpqb2JzOgogYnVpbGQtYXJtNjQteHNtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2
NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIHRlc3QtYXJtNjQt
YXJtNjQteGwteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAg
IAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJpYW5odm0tYW1kNjQgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBv
c3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFn
ZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWls
YWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9s
b2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5l
cmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5n
aXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVz
dCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3Jn
L2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKCk5vdCBwdXNoaW5nLgoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmNvbW1p
dCA0MzMzODc2NjFlYzc4OTk2MmRmZmQ4ZWM5MjlmNTlmZGVlNzgxOTRjCkF1dGhvcjogVm9sb2R5
bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPgpEYXRlOiAgIFR1ZSBTZXAg
MjQgMTU6NDY6NDggMjAxOSArMDAwMAoKICAgIHhlbi9hcm06IG9wdGVlOiB1cGRhdGUgZGVzY3Jp
cHRpb24gaW4gS2NvbmZpZwogICAgCiAgICBPUC1URUUgbWVkaWF0b3Igbm93IGlzICJUZWNoIFBy
ZXZpZXciIHN0YXRlLCBhbmQgd2Ugd2FudCB0byB1cGRhdGUKICAgIGl0J3MgZGVzY3JpcHRpb24g
aW4gS2NvbmZpZyBhY2NvcmRpbmdseS4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogVm9sb2R5bXly
IEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgogICAgQWNrZWQtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cgpjb21taXQgZTlhZDU1ZDlhZGQ5YzFkZGY5
Y2Y0OTQxODAwM2ZiMTQ4MTEyOTc5MQpBdXRob3I6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlt
eXJfQmFiY2h1a0BlcGFtLmNvbT4KRGF0ZTogICBUdWUgU2VwIDI0IDE1OjQ2OjQ3IDIwMTkgKzAw
MDAKCiAgICBTVVBQT1JULm1kOiBEZXNjcmliZSBPUC1URUUgbWVkaWF0b3IKICAgIAogICAgV2l0
aCB0aGUgbGF0ZXN0IHBhdGNoZXMgdG8gdGhlIG1lZGlhdG9yLCBpdCBjYW4gYmUgY29uc2lkZXJl
ZAogICAgYXMgVGVjaG5vbG9naWNhbCBQcmV2aWV3IGZlYXR1cmUuCiAgICAKICAgIFNpZ25lZC1v
ZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KICAg
IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKY29tbWl0IGMy
YzE0MWYwZjQyNDg5NjNjZWRjYjk3MjUzNDQyM2NmOTA5MmFlNTIKQXV0aG9yOiBWb2xvZHlteXIg
QmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+CkRhdGU6ICAgVHVlIFNlcCAyNCAx
NTo0Njo0NSAyMDE5ICswMDAwCgogICAgeGVuL2FybTogb3B0ZWU6IGhhbmRsZSBzaGFyZWQgYnVm
ZmVyIHRyYW5zbGF0aW9uIGVycm9yCiAgICAKICAgIFRoZXJlIGlzIGEgY2FzZSBwb3NzaWJsZSwg
d2hlbiBPUC1URUUgYXNrcyBndWVzdCB0byBhbGxvY2F0ZSBzaGFyZWQKICAgIGJ1ZmZlciwgYnV0
IFhlbiBmb3Igc29tZSByZWFzb24gY2FuJ3QgdHJhbnNsYXRlIGJ1ZmZlcidzIGFkZHJlc3Nlcy4g
SW4KICAgIHRoaXMgc2l0dWF0aW9uIHdlIHNob3VsZCBkbyB0d28gdGhpbmdzOgogICAgCiAgICAx
LiBUZWxsIGd1ZXN0IHRvIGZyZWUgYWxsb2NhdGVkIGJ1ZmZlciwgc28gdGhlcmUgd2lsbCBiZSBu
byBtZW1vcnkKICAgIGxlYWsgZm9yIGd1ZXN0LgogICAgCiAgICAyLiBUZWxsIE9QLVRFRSB0aGF0
IGJ1ZmZlciBhbGxvY2F0aW9uIGZhaWxlZC4KICAgIAogICAgVG8gYXNrIGd1ZXN0IHRvIGZyZWUg
YWxsb2NhdGVkIGJ1ZmZlciB3ZSBzaG91bGQgcGVyZm9ybSB0aGUgc2FtZQogICAgdGhpbmcsIGFz
IE9QLVRFRSBkb2VzIC0gaXNzdWUgUlBDIHJlcXVlc3QuIFRoaXMgaXMgZG9uZSBieSBmaWxsaW5n
CiAgICByZXF1ZXN0IGJ1ZmZlciAobHVja2lseSB3ZSBjYW4gcmV1c2UgdGhlIHNhbWUgYnVmZmVy
LCB0aGF0IE9QLVRFRSB1c2VkCiAgICB0byBpc3N1ZSBvcmlnaW5hbCByZXF1ZXN0KSBhbmQgdGhl
biByZXR1cm4gdG8gZ3Vlc3Qgd2l0aCBzcGVjaWFsCiAgICByZXR1cm4gY29kZS4KICAgIAogICAg
VGhlbiB3ZSBuZWVkIHRvIGhhbmRsZSBuZXh0IGNhbGwgZnJvbSBndWVzdCBpbiBhIHNwZWNpYWwg
d2F5OiBhcyBSUEMKICAgIHdhcyBpc3N1ZWQgYnkgWGVuLCBub3QgYnkgT1AtVEVFLCBpdCBzaG91
bGQgYmUgaGFuZGxlZCBieSBYZW4uCiAgICBCYXNpY2FsbHksIHRoaXMgaXMgdGhlIG1lY2hhbmlz
bSB0byBwcmVlbXB0IE9QLVRFRSBtZWRpYXRvci4KICAgIAogICAgVGhlIHNhbWUgbWVjaGFuaXNt
IGNhbiBiZSB1c2VkIGluIHRoZSBmdXR1cmUgdG8gcHJlZW1wdCBtZWRpYXRvcgogICAgZHVyaW5n
IHRyYW5zbGF0aW9uIGxhcmdlICg+NTEyIHBhZ2VzKSBzaGFyZWQgYnVmZmVycy4KICAgIAogICAg
U2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0u
Y29tPgogICAgQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cgpj
b21taXQgYmFiZGU0N2EzZmVkYTZkZDRiYTMxOGUxZTU3YmQyZWU5ZjJjMTExNgpBdXRob3I6IFBh
dWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CkRhdGU6ICAgV2VkIFNlcCAyNSAx
NjoxNDo1NSAyMDE5ICswMjAwCgogICAgaW50cm9kdWNlIGEgJ3Bhc3N0aHJvdWdoJyBjb25maWd1
cmF0aW9uIG9wdGlvbiB0byB4bC5jZmcuLi4KICAgIAogICAgLi4uYW5kIGhlbmNlIHRoZSBhYmls
aXR5IHRvIGRpc2FibGUgSU9NTVUgbWFwcGluZ3MsIGFuZCBjb250cm9sIEVQVAogICAgc2hhcmlu
Zy4KICAgIAogICAgVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3ICdsaWJ4bF9wYXNzdGhyb3Vn
aCcgZW51bWVyYXRpb24gaW50bwogICAgbGlieGxfZG9tYWluX2NyZWF0ZV9pbmZvLiBUaGUgdmFs
dWUgd2lsbCBiZSBzZXQgYnkgeGwgZWl0aGVyIHdoZW4gaXQgcGFyc2VzCiAgICBhIG5ldyAncGFz
c3Rocm91Z2gnIG9wdGlvbiBpbiB4bC5jZmcsIG9yIGltcGxpY2l0bHkgaWYgdGhlcmUgaXMgcGFz
c3Rocm91Z2gKICAgIGhhcmR3YXJlIHNwZWNpZmllZCBmb3IgdGhlIGRvbWFpbi4KICAgIAogICAg
SWYgdGhlIHZhbHVlIG9mIHRoZSBwYXNzdGhyb3VnaCBjb25maWd1cmF0aW9uIG9wdGlvbiBpcyAn
ZGlzYWJsZWQnIHRoZW4KICAgIHRoZSBYRU5fRE9NQ1RMX0NERl9pb21tdSBmbGFnIHdpbGwgYmUg
Y2xlYXIgaW4gdGhlIHhlbl9kb21jdGxfY3JlYXRlZG9tYWluCiAgICBmbGFncywgdGh1cyBhbGxv
d2luZyB0aGUgdG9vbHN0YWNrIHRvIGNvbnRyb2wgd2hldGhlciB0aGUgZG9tYWluIGdldHMKICAg
IElPTU1VIG1hcHBpbmdzIG9yIG5vdCAod2hlcmUgcHJldmlvdXNseSB0aGV5IHdlcmUgZ2xvYmFs
bHkgc2V0KS4KICAgIAogICAgSWYgdGhlIHZhbHVlIG9mIHRoZSBwYXNzdGhyb3VnaCBjb25maWd1
cmF0aW9uIG9wdGlvbiBpcyAnc3luY19wdCcgdGhlbgogICAgYSBuZXcgJ2lvbW11X29wdHMnIGZp
ZWxkIGluIHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIHdpbGwgYmUgc2V0IHdpdGggdGhlCiAgICB2
YWx1ZSBYRU5fRE9NQ1RMX0lPTU1VX25vX3NoYXJlcHQuIFRoaXMgd2lsbCBvdmVycmlkZSB0aGUg
Z2xvYmFsIGRlZmF1bHQKICAgIHNldCBpbiBpb21tdV9oYXBfcHRfc2hhcmUsIHRodXMgYWxsb3dp
bmcgdGhlIHRvb2xzdGFjayB0byBjb250cm9sIHdoZXRoZXIKICAgIEVQVCBzaGFyaW5nIGlzIHVz
ZWQgZm9yIHRoZSBkb21haW4uCiAgICAKICAgIElmIHRoZSB2YWx1ZSBvZiBwYXNzdGhyb3VnaCBp
cyAnZW5hYmxlZCcgdGhlbiB4bCB3aWxsIGNob29zZSBhbiBhcHByb3ByaWF0ZQogICAgZGVmYXVs
dCBhY2NvcmRpbmcgdG8gdGhlIHR5cGUgb2YgZG9tYWluIGFuZCBoYXJkd2FyZSBzdXBwb3J0Lgog
ICAgCiAgICBOT1RFOiBUaGUgJ2lvbW11X21lbWtiJyBvdmVyaGVhZCBpbiBsaWJ4bF9kb21haW5f
YnVpbGRfaW5mbyB3aWxsIG5vdyBvbmx5CiAgICAgICAgICBiZSBzZXQgaWYgcGFzc3Rocm91Z2gg
aXMgJ3N5bmNfcHQnIChvciB4bCBoYXMgY2hvc2VuIHRoaXMgbW9kZSBhcwogICAgICAgICAgYSBk
ZWZhdWx0KS4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KICAgIFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CiAgICBBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0Bj
aXRyaXguY29tPgogICAgQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+CiAgICBSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+Cgpjb21taXQgOGQ4ZGI1YTRhZDI2N2JjYTY2M2JjMWU0MWRjY2I1M2UwNzJkNzNkMgpB
dXRob3I6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpEYXRlOiAgIFdl
ZCBTZXAgMjUgMTY6MTQ6MjEgMjAxOSArMDIwMAoKICAgIHRvb2xzL29jYW1sOiBhYmkgY2hlY2s6
IENvcGUgd2l0aCBjb25zZWN1dGl2ZSByZWxldmFudCBlbnVtcwogICAgCiAgICBJZiB0aGUgZW5k
IG9mIG9uZSBlbnVtIGlzIHRoZSBgdHlwZScgbGluZSBmb3IgdGhlIG5leHQgZW51bSwgd2Ugd291
bGQKICAgIG5vdCBub3RpY2UgaXQuCiAgICAKICAgIEZpeCB0aGlzIGJ5IHJlb3JkZXJpbmcgdGhl
IGNvZGUsIGFuZCBnZXR0aW5nIHJpZCBvZiB0aGUgZWxzZTogbm93IGlmCiAgICB0aGUgIndlIGFy
ZSB3aXRoaW4gYW4gZW51bSIgYnJhbmNoIGRlY2lkZXMgdGhhdCBpdCdzIHRoZSBlbmQgb2YgdGhl
CiAgICBlbnVtLCBpdCB1bnNldHMgJGVpIGFuZCB3ZSB0aGVuIGltbWVkaWF0ZWx5IHByb2Nlc3Mg
dGhlIGxpbmUgYXMgYSAibm90CiAgICB3aXRoaW4gYW4gZW51bSIgbGluZSAtIGllIGFzIHRoZSBz
dGFydCBvZiB0aGUgbmV4dCBvbmUuCiAgICAKICAgIFJlcG9ydGVkLWJ5OiBQYXVsIER1cnJhbnQg
PHBhdWwuZHVycmFudEBjaXRyaXguY29tPgogICAgU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CiAgICBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJh
bnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgogICAgQWNrZWQtYnk6IENocmlzdGlhbiBMaW5k
aWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4KCmNvbW1pdCA4MGZmM2QzMzhkYzkzMjYw
YjQxZmZlZWViYjBmODUyYzJlZGVmOWNlCkF1dGhvcjogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KRGF0ZTogICBXZWQgU2VwIDI1IDE2OjEyOjQ5IDIwMTkgKzAyMDAKCiAg
ICBpb21tdTogdGlkeSB1cCBpb21tdV91c2VfaGFwX3B0KCkgYW5kIG5lZWRfaW9tbXVfcHRfc3lu
YygpIG1hY3JvcwogICAgCiAgICBUaGVzIG1hY3JvcyByZWFsbHkgb3VnaHQgdG8gbGl2ZSBpbiB0
aGUgY29tbW9uIHhlbi9pb21tdS5oIGhlYWRlciByYXRoZXIKICAgIHRoZW4gYmVpbmcgZGlzdHJp
YnV0ZWQgYW1vbmdzdCBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgaW9tbXUgaGVhZGVycyBhbmQKICAg
IHhlbi9zY2hlZC5oLiBUaGlzIHBhdGNoIG1vdmVzIHRoZW0gdGhlcmUuCiAgICAKICAgIE5PVEU6
IERpc2FibGluZyAnc2hhcmVwdCcgaW4gdGhlIGNvbW1hbmQgbGluZSBpb21tdSBvcHRpb25zIHNo
b3VsZCByZWFsbHkKICAgICAgICAgIGJlIGhhcmQgZXJyb3Igb24gQVJNIChhcyBvcHBvc2VkIHRv
IGp1c3QgYmVpbmcgaWdub3JlZCksIHNvIGRlZmluZQogICAgICAgICAgJ2lvbW11X2hhcF9wdF9z
aGFyZScgdG8gYmUgdHJ1ZSBmb3IgQVJNICh2aWEgQVJNLXNlbGVjdGVkCiAgICAgICAgICBDT05G
SUdfSU9NTVVfRk9SQ0VfUFRfU0hBUkUpLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1
cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgogICAgUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KICAgIEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgoKY29tbWl0IGY4OWY1NTU4MjdhNjYzNDU4MmZmNzhlZjI2ZTcxNjdi
MmJkZGJiZmEKQXV0aG9yOiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgpE
YXRlOiAgIFdlZCBTZXAgMjUgMTY6MTI6MDIgMjAxOSArMDIwMAoKICAgIHJlbW92ZSBsYXRlIChv
bi1kZW1hbmQpIGNvbnN0cnVjdGlvbiBvZiBJT01NVSBwYWdlIHRhYmxlcwogICAgCiAgICBOb3cg
dGhhdCB0aGVyZSBpcyBhIHBlci1kb21haW4gSU9NTVUtZW5hYmxlIGZsYWcsIHdoaWNoIHNob3Vs
ZCBiZSBzZXQgaWYKICAgIGFueSBkZXZpY2UgaXMgZ29pbmcgdG8gYmUgcGFzc2VkIHRocm91Z2gs
IHN0b3AgZGVmZXJyaW5nIHBhZ2UgdGFibGUKICAgIGNvbnN0cnVjdGlvbiB1bnRpbCB0aGUgYXNz
aWdubWVudCBpcyBkb25lLiBBbHNvIGRvbid0IHRlYXIgZG93biB0aGUgdGFibGVzCiAgICBhZ2Fp
biB3aGVuIHRoZSBsYXN0IGRldmljZSBpcyBkZS1hc3NpZ25lZDsgZGVmZXIgdGhhdCB0YXNrIHVu
dGlsIGRvbWFpbgogICAgZGVzdHJ1Y3Rpb24uCiAgICAKICAgIFRoaXMgYWxsb3dzIHRoZSBoYXNf
aW9tbXVfcHQoKSBoZWxwZXIgYW5kIGlvbW11X3N0YXR1cyBlbnVtZXJhdGlvbiB0byBiZQogICAg
cmVtb3ZlZC4gQ2FsbHMgdG8gaGFzX2lvbW11X3B0KCkgYXJlIHNpbXBseSByZXBsYWNlZCBieSBj
YWxscyB0bwogICAgaXNfaW9tbXVfZW5hYmxlZCgpLiBSZW1haW5pbmcgb3Blbi1jb2RlZCB0ZXN0
cyBvZiBpb21tdV9oYXBfcHRfc2hhcmUgY2FuCiAgICBhbHNvIGJlIHJlcGxhY2VkIGJ5IGNhbGxz
IHRvIGlvbW11X3VzZV9oYXBfcHQoKS4KICAgIFRoZSBhcmNoX2lvbW11X3BvcHVsYXRlX3BhZ2Vf
dGFibGUoKSBhbmQgaW9tbXVfY29uc3RydWN0KCkgZnVuY3Rpb25zIGJlY29tZQogICAgcmVkdW5k
YW50LCBhcyBkb2VzIHRoZSAnc3RyaWN0IG1vZGUnIGRvbTAgcGFnZV9saXN0IG1hcHBpbmcgY29k
ZSBpbgogICAgaW9tbXVfaHdkb21faW5pdCgpLCBhbmQgaW9tbXVfdGVhcmRvd24oKSBjYW4gYmUg
bWFkZSBzdGF0aWMgaXMgaXRzIG9ubHkKICAgIHJlbWFpbmluZyBjYWxsZXIsIGlvbW11X2RvbWFp
bl9kZXN0cm95KCksIGlzIHdpdGhpbiB0aGUgc2FtZSBzb3VyY2UKICAgIG1vZHVsZS4KICAgIAog
ICAgQWxsIGluIGFsbCwgYWJvdXQgMjIwIGxpbmVzIG9mIGNvZGUgYXJlIHJlbW92ZWQgZnJvbSB0
aGUgaHlwZXJ2aXNvciAoYXQKICAgIHRoZSBleHBlbnNlIG9mIHNvbWUgYWRkaXRpb25zIGluIHRo
ZSB0b29sc3RhY2spLgogICAgCiAgICBOT1RFOiBUaGlzIHBhdGNoIHdpbGwgY2F1c2UgYSBzbWFs
bCBhbW91bnQgb2YgZXh0cmEgcmVzb3VyY2UgdG8gYmUgdXNlZAogICAgICAgICAgdG8gYWNjb21t
b2RhdGUgSU9NTVUgcGFnZSB0YWJsZXMgdGhhdCBtYXkgbmV2ZXIgYmUgdXNlZCwgc2luY2UgdGhl
CiAgICAgICAgICBwZXItZG9tYWluIElPTU1VLWVuYWJsZSBmbGFnIGlzIGN1cnJlbnRseSBzZXQg
dG8gdGhlIHZhbHVlIG9mIHRoZQogICAgICAgICAgZ2xvYmFsIGlvbW11X2VuYWJsZSBmbGFnLiBB
IHN1YnNlcXVlbnQgcGF0Y2ggd2lsbCBhZGQgYW4gb3B0aW9uIHRvCiAgICAgICAgICB0aGUgdG9v
bHN0YWNrIHRvIGFsbG93IGl0IHRvIGJlIHR1cm5lZCBvZmYgaWYgdGhlcmUgaXMgbm8gaW50ZW50
aW9uCiAgICAgICAgICB0byBhc3NpZ24gcGFzc3Rocm91Z2ggaGFyZHdhcmUgdG8gdGhlIGRvbWFp
bi4KICAgICAgICAgIFRvIGFjY291bnQgZm9yIHRoZSBleHRyYSByZXNvdXJjZSwgJ2lvbW11X21l
bWtiJyBoYXMgYmVlbiBhZGRlZCB0bwogICAgICAgICAgZG9tYWluX2J1aWxkX2luZm8uIFRoaXMg
cGF0Y2ggc2V0cyBpdCB0byBhIHZhbHVlIGNhbGN1bGF0ZWQgYmFzZWQKICAgICAgICAgIG9uIHRo
ZSBkb21haW4ncyBtYXhpbXVtIG1lbW9yeSB3aGVuIHRoZSBQMk0gc2hhcmluZyBpcyBlaXRoZXIg
bm90CiAgICAgICAgICBzdXBwb3J0ZWQgb3IgZ2xvYmFsbHkgZGlzYWJsZWQsIG9yIHplcm8gb3Ro
ZXJ3aXNlLiBIb3dldmVyLCB3aGVuCiAgICAgICAgICB0aGUgdG9vbHN0YWNrIG9wdGlvbiBtZW50
aW9uZWQgYWJvdmUgaXMgYWRkZWQsIGl0IHdpbGwgYWxzbyBiZSB6ZXJvCiAgICAgICAgICBpZiB0
aGUgcGVyLWRvbWFpbiBJT01NVS1lbmFibGUgZmxhZyBpcyB0dXJuZWQgb2ZmLgogICAgCiAgICBT
aWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgogICAg
UmV2aWV3ZWQtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgog
ICAgQWNrZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4K
ICAgIFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CiAgICBBY2tl
ZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KICAgIEFja2VkLWJ5OiBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPgoKY29tbWl0IDMyMjYwOWY5Yzk4MDlkZGMxMDYzNjJjMjQ2ODNj
OTM5NTI0NTEwZDgKQXV0aG9yOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkRhdGU6
ICAgV2VkIFNlcCAyNSAxNjowMzo0OCAyMDE5ICswMjAwCgogICAgQU1EL0lPTU1VOiB0aWR5IHN0
cnVjdCBpdnJzX21hcHBpbmdzCiAgICAKICAgIE1vdmUgdGhlIGRldmljZSBmbGFncyBmaWVsZCB1
cCBpbnRvIGFuIHVudXNlZCBob2xlLCB0aHVzIHNocmlua2luZwogICAgb3ZlcmFsbCBzdHJ1Y3R1
cmUgc2l6ZSBieSA4IGJ5dGVzLiBVc2UgYm9vbCBhbmQgdWludDxOPl90IGFzCiAgICBhcHByb3By
aWF0ZS4gRHJvcCBwb2ludGxlc3MgKHJlZHVuZGFudCkgaW5pdGlhbGl6YXRpb25zLgogICAgCiAg
ICBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CiAgICBSZXZp
ZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KICAgIEFja2Vk
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKY29tbWl0IDM0
YTllZjYyZDNkMjlkZGFmYmVjNmIzNDA5MDc0ZGQ2N2ViYTcxMDkKQXV0aG9yOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CkRhdGU6ICAgV2VkIFNlcCAyNSAxNjowMjo1OSAyMDE5ICsw
MjAwCgogICAgQU1EL0lPTU1VOiByZXN0cmljdCBpbnRlcnJ1cHQgcmVtYXBwaW5nIHRhYmxlIHNp
emVzCiAgICAKICAgIFRoZXJlJ3Mgbm8gcG9pbnQgc2V0dGluZyB1cCB0YWJsZXMgd2l0aCBtb3Jl
IHNwYWNlIHRoYW4gYSBQQ0kgZGV2aWNlIGNhbgogICAgdXNlLiBGb3IgYm90aCBNU0kgYW5kIE1T
SS1YIHdlIGNhbiBkZXRlcm1pbmUgaG93IG1hbnkgaW50ZXJydXB0cyBjb3VsZAogICAgYmUgc2V0
IHVwIGF0IG1vc3QuIFRhYmxlcyBhbGxvY2F0ZWQgZHVyaW5nIEFDUEkgdGFibGUgcGFyc2luZywg
aG93ZXZlciwKICAgIHdpbGwgKGZvciBub3cgYXQgbGVhc3QpIGNvbnRpbnVlIHRvIGJlIHNldCB1
cCB0byBoYXZlIG1heGltdW0gc2l6ZS4KICAgIAogICAgTm90ZSB0aGF0IHVudGlsIHdlIHdvdWxk
IHdhbnQgdG8gdXNlIHN1Yi1wYWdlIGFsbG9jYXRpb25zIGhlcmUgdGhlcmUncwogICAgbm8gcG9p
bnQgY2hlY2tpbmcgd2hldGhlciBib3RoIE1TSSBhbmQgTVNJLVggYXJlIHN1cHBvcnRlZCBieSBh
IGRldmljZSAtCiAgICBhbiBvcmRlci0wIGFsbG9jYXRpb24gd2lsbCBmaXQgdGhlIGR1YWwgY2Fz
ZSBpbiBhbnkgZXZlbnQsIG5vIG1hdHRlcgogICAgdGhhdCB0aGUgTVNJLVggdmVjdG9yIGNvdW50
IG1heSBiZSBzbWFsbGVyIHRoYW4gdGhlIE1TSSBvbmUuCiAgICAKICAgIE9uIG15IFJvbWUgc3lz
dGVtIHRoaXMgcmVkdWNlcyBzcGFjZSBuZWVkZWQgZnJvbSBqdXN0IG92ZXIgMWsgcGFnZXMgdG8K
ICAgIGFib3V0IDEyNS4KICAgIAogICAgU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgogICAgU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgogICAgUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJy
YW50QGNpdHJpeC5jb20+CiAgICBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KCmNvbW1pdCBiYjAzOGYzMTE2ODc1NTQ0ODNmYjk5N2NmZWUyMTM3
NjAwMjlhZWFmCkF1dGhvcjogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpEYXRlOiAg
IFdlZCBTZXAgMjUgMTY6MDI6MjEgMjAxOSArMDIwMAoKICAgIEFNRC9JT01NVTogcmVwbGFjZSBJ
TlRSRU1BUF9FTlRSSUVTCiAgICAKICAgIFByZXBhcmUgZm9yIHRoZSBudW1iZXIgb2YgZW50cmll
cyB0byBub3QgYmUgdGhlIG1heGltdW0gcG9zc2libGUsIGJ5CiAgICBzZXBhcmF0aW5nIGNoZWNr
cyBhZ2FpbnN0IG1heGltdW0gc2l6ZSBmcm9tIG9uZXMgYWdhaW5zdCBhY3R1YWwgc2l6ZS4KICAg
IEZvciBjYWxsZXIgc2lkZSBzaW1wbGljaXR5IGhhdmUgYWxsb2NfaW50cmVtYXBfZW50cnkoKSBy
ZXR1cm4gdGhlCiAgICBtYXhpbXVtIHBvc3NpYmxlIHZhbHVlIHVwb24gYWxsb2NhdGlvbiBmYWls
dXJlLCByYXRoZXIgdGhhbiB0aGUgZmlyc3QKICAgIGp1c3Qgb3V0LW9mLWJvdW5kcyBvbmUuCiAg
ICAKICAgIEhhdmUgdGhlIGludm9sdmVkIGZ1bmN0aW9ucyBhbHJlYWR5IHRha2UgYWxsIHRoZSBz
dWJzZXF1ZW50bHkgbmVlZGVkCiAgICBhcmd1bWVudHMgaGVyZSBhbHJlYWR5LCB0byByZWR1Y2Ug
Y29kZSBjaHVybiBpbiB0aGUgcGF0Y2ggYWN0dWFsbHkKICAgIG1ha2luZyB0aGUgYWxsb2NhdGlv
biBzaXplIGR5bmFtaWMuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KICAgIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgogICAgUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50
QGNpdHJpeC5jb20+Cgpjb21taXQgOTNhNzgxMDEyNjBiMjI1MTBjNWY4MjM1NzdmZjgyNmZiZmM0
NjEzNgpBdXRob3I6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KRGF0ZTogICBXZWQg
U2VwIDI1IDE2OjAxOjMxIDIwMTkgKzAyMDAKCiAgICB4ODYvUENJOiByZWFkIG1heGltdW0gTVNJ
IHZlY3RvciBjb3VudCBlYXJseQogICAgCiAgICBSYXRoZXIgdGhhbiBkb2luZyB0aGlzIGV2ZXJ5
IHRpbWUgd2Ugc2V0IHVwIGludGVycnVwdHMgZm9yIGEgZGV2aWNlCiAgICBhbmV3IChhbmQgdGhl
biBpbiBzZXZlcmFsIHBsYWNlcykgZmlsbCB0aGlzIGludmFyaWFudCBmaWVsZCByaWdodCBhZnRl
cgogICAgYWxsb2NhdGluZyBzdHJ1Y3QgcGNpX2Rldi4KICAgIAogICAgU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgogICAgUmV2aWV3ZWQtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgogICAgUmV2aWV3ZWQtYnk6IFBhdWwgRHVy
cmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CiAgICBSZXZpZXdlZC1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCmNvbW1pdCA0ZTVlNDBmYmQ1ODUyYjJi
NjM4ZTVkOWNmNzc1ZDUyZjkzYjNmZWNiCkF1dGhvcjogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgpEYXRlOiAgIFdlZCBTZXAgMjUgMTY6MDA6NDYgMjAxOSArMDIwMAoKICAgIEFNRC9J
T01NVTogbWFrZSBwaGFudG9tIGZ1bmN0aW9ucyBzaGFyZSBpbnRlcnJ1cHQgcmVtYXBwaW5nIHRh
YmxlcwogICAgCiAgICBSYXRoZXIgdGhhbiBkdXBsaWNhdGluZyBlbnRyaWVzIGluIGFtZF9pb21t
dV9tc2lfbXNnX3VwZGF0ZV9pcmUoKSwgc2hhcmUKICAgIHRoZSB0YWJsZXMuIFRoaXMgbWFpbmx5
IHJlcXVpcmVzIHNvbWUgY2FyZSB3aGlsZSBmcmVlaW5nIHRoZW0sIHRvIGF2b2lkCiAgICBmcmVl
aW5nIG1lbW9yeSBibG9ja3MgdHdpY2UuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KICAgIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgogICAgUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+Cgpjb21taXQgZDdjZmViN2MxM2VkNjBiZTk0OTcxNGNkNGJl
ZmE3ZWRiMzIxMWM5YgpBdXRob3I6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KRGF0
ZTogICBXZWQgU2VwIDI1IDE2OjAwOjA1IDIwMTkgKzAyMDAKCiAgICBBTUQvSU9NTVU6IGRvbid0
IGJsaW5kbHkgYWxsb2NhdGUgaW50ZXJydXB0IHJlbWFwcGluZyB0YWJsZXMKICAgIAogICAgQUNQ
SSB0YWJsZXMgYXJlIGZyZWUgdG8gbGlzdCBmYXIgbW9yZSBkZXZpY2UgY29vcmRpbmF0ZXMgdGhh
biB0aGVyZSBhcmUKICAgIGFjdHVhbCBkZXZpY2VzLiBCeSBkZWxheWluZyB0aGUgdGFibGUgYWxs
b2NhdGlvbnMgZm9yIG1vc3QgY2FzZXMsIGFuZAogICAgZG9pbmcgdGhlbSBvbmx5IHdoZW4gYW4g
YWN0dWFsIGRldmljZSBpcyBrbm93biB0byBiZSBwcmVzZW50IGF0IGEgZ2l2ZW4KICAgIHBvc2l0
aW9uLCBvdmVyYWxsIG1lbW9yeSB1c2VkIGZvciB0aGUgdGFibGVzIGdvZXMgZG93biBmcm9tIG92
ZXIgNTAwawogICAgcGFnZXMgdG8ganVzdCBvdmVyIDFrIChvbiBteSBzeXN0ZW0gaGF2aW5nIHN1
Y2ggQUNQSSB0YWJsZSBjb250ZW50cykuCiAgICAKICAgIFRhYmxlcyBjb250aW51ZSB0byBnZXQg
YWxsb2NhdGVkIHJpZ2h0IGF3YXkgZm9yIHNwZWNpYWwgZW50cmllcwogICAgKElPLUFQSUMsIEhQ
RVQpIGFzIHdlbGwgYXMgZm9yIGFsaWFzIElEcy4gV2hpbGUgaW4gdGhlIGZvcm1lciBjYXNlCiAg
ICB0aGF0J3Mgc2ltcGx5IGJlY2F1c2UgdGhlcmUgbWF5IG5vdCBiZSBhbnkgZGV2aWNlIGF0IGEg
Z2l2ZW4gcG9zaXRpb24sCiAgICBpbiB0aGUgbGF0dGVyIGNhc2UgdGhpcyBpcyB0byBhdm9pZCBo
YXZpbmcgdG8gaW50cm9kdWNlIHJlZi1jb3VudGluZyBvZgogICAgdGFibGUgdXNhZ2UuCiAgICAK
ICAgIFRoZSBjaGFuZ2UgaW52b2x2ZXMgaW52b2tpbmcKICAgIGl0ZXJhdGVfaXZyc19tYXBwaW5n
cyhhbWRfaW9tbXVfc2V0dXBfZGV2aWNlX3RhYmxlKSBhIHNlY29uZCB0aW1lLAogICAgYmVjYXVz
ZSB0aGUgZnVuY3Rpb24gbm93IHdhbnRzIHRvIGJlIGFibGUgdG8gZmluZCBQQ0kgZGV2aWNlcywg
d2hpY2gKICAgIGlzbid0IHBvc3NpYmxlIHlldCB3aGVuIElPTU1VIHNldHVwIGhhcHBlbnMgdmVy
eSBlYXJseSBkdXJpbmcgeDJBUElDCiAgICBtb2RlIHNldHVwLiBJbiB0aGlzIGNvbnRleHQgYW1k
X2lvbW11X2luaXRfaW50ZXJydXB0KCkgZ2V0cyByZW5hbWVkIGFzCiAgICB3ZWxsLgogICAgCiAg
ICBUaGUgbG9naWMgYWRqdXN0aW5nIGEgRFRFJ3MgaW50ZXJydXB0IHJlbWFwcGluZyBhdHRyaWJ1
dGVzIGFsc28gZ2V0cwogICAgY2hhbmdlZCwgc3VjaCB0aGF0IHRoZSBsYWNrIG9mIGFuIElSVCB3
b3VsZCByZXN1bHQgaW4gdGFyZ2V0IGFib3J0ZWQKICAgIHJhdGhlciB0aGFuIG5vbi1yZW1hcHBl
ZCBpbnRlcnJ1cHRzIChzaG91bGQgYW55IG9jY3VyKS4KICAgIAogICAgTm90ZSB0aGF0IGZvciBu
b3cgcGhhbnRvbSBmdW5jdGlvbnMgZ2V0IHNlcGFyYXRlIElSVHMgYWxsb2NhdGVkLCBhcyB3YXMK
ICAgIHRoZSBjYXNlIGJlZm9yZS4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgogICAgUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5k
dXJyYW50QGNpdHJpeC5jb20+CiAgICBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KKHFlbXUgY2hhbmdlcyBub3QgaW5jbHVkZWQpCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
