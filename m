Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAB549DCE2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:48:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261323.452332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0Ro-0004yt-7g; Thu, 27 Jan 2022 08:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261323.452332; Thu, 27 Jan 2022 08:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0Ro-0004wj-4A; Thu, 27 Jan 2022 08:48:04 +0000
Received: by outflank-mailman (input) for mailman id 261323;
 Thu, 27 Jan 2022 08:48:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xPLH=SL=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nD0Rm-0004wd-Sq
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:48:02 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d575cbd7-7f4d-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 09:48:01 +0100 (CET)
Received: from DB6PR1001CA0031.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::17)
 by PA4PR08MB6286.eurprd08.prod.outlook.com (2603:10a6:102:f2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 08:47:51 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::f6) by DB6PR1001CA0031.outlook.office365.com
 (2603:10a6:4:55::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 08:47:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 08:47:51 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Thu, 27 Jan 2022 08:47:51 +0000
Received: from 0ca3f6b263ce.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4E849FBA-EE48-4784-93F0-5F6424E10DD7.1; 
 Thu, 27 Jan 2022 08:47:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0ca3f6b263ce.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 08:47:45 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VI1PR08MB5376.eurprd08.prod.outlook.com (2603:10a6:803:13e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 27 Jan
 2022 08:47:33 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%7]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 08:47:33 +0000
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
X-Inumbo-ID: d575cbd7-7f4d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w9JL6lBnKDmDtI9N0cPUQ3IpG1eflaM/TnQ7PivLzY=;
 b=piTCOcQriCzYUDtu6c6/awHmv4TZKU+oMZZMTym7nDZbvK4kAjZ1Cy2ryzD//lxJFg2U4N2hre4ZjhIb4yXKUVJoYQO9KlZTMopLDHjBZWpHK6KhEoR9S0wcRZ1oF2LLt/IZyqG/rzfemeqXIUnzSQdQRJEcqtT4Wce1JzewvDY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGIzTikE902Rax/C4KrDpwaNIIFtzVG+Dskt9ycIwZRCktUYmvTpu1xtNITwnfnmxo2FXtspwmKtOo/OCjf4ULlZcC62MS1xVL2yTGQmhNilDsfVV8dOzYDaXPMFm0C4kvobu0On5oaohr3Lh9KySxz7FPlk9OmR9qb9H54fLWHYY36ar0SJJpnA4sQ9UPz0faR5u1VtuzRDT0xJ2TkUJUB7IZ1rhQmuQmkp8jfBvKOyNb4dgpqOFsNc7a66KvBC3QCPgGjjrMjAgiG6OdgaEGsz3yGStT/C4nWwGKHBoOQreWZsv+U4cvHK5wCrJQjL8vCydzvgzBiWwP5Ov1RBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6w9JL6lBnKDmDtI9N0cPUQ3IpG1eflaM/TnQ7PivLzY=;
 b=QkpjM+8m8yoMHn8HYBkcYWJHX6+W+FHwugzFlq2rft0Z2olYxOSxezDfKUxx4/sdpLVH+AGOaFn+pYDd3ysYxbLb4ychW8+TRE3qB2RH2HWxy36Up+vy+A/YCqHobbIXdoY3zUG985s5+x94OzZn2tzQ5u5xFWfqSSN1Vc5ugZH6FSzB+xl2LMVenlIHK7ys5AkXx5lF1FEU8J43nnQ0KnvY2Mbw7BF3Gutylq2UTVS8cDvIar95SAIG88dtMfEmU9wxN7o8KhBsStcKBPORoigtxZdwdwPnlfEicJmqRUFYjwKhEfRCcSZbTwKVfUNx8axyH6rQgZg/IYmGgXxAVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w9JL6lBnKDmDtI9N0cPUQ3IpG1eflaM/TnQ7PivLzY=;
 b=piTCOcQriCzYUDtu6c6/awHmv4TZKU+oMZZMTym7nDZbvK4kAjZ1Cy2ryzD//lxJFg2U4N2hre4ZjhIb4yXKUVJoYQO9KlZTMopLDHjBZWpHK6KhEoR9S0wcRZ1oF2LLt/IZyqG/rzfemeqXIUnzSQdQRJEcqtT4Wce1JzewvDY=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 16/37] xen/x86: export srat_bad to external
Thread-Topic: [PATCH 16/37] xen/x86: export srat_bad to external
Thread-Index: AQHXsHMnFy02K9wv1EmfXGO37i6/5qx0SfuAgAMEmKCAAAK4AIAAAm5w
Date: Thu, 27 Jan 2022 08:47:33 +0000
Message-ID:
 <PAXPR08MB7420A9C9F95F1F5AB7890F989E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-17-wei.chen@arm.com>
 <de67a7ab-785b-f545-5aa3-36e710db0868@suse.com>
 <PAXPR08MB742092EAA94BF614FCF7EE3E9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <fab7bd72-b370-45dc-90d6-64ea49ce4aa0@suse.com>
In-Reply-To: <fab7bd72-b370-45dc-90d6-64ea49ce4aa0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D6E821699053B24C81287C5F93124F39.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 28bc6f93-2e96-4008-4508-08d9e171b39e
x-ms-traffictypediagnostic:
	VI1PR08MB5376:EE_|DB5EUR03FT007:EE_|PA4PR08MB6286:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB62866F9A0AD8EEEF9D4CFFF59E219@PA4PR08MB6286.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ubCVRzdUGeddujm4yuId1VskOyZhvB1UWQCs3bRew+KYUNgdJtQ0vZm58JZfxzeWAMb8Ufo4BMPP8KCkzp9eGg55ml/MYiMHLUUasxR6lKNFaNzIzUkMxSmqv+BCosk66Yr6GXlLUih83tpruE0w4HBihxQtCy2hhwKhEmX3G4F+bYHT8XXEXKYKm27GfQKXwxG7S5CUS4nywuU3TF7W/9eLC8wCf99XxTlrlwdhul3YNXUIbPDpgeU0DkY4RMGaxJdyIObBtJqfHIMqRNrMp78djil2OOT9bk7U9KeMQ+/DIKzr9uWPkF+31TWQnYUh1mm40gAWN584h/Ej3+ML260dDbluFojprGQbKHsdf7Vm2ez/+LIz/RtG2WqSMEbawXCswUh87E9kGMfjwOH6wwQIQO+5Woh2+m2cgw23thIRIrdQ/xTFoK/3qqWAXqewhXbiemti8zWWFmm0hHN3Dx3Hr6k7cZFc/CSkeTbw1drsXKac3A1uUvSmHESS82dIh+U9yRzAbBfL1UUcNfWAWWm/Ft2mijylbflUHl0Oc3uaQsi3QixziLFC5tJNexNpu2NwxG0t7d2MZqA1Er/Iq8uv9ICvVbH3JAYOeyI/fvQIc1ZNTfuzivqf61BwXJk1jk88eEOQeF5rHElOF/Kn3DZ772Gzf9moTPwFer2iwZMZ8LlZXyOeot/t3tEu6oQsm1UuqRwmySbtgHbR01FglA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(8936002)(8676002)(71200400001)(2906002)(508600001)(86362001)(9686003)(6916009)(66476007)(38070700005)(55016003)(38100700002)(52536014)(316002)(4326008)(66556008)(83380400001)(54906003)(6506007)(66446008)(66946007)(76116006)(33656002)(186003)(53546011)(26005)(7696005)(64756008)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5376
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e40e67e7-29f4-4b22-f21a-08d9e171a954
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PNbFinxXZU3BYZ3ZxA4H3ygc90Tw1XjWYt0k367mTeLB/Q3upX9MHnbuAHTLf1ju6d5BlEh5G2ikwsxB90cbg/usVm3Y8PWeRxaIxmce2HyhEnDhduIo+5vUioE2JZz2klEGAYR/8LWf63XnR4r00o+WBzqduNv8oYIow0z2zDsaX+KJyUSUdCxLXIVfcBEG+UBX7YBtC3BmcWCodzNr4BHt8h156b4FwrectTCQGWAwlKzbqPyzpAqKZxWtUTKtqq0ddfrgX/ryw/W74OJmCBfNSgXMfihZ2DELleOvCMAa4kKrNAsSp4UMewDSYYsvvm93e211R7vpmcWrSulvpD8vdh1vzT+5VWlOZcBjvccVDzpM3RSYwyXC3vYQcSW+Wn+3FP10wgiZwk4fr79nVblf/WviQ0NsIonnRDyonG7fod9BIuikzdKbaKa2PYGyK1r2Fd3OE9zzYPn8jWawf4wjhR9KQ1LdglkPG3UcQtfxu7NRCdI4cSF2p9twLgy3S475nTuTCIkkp4lF+Fqd37/KvjYHx2NbNo3nqatyetaV7jrxoAlJK4119ApY2Jy2LLTOb11/h9+VMwLLNYb438xU5kDQss6JXmg2hhhuRRQKRlCnXOAXnSx2+P6L2wDpiqkHM7nCJivN+Ik9VO1zLLaDpXkvj2LxgEYo5oSaC0ihjyveCeeSw4H+FdJTGkdX
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(6506007)(7696005)(53546011)(508600001)(186003)(2906002)(52536014)(8676002)(6862004)(4326008)(336012)(86362001)(83380400001)(55016003)(33656002)(26005)(47076005)(8936002)(40460700003)(9686003)(54906003)(316002)(36860700001)(5660300002)(82310400004)(81166007)(356005)(70206006)(70586007)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:47:51.0683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bc6f93-2e96-4008-4508-08d9e171b39e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6286

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgyN+aXpSAxNjozNw0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDE2LzM3XSB4ZW4veDg2OiBleHBvcnQgc3JhdF9iYWQgdG8gZXh0ZXJuYWwN
Cj4gDQo+IE9uIDI3LjAxLjIwMjIgMDk6MzUsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IEhpIEphbiwN
Cj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6IDIwMjLlubQx5pyIMjXml6UgMTg6
MjINCj4gPj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiA+PiBDYzogQmVydHJh
bmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgeGVuLQ0KPiA+PiBkZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZzsgc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsganVsaWVuQHhlbi5v
cmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAxNi8zN10geGVuL3g4NjogZXhwb3J0IHNyYXRf
YmFkIHRvIGV4dGVybmFsDQo+ID4+DQo+ID4+IE9uIDIzLjA5LjIwMjEgMTQ6MDIsIFdlaSBDaGVu
IHdyb3RlOg0KPiA+Pj4gc3JhdF9iYWQgaXMgdXNlZCB3aGVuIE5VTUEgaW5pdGlhbGl6YXRpb24g
Y29kZSBzY2FuIFNSQVQgZmFpbGVkLg0KPiA+Pj4gSXQgd2lsbCB0dXJuIGZ3X251bWEgdG8gZGlz
YWJsZWQgc3RhdHVzLiBJdHMgaW1wbGVtZW50YXRpb24gZGVwZW5kcw0KPiA+Pj4gb24gTlVNQSBp
bXBsZW1lbnRhdGlvbi4gV2Ugd2FudCBldmVyeSBOVU1BIGltcGxlbWVudGF0aW9uIHRvIHByb3Zp
ZGUNCj4gPj4+IHRoaXMgZnVuY3Rpb24gZm9yIGNvbW1vbiBpbml0aWFsaXphdGlvbiBjb2RlLg0K
PiA+Pj4NCj4gPj4+IEluIHRoaXMgcGF0Y2gsIHdlIGV4cG9ydCBzcmF0X2JhZCB0byBleHRlcm5h
bC4gVGhpcyB3aWxsIGFsbG93IHRvDQo+ID4+PiBoYXZlIHRoZSBjb2RlIG1vc3RseSBjb21tb24u
DQo+ID4+DQo+ID4+IEhlcmUgYXMgd2VsbCBhcyBpbiB0aGUgc3ViamVjdCBpdCB3b3VsZCBoZWxw
IGlmIHRoZSBmdW5jdGlvbiBuYW1lDQo+ID4+IHdhc24ndCB0aGUgd3Jvbmcgd2F5IHJvdW5kLiBJ
IGFsc28gZG9uJ3Qgc2VlIGhvdyB5b3UgbWVhbiB0byB1c2UgYQ0KPiA+PiBmdW5jdGlvbiBjb250
YWluaW5nICJzcmF0IiBpbiBpdHMgbmFtZSBmcm9tIG5vbi1BQ1BJIGNvZGUuDQo+ID4+DQo+ID4+
IFBlcmhhcHMgYWxvbmdzaWRlIG51bWFfbW9kZSgpIChzZWUgdGhlIHJlcGx5IHRvIHRoZSBlYXJs
aWVyIHBhdGNoKQ0KPiA+PiB5b3Ugd2FudCB0byBoYXZlIGEgc2V0X251bWFfb2ZmKCkgaGVscGVy
IChuYW1lIHN1YmplY3QgdG8NCj4gPj4gaW1wcm92ZW1lbnQpPw0KPiA+Pg0KPiA+DQo+ID4gWWVz
LCBhY3R1YWxseSwgSSB3YW50IGEgZnVuY3Rpb24gdG8gZGlzYWJsZSB0aGUgbnVtYSB3aGVuIHdl
IGVuY291bnRlcg0KPiA+IGFueSBlcnJvciBpbiBudW1hIGluaXRpYWxpemF0aW9uLiBBbmQgd2Ug
YWxzbyBzbyB3YW50IHRvIGluZGljYXRlIHRoZQ0KPiA+IG51bWEgb2ZmIGlzIGNhdXNlZCBieSBj
b25maWd1cmF0aW9uIGVycm9yLiBTbyB3ZSBoYWQgdGhvdWdodCB0byB1c2UNCj4gPiBudW1hX2Z3
X2ZhdWx0IHRvIHJlcGxhY2Ugc3JhdF9iYWQuDQo+IA0KPiBXaHkgbm90IHNpbXBseSBudW1hX2Jh
ZCgpIG9yLCBzYXksIG51bWFfZGlzYWJsZSgpPw0KPiANCg0KbnVtYV9iYWQgd291bGQgYmUgT0su
DQoNCj4gSmFuDQoNCg==

