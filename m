Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DD84D1101
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 08:30:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286549.486105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRUHD-00086s-Jv; Tue, 08 Mar 2022 07:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286549.486105; Tue, 08 Mar 2022 07:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRUHD-00083X-FC; Tue, 08 Mar 2022 07:28:59 +0000
Received: by outflank-mailman (input) for mailman id 286549;
 Tue, 08 Mar 2022 07:28:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rZft=TT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nRUHB-000837-4H
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 07:28:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6754836f-9eb1-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 08:28:52 +0100 (CET)
Received: from AM6P192CA0072.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::49)
 by VE1PR08MB5280.eurprd08.prod.outlook.com (2603:10a6:803:10d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Tue, 8 Mar
 2022 07:28:37 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::f) by AM6P192CA0072.outlook.office365.com
 (2603:10a6:209:82::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 07:28:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Tue, 8 Mar 2022 07:28:36 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Tue, 08 Mar 2022 07:28:36 +0000
Received: from 4374906bd992.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D48E9E9C-ACF3-4A63-B38C-8763954E0CBB.1; 
 Tue, 08 Mar 2022 07:28:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4374906bd992.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Mar 2022 07:28:26 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB9PR08MB6762.eurprd08.prod.outlook.com (2603:10a6:10:2a8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Tue, 8 Mar
 2022 07:28:24 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa%4]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 07:28:24 +0000
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
X-Inumbo-ID: 6754836f-9eb1-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gizHt90rMvtQzd/SsI6Q733YarjsdfP1ZD88mhvTwcQ=;
 b=SWpS9l0vZEZ88qvNBrTv5eGwO2uu0XNSq4gAPNZokBaixBmjaW4dFfYhCbYRYpExToS+trP+NeNG98WE2lg9REF7+RMvM+Y5IfwpKxiTaDdEupUFzLomwK1LddE56id6fXBvWkguIKrldGL1RK1N1y/kw4UQBLVIt0zuKMmpk2Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCV2pPt8PCh5NahgzF2D0nytL3DuHaiVt4/JJEKIs4bA8ib8TIhwgGbzrGMvnVa8Lnb2oraKLeJY9VsEgji1zqrfrJtAAbjwkdm1yqdTqbdu6B9jyfgxxXH8OZUs7Hcp44h4+XWOIyuTwzPftPpZkYB3Ez2MtinffY/MxTW0yhTHDmHuwqEO1dmiErvnLVMJN4+ScKY8NO6Ph2kJsymhl7SbOYnxkoeAfOzsJeedgHuIutDzu36X1MQ4RtF5QZNphan2wGKRUjYThyH1ctvGZ+onXFId4r0s1FYXK8A7RTmw0UMeBrzapGwS1GfTvnmYs0RRdFpFSVfXwdcMK5okpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gizHt90rMvtQzd/SsI6Q733YarjsdfP1ZD88mhvTwcQ=;
 b=d5OqkbSxtUG6g09prgFF+pa31d4PXxyooeS/WzopBj9vWZuCQAWn/2oPS4srAXA2X53N9f5uI7Eh6Fsfs7cSjvegTWY0vBQP52Ke3SJy1yU6ke8uoZmaH3ltWzssVp9gQpcTZFvUoLvpD/IFmZxCbLUyVqXxIi/8RkFZPyUXo2ALV5dRZ8IKzaG/6c1FSMF8q0YFzx3OkhthCAz9O2ZJTYwZSIPM/IMC7ZhShLgoukEhpqJ1hmvK/uDIUFNi7qtilPUppnAsfBR3Y8UmSitCGpy+3BZPDMYfExO+2coD2VZaIpDr2LWan/maJ/keFAO+NFDILm/noJTU+qk0lBCn5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gizHt90rMvtQzd/SsI6Q733YarjsdfP1ZD88mhvTwcQ=;
 b=SWpS9l0vZEZ88qvNBrTv5eGwO2uu0XNSq4gAPNZokBaixBmjaW4dFfYhCbYRYpExToS+trP+NeNG98WE2lg9REF7+RMvM+Y5IfwpKxiTaDdEupUFzLomwK1LddE56id6fXBvWkguIKrldGL1RK1N1y/kw4UQBLVIt0zuKMmpk2Y=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Henry Wang
	<Henry.Wang@arm.com>, nd <nd@arm.com>
Subject: RE: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Topic: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Index:
 AdgpQxtXwh7LkfydTgiYk9bhMgU+ogBRt1sAAKse4VAAPag1gAAckyvAAMo7i2AAK6G7AAAQksLg
Date: Tue, 8 Mar 2022 07:28:23 +0000
Message-ID:
 <PAXPR08MB7420DDE732B24C541B254E699E099@PAXPR08MB7420.eurprd08.prod.outlook.com>
References:
 <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <04db7e8b-2f04-41d7-1deb-d8bda3625c04@xen.org>
 <PAXPR08MB7420BF1299A1577B98211C1A9E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <1f0bba54-158b-d171-6f99-0c29e0547f8a@xen.org>
 <PAXPR08MB742067028155B11528C5CCA39E049@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <PAXPR08MB7420827063D47932F428CEC89E089@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2203071348220.3261@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2203071348220.3261@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4B6AF03F782A764EB1B91CC451D97076.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a3c06d01-6773-4c8f-6010-08da00d54250
x-ms-traffictypediagnostic:
	DB9PR08MB6762:EE_|AM5EUR03FT013:EE_|VE1PR08MB5280:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5280E5987EB66E11AB1E12709E099@VE1PR08MB5280.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gbPImmuTYlNtkBtYEHFNouZiZKkdioGXpQT2ou2ud6Qo9WphVacA8Kq1TzN/xPBGd2V/49zfZ03biwGrA3QVG3uX23KBoFU8r0sb1PnccCyMWsJPTG9C5J6s6i1wabkOj0nwSx9rt8pa+ziKe/ejqxdLx6jBMVlyQQLwpxUR5UmGek/9qyODhudQUXU7f4cs26ytMujB0sox/StsufmNokeoFKDdJjkzuwXwUo8TGIKBs6gGpFVMMgEjLeAyMBc08gdRljQbcVW/uqralKEdxn2zQk78vZeFQ4N3A8fD57huLo6MMYRHGr5UFepJVqfVhy5/FdVjG9+tBrffA7YoeKBxqyRwPT/Yp4CNnEOf353e4e0tk7vwsmODJ871Xb7RPKBcjNyVNx4GJ37xtOwNB0SKZMWWbiG3HyLRqA3GJLhhmj185P7uhvD+5to9z9RO61PWFJcZDsN6zzKlZaeBxQdEjDkMXomHhsu7jSRtIGkrs9EgAFJDRmweQbNHkFkKrY6pgDgAA5PVCIzvtveg5Ox+ZfwkIjoecGpEOanlGQPgQHgCwebo8jQXgnCHp3NglLoKwiwKBFSVwdwhNLjHocfz3JGqXio+rzLZu/P1VrAs6W7AgNDdnQC5HuOIrI2dHDRu9ZoUMA86qLogyC+K8KST0bByRWVAaoWWmpqS4MSsxGseC/HUBRGVaMUdOpJIdU24pnEkN5UOWObr7MV8nTCBhRF2JRD1roKJyAdn24IteFBkeAXjZskLyuAC3/7U6L3NrYpxxRGMfcmgq0N93jMf4ZOU4x8vPZuDdLAl64o=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(52536014)(38070700005)(86362001)(2906002)(8676002)(66446008)(508600001)(38100700002)(71200400001)(5660300002)(83380400001)(9686003)(76116006)(7696005)(26005)(64756008)(66946007)(186003)(122000001)(54906003)(55016003)(33656002)(53546011)(316002)(6506007)(8936002)(66476007)(66556008)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6762
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c24574ce-bad7-45e4-7997-08da00d53ac6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a6rwWCqgqLvcbVhW+lLUq3jIzj5UjZBvBdNXh4QKd7BPNSgeIzAnPQwF33l6pn+DsXwURv7Znmd3xrzs9Sm1AOGe8euFrKEIuDKwV68K01bU9hRLyXRP64KhPMv8yutEc0vlt+1v12+QM8lL8KZUc1YFL9ZWU7PHk4F4C4xQMzbm/8YkE1h9+YB67fwIhHVymQhW6gKDeO8u1lPnjfHELBl/LFsUAiHcMPqISuXYxLbh12KZ9Cf4PiVc4ixaDzEEmdO+U6rUOjf2WBIjjohqDwf22avX7itPM9xw6mv/1Ay/mPAnpqPkrq3lHTl0bxe3pVR6qj4rfBpq+91/t2YxMRoTQuTynOk4Bpu/asJv52r3fJXMhMRRndzfi18VPi7bzb8Jw4g2mVD5tMFUqthourEK24rH8gUIqYXCBh4JdzZZllFRHgzMzawPes6mp4OOaneGARAx99+6pelhPAdNkaumLNaczQ5qMP7joE5u6WZ9ebq8JKH2BGr3ERifvfqlLMSHS7iIbevHhYvU9H4PJRvShD4QwqtNPtPIJ6YzZDDbvbjuHTsuOum960KzbeLhKrZkjwHDvzR8w/D9M5ZCIcxl1jpLNbx5Ob1uzopbUVh3XqSE/b7NhFGVvzihlt+UN6TQ7R8iA49OKhQvBrXrElt268LYlJ5PRoNwhp3tLGKCK6WLBwWWI2ly+ofzbZVZ4YEMAOqJcFoTRHFB9TWS5xLnOBq4Icj7ppv6NAm5WT4osKeUY28hlzeiNaNFPfMdw1UwqJOvZ/9AiYXTA1chXg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(508600001)(81166007)(316002)(7696005)(2906002)(55016003)(83380400001)(33656002)(70206006)(54906003)(70586007)(6506007)(4326008)(6862004)(8676002)(40460700003)(5660300002)(52536014)(8936002)(36860700001)(82310400004)(336012)(186003)(26005)(9686003)(86362001)(47076005)(356005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 07:28:36.5975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c06d01-6773-4c8f-6010-08da00d54250
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5280

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4t
ZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYg
T2YNCj4gU3RlZmFubyBTdGFiZWxsaW5pDQo+IFNlbnQ6IDIwMjLE6jPUwjjI1SA2OjU4DQo+IFRv
OiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFN0ZWZhbm8NCj4gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJl
cnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29t
PjsgSGVucnkgV2FuZw0KPiA8SGVucnkuV2FuZ0Bhcm0uY29tPjsgbmQgPG5kQGFybS5jb20+DQo+
IFN1YmplY3Q6IFJFOiBQcm9wb3NhbCBmb3IgUG9ydGluZyBYZW4gdG8gQXJtdjgtUjY0IC0gRHJh
ZnRBDQo+IA0KPiBPbiBNb24sIDcgTWFyIDIwMjIsIFdlaSBDaGVuIHdyb3RlOg0KPiA+ID4gPiBP
biAwMS8wMy8yMDIyIDA3OjUxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiA+ID4gPj4+ICMjIyAxLjIu
IFhlbiBDaGFsbGVuZ2VzIHdpdGggUE1TQSBWaXJ0dWFsaXphdGlvbg0KPiA+ID4gPiA+Pj4gWGVu
IGlzIFBNU0EgdW5hd2FyZSBUeXBlLTEgSHlwZXJ2aXNvciwgaXQgd2lsbCBuZWVkDQo+IG1vZGlm
aWNhdGlvbnMgdG8NCj4gPiA+ID4gcnVuDQo+ID4gPiA+ID4+PiB3aXRoIGFuIE1QVSBhbmQgaG9z
dCBtdWx0aXBsZSBndWVzdCBPU2VzLg0KPiA+ID4gPiA+Pj4NCj4gPiA+ID4gPj4+IC0gTm8gTU1V
IGF0IEVMMjoNCj4gPiA+ID4gPj4+ICAgICAgIC0gTm8gRUwyIFN0YWdlIDEgYWRkcmVzcyB0cmFu
c2xhdGlvbg0KPiA+ID4gPiA+Pj4gICAgICAgICAgIC0gWGVuIHByb3ZpZGVzIGZpeGVkIEFSTTY0
IHZpcnR1YWwgbWVtb3J5IGxheW91dCBhcw0KPiBiYXNpcw0KPiA+ID4gb2YNCj4gPiA+ID4gPj4g
RUwyDQo+ID4gPiA+ID4+PiAgICAgICAgICAgICBzdGFnZSAxIGFkZHJlc3MgdHJhbnNsYXRpb24s
IHdoaWNoIGlzIG5vdCBhcHBsaWNhYmxlDQo+IG9uDQo+ID4gPiA+IE1QVQ0KPiA+ID4gPiA+PiBz
eXN0ZW0sDQo+ID4gPiA+ID4+PiAgICAgICAgICAgICB3aGVyZSB0aGVyZSBpcyBubyB2aXJ0dWFs
IGFkZHJlc3NpbmcuIEFzIGEgcmVzdWx0LA0KPiBhbnkNCj4gPiA+ID4gPj4gb3BlcmF0aW9uDQo+
ID4gPiA+ID4+PiAgICAgICAgICAgICBpbnZvbHZpbmcgdHJhbnNpdGlvbiBmcm9tIFBBIHRvIFZB
LCBsaWtlIGlvcmVtYXAsDQo+IG5lZWRzDQo+ID4gPiA+ID4+IG1vZGlmaWNhdGlvbg0KPiA+ID4g
PiA+Pj4gICAgICAgICAgICAgb24gTVBVIHN5c3RlbS4NCj4gPiA+ID4gPj4+ICAgICAgIC0gWGVu
J3MgcnVuLXRpbWUgYWRkcmVzc2VzIGFyZSB0aGUgc2FtZSBhcyB0aGUgbGluayB0aW1lDQo+ID4g
PiA+IGFkZHJlc3Nlcy4NCj4gPiA+ID4gPj4+ICAgICAgICAgICAtIEVuYWJsZSBQSUMgKHBvc2l0
aW9uLWluZGVwZW5kZW50IGNvZGUpIG9uIGEgcmVhbC0NCj4gdGltZQ0KPiA+ID4gPiB0YXJnZXQN
Cj4gPiA+ID4gPj4+ICAgICAgICAgICAgIHByb2Nlc3NvciBwcm9iYWJseSB2ZXJ5IHJhcmUuDQo+
ID4gPiA+ID4+DQo+ID4gPiA+ID4+IEFzaWRlIHRoZSBhc3NlbWJseSBib290IGNvZGUgYW5kIFVF
Rkkgc3R1YiwgWGVuIGFscmVhZHkgcnVucyBhdA0KPiB0aGUNCj4gPiA+ID4gc2FtZQ0KPiA+ID4g
PiA+PiBhZGRyZXNzIGFzIGl0IHdhcyBsaW5rZWQuDQo+ID4gPiA+ID4+DQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBCdXQgdGhlIGRpZmZlcmVuY2UgaXMgdGhhdCwgYmFzZSBvbiBNTVUsIHdlIGNhbiB1
c2UgdGhlIHNhbWUgbGluaw0KPiA+ID4gPiBhZGRyZXNzDQo+ID4gPiA+ID4gZm9yIGFsbCBwbGF0
Zm9ybXMuIEJ1dCBvbiBNUFUgc3lzdGVtLCB3ZSBjYW4ndCBkbyBpdCBpbiB0aGUgc2FtZQ0KPiB3
YXkuDQo+ID4gPiA+DQo+ID4gPiA+IEkgYWdyZWUgdGhhdCB3ZSBjdXJyZW50bHkgdXNlIHRoZSBz
YW1lIGxpbmsgYWRkcmVzcyBmb3IgYWxsIHRoZQ0KPiA+ID4gPiBwbGF0Zm9ybXMuIEJ1dCB0aGlz
IGlzIGFsc28gYSBwcm9ibGVtIHdoZW4gdXNpbmcgTU1VIGJlY2F1c2UgRUwyIGhhcw0KPiBhDQo+
ID4gPiA+IHNpbmdsZSBUVEJSLg0KPiA+ID4gPg0KPiA+ID4gPiBBdCB0aGUgbW9tZW50IHdlIGFy
ZSBzd2l0Y2hpbmcgcGFnZS10YWJsZXMgd2l0aCB0aGUgTU1VIHdoaWNoIGlzIG5vdA0KPiA+ID4g
PiBzYWZlLiBJbnN0ZWFkIHdlIG5lZWQgdG8gdHVybiBvdXQgdGhlIE1NVSBvZmYsIHN3aXRjaCBw
YWdlLXRhYmxlcw0KPiBhbmQNCj4gPiA+ID4gdGhlbiB0dXJuIG9uIHRoZSBNTVUuIFRoaXMgbWVh
bnMgd2UgbmVlZCB0byBoYXZlIGFuIGlkZW50aXR5IG1hcHBpbmcNCj4gb2YNCj4gPiA+ID4gWGVu
IGluIHRoZSBwYWdlLXRhYmxlcy4gQXNzdW1pbmcgWGVuIGlzIG5vdCByZWxvY2F0ZWQsIHRoZSBp
ZGVudGl0eQ0KPiA+ID4gPiBtYXBwaW5nIG1heSBjbGFzaCB3aXRoIFhlbiAob3IgdGhlIHJlc3Qg
b2YgdGhlIHZpcnR1YWwgYWRkcmVzcyBtYXApLg0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IElzIHRo
aXMgdGhlIHNhbWUgcmVhc29uIHdlIGNyZWF0ZSBhIGR1bW15IHJlbG9jIHNlY3Rpb24gZm9yIEVG
SSBsb2FkZXI/DQo+ID4gPg0KPiA+ID4gPiBNeSBpbml0aWFsIGlkZWEgd2FzIHRvIGVuYWJsZSBQ
SUMgYW5kIHVwZGF0ZSB0aGUgcmVsb2NhdGlvbiBhdCBib290DQo+ID4gPiA+IHRpbWUuIEJ1dCB0
aGlzIGlzIGEgYml0IGN1bWJlcnNvbWUgdG8gZG8uIFNvIG5vdyBJIGFtIGxvb2tpbmcgdG8NCj4g
aGF2ZSBhDQo+ID4gPiA+IHNlbWktZHluYW1pYyB2aXJ0dWFsIGxheW91dCBhbmQgZmluZCBzb21l
IHBsYWNlIHRvIHJlbG9jYXRlIHBhcnQgb2YNCj4gWGVuDQo+ID4gPiA+IHRvIHVzZSBmb3IgQ1BV
IGJyaW5nLXVwLg0KPiA+ID4gPg0KPiA+ID4gPiBBbnl3YXksIG15IHBvaW50IGlzIHdlIHBvc3Np
Ymx5IGNvdWxkIGxvb2sgYXQgUElDIGlmIHRoYXQgY291bGQNCj4gYWxsb3cNCj4gPiA+ID4gZ2Vu
ZXJpYyBYZW4gaW1hZ2UuDQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4gSSB1bmRlcnN0YW5kIHlvdXIg
Y29uY2Vybi4gSU1PLCBQSUMgaXMgcG9zc2libGUgdG8gZG8gdGhpcywgYnV0DQo+IG9idmlvdXNs
eSwNCj4gPiA+IGl0J3Mgbm90IGEgc21hbGwgYW1vdW50IG9mIHdvcmsuIEFuZCBJIHdhbnQgdG8g
aGVhciBzb21lIHN1Z2dlc3Rpb25zDQo+IGZyb20NCj4gPiA+IFN0ZWZhbm8sIGJlY2F1c2UgaGUg
YWxzbyBoYXMgc29tZSBzb2x1dGlvbnMgaW4gcHJldmlvdXMgdGhyZWFkLg0KPiA+ID4NCj4gPg0K
PiA+IENhbiB5b3UgaGF2ZSBhIGxvb2sgYXQgdGhlIFBJQyBkaXNjdXNzaW9uIGJldHdlZW4gSnVs
aWVuIGFuZCBtZT8NCj4gPiBJIHRoaW5rIHdlIG1heSBuZWVkIHNvbWUgaW5wdXRzIGZyb20geW91
ciB2aWV3Lg0KPiANCj4gSWYgd2UgaGF2ZSB0byBoYXZlIGEgYnVpbGQtdGltZSBkZXZpY2UgdHJl
ZSBhbnl3YXksIHdlIGNvdWxkDQo+IGF1dG9tYXRpY2FsbHkgZ2VuZXJhdGUgdGhlIGxpbmsgYWRk
cmVzcywgdG9nZXRoZXIgd2l0aCBvdGhlciByZXF1aXJlZA0KPiBhZGRyZXNzZXMuIFRoZXJlIHdv
dWxkIGxpdHRsZSBiZW5lZml0IHRvIGRvIFBJQyBpZiB3ZSBoYXZlIHRvIGhhdmUgYQ0KPiBidWls
ZC10aW1lIGRldmljZSB0cmVlIGluIGFueSBjYXNlLg0KPiANCj4gT24gdGhlIG90aGVyIGhhbmQs
IGlmIHdlIGNvdWxkIGdldCByaWQgb2YgdGhlIGJ1aWxkLXRpbWUgZGV2aWNlIHRyZWUNCj4gYWx0
b2dldGhlciwgdGhlbiB5ZXMgZG9pbmcgUElDIHByb3ZpZGVzIHNvbWUgYmVuZWZpdHMuIEl0IHdv
dWxkIGFsbG93IHVzDQo+IHRvIGhhdmUgc2luZ2xlIFhlbiBiaW5hcnkgd29ya2luZyBvbiBtdWx0
aXBsZSBDb3J0ZXgtUiBib2FyZHMuIEhvd2V2ZXIsDQo+IEkgZG9uJ3QgdGhpbmsgdGhhdCB3b3Vs
ZCBiZSBpbXBvcnRhbnQgZnJvbSBhIHVzZXIgcGVyc3BlY3RpdmUuIFBlb3BsZQ0KPiB3aWxsIG5v
dCBpbnN0YWxsIFVidW50dSBvbiBhIENvcnRleC1SIGFuZCBhcHQtZ2V0IHhlbi4gIFRoZSB0YXJn
ZXQgaXMNCj4gZW1iZWRkZWQ6IHVzZXJzIHdpbGwga25vdyBmcm9tIHRoZSBzdGFydCB0aGUgYm9h
cmQgdGhleSB3aWxsIHRhcmdldCwgc28NCj4gaXQgd291bGQgbm90IGJlIGEgcHJvYmxlbSBmb3Ig
dGhlbSB0byBidWlsZCBYZW4gZm9yIGEgc3BlY2lmaWMgYm9hcmQuDQo+IEltYWdlQnVpbGRlciAo
b3Igc29tZXRoaW5nIGxpa2UgaXQpIHdpbGwgc3RpbGwgYmUgcmVxdWlyZWQgdG8gZ2VuZXJhdGUN
Cj4gYm9vdCBzY3JpcHRzIGFuZCBib290IGluZm8uIEluIG90aGVyIHdvcmRzLCBhbHRob3VnaCBp
dCB3b3VsZCBiZQ0KPiBjb252ZW5pZW50IHRvIHByb2R1Y2UgYSBnZW5lcmljIGJpbmFyeSwgaXQg
aXMgbm90IGEgbXVzdC1oYXZlIGZlYXR1cmUNCj4gYW5kIEkgd291bGQgY29uc2lkZXIgaXQgbG93
LXByaW9yaXR5IGNvbXBhcmVkIHRvIG90aGVycy4NCg0KSSB0ZW5kIHRvIGFncmVlIHdpdGggeW91
ciBvcGluaW9uLiBXZSBjYW4gZ2V0IHNvbWUgYmVuZWZpdCBmcm9tIFBJQywNCmJ1dCB0aGUgcHJp
b3JpdHkgbWF5IGJlIGxvdy4gV2UgaGF2ZSBlbmNvdW50ZXJlZCBhIHByb2JsZW0gd2hlbiB3ZSdy
ZQ0KdHJ5aW5nIHRvIHVzZSBFRkkgbG9hZGVyIHRvIGJvb3QgeGVuLmVmaSBvbiB2OFIuIER1ZSB0
byBsYWNrIG9mIHJlbG9jYXRpb24NCmNhcGFiaWxpdHksIHRoZSBFRkkgbG9hZGVyIGNvdWxkIG5v
dCBsYXVuY2ggeGVuLmVmaSBvbiBWOFIuIEJ1dCBYZW4gRUZJDQpib290IGNhcGFiaWxpdHkgaXMg
YSByZXF1aXJlbWVudCBvZiBBcm0gRUJCUiBbMV0uIEluIG9yZGVyIHRvIHN1cHBvcnQgWGVuDQpF
RkkgYm9vdCBvbiBWOFIsIG1heSBiZSB3ZSBzdGlsbCBuZWVkIGEgcGFydGlhbGx5IHN1cHBvcnRl
ZCBQSUMuIE9ubHkgc29tZQ0KYm9vdCBjb2RlIHN1cHBvcnQgUElDIHRvIG1ha2UgRUZJIHJlbG9j
YXRpb24gaGFwcHkuIFRoaXMgYm9vdCBjb2RlIHdpbGwNCmhlbHAgWGVuIHRvIGNoZWNrIGl0cyBs
b2FkZWQgYWRkcmVzcyBhbmQgcmVsb2NhdGUgWGVuIGltYWdlIHRvIFhlbidzDQpydW4tdGltZSBh
ZGRyZXNzIGlmIG5lZWQuDQoNCkhvdyBhYm91dCB3ZSBwbGFjZSBQSUMgc3VwcG9ydCB0byBUT0RP
IGxpc3QgZm9yIGZ1cnRoZXIgZGlzY3Vzc2lvbiwNCkkgZG9uJ3QgdGhpbmsgd2UgY2FuIGluY2x1
ZGUgc28gbWFueSBpdGVtcyBpbiBkYXkxIDogKSANCg0KWzFdaHR0cHM6Ly9hcm0tc29mdHdhcmUu
Z2l0aHViLmlvL2ViYnIvaW5kZXguaHRtbA0KDQpDaGVlcnMsDQpXZWkgQ2hlbg0KDQoNCg==

