Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0AB7B1625
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 10:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609380.948435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlmUZ-0003HD-JA; Thu, 28 Sep 2023 08:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609380.948435; Thu, 28 Sep 2023 08:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlmUZ-0003FE-G9; Thu, 28 Sep 2023 08:35:27 +0000
Received: by outflank-mailman (input) for mailman id 609380;
 Thu, 28 Sep 2023 08:35:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ABaI=FM=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qlmUX-0003F8-L2
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 08:35:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f75e33d8-5dd9-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 10:35:23 +0200 (CEST)
Received: from AM0P190CA0022.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::32)
 by PAXPR08MB6672.eurprd08.prod.outlook.com (2603:10a6:102:137::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 08:35:18 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:190:cafe::a1) by AM0P190CA0022.outlook.office365.com
 (2603:10a6:208:190::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22 via Frontend
 Transport; Thu, 28 Sep 2023 08:35:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Thu, 28 Sep 2023 08:35:17 +0000
Received: ("Tessian outbound ab4fc72d2cd4:v211");
 Thu, 28 Sep 2023 08:35:17 +0000
Received: from 0826ecf9e73e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91886FD0-ACB9-4427-AC34-179CABD52E51.1; 
 Thu, 28 Sep 2023 08:34:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0826ecf9e73e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Sep 2023 08:34:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB9940.eurprd08.prod.outlook.com (2603:10a6:150:3d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.25; Thu, 28 Sep
 2023 08:34:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404%4]) with mapi id 15.20.6838.024; Thu, 28 Sep 2023
 08:34:45 +0000
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
X-Inumbo-ID: f75e33d8-5dd9-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMVqCK0kXiVmGMX2a2a40fHhjkIkMdApTYGC+hUUqVY=;
 b=wl6ixudMtuf1PDwjlNN0uXEoRWaaPMnxVhClHN2FeQfVyitrbGqiAs2Mtis7Gs6ZYlpyqQaFoAH8FPYZodUctaMI1el6Xo8zUbjJz9iuo/aG0Ld2Vl6aX/d82krAWmFgbfyKmJ1QqWxCLKC+BO4QvxPdgtddaY7tWen/R2PIFfI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cdd7ac4fc2f7aa9c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPcwlowuKmfQ6qzDDooy44A2veC9jiWOZFM8CeV7CTNiNlI83vNTugTC9yjbLe7pwjVPkJz80rjEv91ogwCwj3wyROKs3DTKik+ZQ0gQNCJTv0ajPxPRmhwCImSpLvl0lUJvF0VpTbv7k/0NKFapp+kEHk/35EihocJWtlCTz3LxlE0e7bmd6+6LetZRSVAUm7ggIivPGuZ6u68Cuzv+eRdkdFAHKDq6pBHE+I2ikfd9cZmVPJCVswN9fNJz+znVGdyq2o5sYLRULltnj36i11IjUNHNPLSmAuRWfwHcYyRKNRiV0ltSeK0VSNyiun+9NF3C6Qh0LKZFC0FNSgpoDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMVqCK0kXiVmGMX2a2a40fHhjkIkMdApTYGC+hUUqVY=;
 b=TewFImOj8zZIUqTXZCmW4dkgCXREV6qbgeSUaZIVFxoOc0dGVq8uhbEc+ooUuEYJsabwrDyX7YnkcgppiosFrNFiDWeCS0DoKZdgb1/BlSdDodbmuidIhPKhDevtI+ZwuHiDVrSVSvIsHh5G51bdBFkIJImbOg6qFcs9BRD/g1Wm43avDuRQZ8ueUUigW1rKRK8iybKQZtb39xde1LJ0PF/67JilDHf+xZ4tOwOTVYHWDMAzb0B8zwk9cPN7DUJJuH8UeLgrP9Cb670Hk01yY40pBJpaU2fSNsfmndBYcs2bC+SOJb4pER+iubA+12JRU4ngap0QRkAXeEa4+1bUnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMVqCK0kXiVmGMX2a2a40fHhjkIkMdApTYGC+hUUqVY=;
 b=wl6ixudMtuf1PDwjlNN0uXEoRWaaPMnxVhClHN2FeQfVyitrbGqiAs2Mtis7Gs6ZYlpyqQaFoAH8FPYZodUctaMI1el6Xo8zUbjJz9iuo/aG0Ld2Vl6aX/d82krAWmFgbfyKmJ1QqWxCLKC+BO4QvxPdgtddaY7tWen/R2PIFfI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: Misra rule 10.3 violations report script
Thread-Topic: Misra rule 10.3 violations report script
Thread-Index: AQHZ8eaivorSHG23DU+9+Dq6J0nkFw==
Date: Thu, 28 Sep 2023 08:34:45 +0000
Message-ID: <D36FE722-43D5-4A93-B725-AD4157A1BA61@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB9940:EE_|AM7EUR03FT027:EE_|PAXPR08MB6672:EE_
X-MS-Office365-Filtering-Correlation-Id: b0070657-55c5-4b85-7467-08dbbffdd80b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sq6YkAMTo1grC9jpOCdDVUgYe4FevaAjxV3sjPWn6SkGHZMQWe/ftJRDkaNLXTUSYc9MSHS3bNBeu87jWqpt4WHJPaA3gOjjIjEMUtJ1m9ssG4lXUGi6vG3bg7cBiwMjPCJGe50TvXIIO/BH6w5W0WnKst7vkWRnpZyDgrFhto6AgbJx+rWM9XUQ6O2SuVMMRm5qUNub+nzIizcZLkIL6P+tMcDqsZB1hrZob1SlgpQAMNsdFSd4ZuI9ptS0QTdpurYi2teAz/eJJhPWwbT1jC1Xuv6ZeRikBDLAMMIsiTrt8ZPYvJMs8nI9ePgDByxIj2VbyjROOR0rm9NfKjhkg0yYHxC5SXOBmchyLnCjMyYhVjUojDD/LlaDDl9LIX7pRPnYsceClQykPUE1a28K+49KFu6VjTP+I91GgdV2LO2t2HidIo7Uo8yI7oZxSkYiizmKosHlzfRjD8XAJgdlvd8Oeg3JZkZtYX/WSyxlHx6tV4AcmTAdxAEtEUbv8MY+4dgixCXtwfvAlFY38WzL2jPR4XtoDty3PT/OWHbC3VnYsPdkXoOj2f3La5m6AzFFJI3Y90SjIpVPCFSPQiEdDOu7qtM1YjhENqlYfT8TTdMyRME1aczf2e2uuDS3aU1uifwNEvQyRh7YEkqQ9XBbKw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(346002)(376002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(2906002)(8676002)(8936002)(91956017)(6512007)(76116006)(316002)(66446008)(6916009)(66476007)(66946007)(4744005)(54906003)(64756008)(66556008)(4326008)(41300700001)(478600001)(38070700005)(71200400001)(38100700002)(5660300002)(33656002)(6486002)(6506007)(36756003)(83380400001)(26005)(2616005)(86362001)(99936003)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: multipart/mixed;
	boundary="_002_D36FE72243D54A93B725AD4157A1BA61armcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB9940
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2d850249-be7e-4993-44e8-08dbbffdc4b4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QKQdNbbmdIX3pli8SBLfOgEpb9Li1cqBisXGmAbwtx4dwzZdLbqMYvyAIMNZLAXHdRgVDc+rNIGoyOgvryQrZ+vCE4AEKglTO3ZCi+7x81GS0zxDpRC/7ysO3/AD6d5+MxlGsNruR5JIjxH/r/H50U3GtwwI8fX5hq0263GpcgYsog59nz7XzEXHP+Ng3MVtQV2Jo4DCv6EPKhlJyC4qCEjBdiYFUdtQLvnAP9YXi3kru0US12r6M8miRS4wDCrNkAh7BgHcXPvQB61DqXEvjs5q46N7qaiIO84lp29LgIkS5yWBFOJAkm5ANuWbgDOnC16QnlkP9F59xm9aUU13gju39f2EJblfZgOjgHsNWFbZc5ZCyUyK/Fmo2ORS+p8gjP2G+gcJWxjLSe52t3wZvGEr+nuDKL4rewvpIz8UZUaSRlXhZCQ9CDuRZ9stCsL6MHyhe+xNO2XLCKyuUy15lwHE7Upub3Wi250yZIEBthAkTgfRrU3k7vgIiHOXYZRyZ5DD/TXyyUC6ApvY1lJpeIN7Jx3oKpp7+TrLaFUPtxZKsK+KpqwZQYMwUIWzJKnqG35RAW+vVDZ3he3cPdgTLjhkt7qRx3UdNooOM02qHFoKQi2DY9GVhipdbAc0tzlBLUK60Epz2gy53Nub0trjxtGaGKethwODwW7U1jNYzK5NyT4pCQuhKPxm46PfM+g1aMfNuHSi97QN9r7KoXBCY9s56Zg4iXSj4cYAlGLPOLk4AXhTShW2Vp78mIIEn5DF
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(82310400011)(1800799009)(451199024)(64100799003)(186009)(36840700001)(40470700004)(46966006)(83380400001)(47076005)(36860700001)(40460700003)(40480700001)(5660300002)(45080400002)(70586007)(70206006)(8936002)(41300700001)(54906003)(6486002)(81166007)(6916009)(316002)(99936003)(235185007)(86362001)(356005)(2906002)(4326008)(6512007)(2616005)(33656002)(33964004)(82740400003)(478600001)(8676002)(6506007)(336012)(36756003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 08:35:17.4536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0070657-55c5-4b85-7467-08dbbffdd80b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6672

--_002_D36FE72243D54A93B725AD4157A1BA61armcom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <105CAD3A560B2E46A69BD37922FF8FD9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpJbiB0aGUgbGFzdCBNSVNSQSBtZWV0aW5nIFN0ZWZhbm8gdG9sZCBtZSBhYm91
dCB0aGUgUnVsZSAxMC4zIGFuZCB0aGF0IHdlIGhhdmUgYSBsb3Qgb2YgdmlvbGF0aW9ucywNCmJ1
dCBHQ0MgaGFzIGEgd2F5IHRvIGxpc3QgdGhlbSBhcyB3cml0dGVuIGluIHJ1bGVzLnJzdC4NCg0K
U28gdGhlIGlzc3VlIHdhcyBqdXN0IHRoYXQgd2UgaGF2ZSBhIGxvdCBvZiB2aW9sYXRpb25zLCBt
b3N0IG9mIHRoZW0gY29taW5nIGZyb20gaGVhZGVycyBhbmQgdGhlDQpEZXZlbG9wZXIgbWlnaHQg
ZmVlbCBhIGJpdCBsb3N0IHNpbmNlIHRoZSBudW1iZXIgaXMgdmVyeSBoaWdoLCBzbyBJ4oCZdmUg
ZGV2ZWxvcGVkIHRoaXMgc2NyaXB0IHRvIHRha2UNCnRoZSBHQ0MgYnVpbGQgbG9nIGFuZCBjcmVh
dGUgYSBsaXN0IG9mIHVuaXF1ZSBvY2N1cnJlbmNlcyBvZiB0aGUgdmlvbGF0aW9ucyBzb3J0ZWQg
aW4gZGVzY2VuZGluZw0Kb3JkZXIsIHNvIHRoYXQgd2hvIGhhcyBhIGJpdCBvZiB0aW1lIGNhbiB0
cnkgdG8gZml4IHNvbWUgb2YgdGhvc2UgYW5kIG1heWJlIGNhbiBzdGFydCBmcm9tIHRoZSB0b3AN
Cm9mIHRoZSBsaXN0IHRvIGZpeCBhcyBtYW55IGFzIHBvc3NpYmxlIG9jY3VycmVuY2VzLg0KDQpJ
IGF0dGFjaCB0aGUgc2NyaXB0IGFzIHBhdGNoIGZpbGUuDQoNCkNoZWVycywNCkx1Y2ENCg0K

--_002_D36FE72243D54A93B725AD4157A1BA61armcom_
Content-Type: application/octet-stream;
	name="0001-Script-to-analyse-the-rule-10.3-GCC-output.patch"
Content-Description: 0001-Script-to-analyse-the-rule-10.3-GCC-output.patch
Content-Disposition: attachment;
	filename="0001-Script-to-analyse-the-rule-10.3-GCC-output.patch"; size=4615;
	creation-date="Thu, 28 Sep 2023 08:34:44 GMT";
	modification-date="Thu, 28 Sep 2023 08:34:45 GMT"
Content-ID: <27DD8DBB3DE0514687F159A01F1E9351@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSAwMDM1ZmM2OTNmOGM5N2ZiNDFmZjRlNTY5N2I5MzIxMDQyNDg0YjM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+
CkRhdGU6IFRodSwgMjggU2VwIDIwMjMgMDg6NDg6MzMgKzAxMDAKU3ViamVjdDogW1BBVENIXSBT
Y3JpcHQgdG8gYW5hbHlzZSB0aGUgcnVsZSAxMC4zIEdDQyBvdXRwdXQKClNpZ25lZC1vZmYtYnk6
IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4KLS0tClRoaXMgc2NyaXB0IGlz
IG5vdCBtZWFudCB0byBiZSBwYXJ0IG9mIFhlbiwgSSdtIHNlbmRpbmcgaXQganVzdCBhcyBhIHJl
ZmVyZW5jZS4KLS0tCiB4ZW4vc2NyaXB0cy9ydWxlXzEwXzMucHkgfCAxMTEgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTExIGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDc1NSB4ZW4vc2NyaXB0cy9ydWxlXzEwXzMucHkKCmRpZmYg
LS1naXQgYS94ZW4vc2NyaXB0cy9ydWxlXzEwXzMucHkgYi94ZW4vc2NyaXB0cy9ydWxlXzEwXzMu
cHkKbmV3IGZpbGUgbW9kZSAxMDA3NTUKaW5kZXggMDAwMDAwMDAwMDAwLi40MGIzNGI0NzA4MDgK
LS0tIC9kZXYvbnVsbAorKysgYi94ZW4vc2NyaXB0cy9ydWxlXzEwXzMucHkKQEAgLTAsMCArMSwx
MTEgQEAKKyMhL3Vzci9iaW4vZW52IHB5dGhvbjMKKworaW1wb3J0IG9zCitpbXBvcnQgc3lzCitp
bXBvcnQgcmUKK2Zyb20gYXJncGFyc2UgaW1wb3J0IEFyZ3VtZW50UGFyc2VyCisKKyMgVGhpcyBz
Y3JpcHQgYW5hbHlzZSB0aGUgYnVpbGQgb3V0cHV0IGhhdmluZyB0aGUgR0NDIGNvbnZlcnNpb24g
d2FybmluZworIyBlbmFibGVkIGZvciB3aGF0IGNvbmNlcm5zIHRoZSBydWxlIDEwLjMsIGl0IHBy
b3ZpZGVzIGEgcmVwb3J0IHdpdGggdW5pcXVlCisjIG9jY3VyZW5jZXMgZm9yIGEgdmlvbGF0aW9u
IGxpc3RlZCBhczoKKyMgZmlsZSBwYXRoOmxpbmUgbnVtYmVyOmNvbHVtbiBudW1iZXIgKGNvdW50
KQorIyBUaGUgbGlzdCBpcyBzb3J0ZWQgaW4gZGVzY2VuZGluZyBjb3VudCBvcmRlciwgc28gdGhh
dCBmaXhpbmcgdGhlIHZpb2xhdGlvbnMKKyMgYXQgdGhlIGJlZ2lubmluZyB3aWxsIHByb3ZpZGUg
YSBiZXR0ZXIgaW1wYWN0IG9uIHRoZSB0b3RhbCBjb3VudCBvZiB2aW9sYXRpb25zCisjIEJ1aWxk
IFhlbiB3aXRoIHRoZSBjb21tYW5kIGxpbmUgc3VnZ2VzdGVkIGluIHJ1bGVzLnJzdCBhbmQgZ2Vu
ZXJhdGUgYW4gb3V0cHV0CisjIGZpbGUsIGFuIGV4YW1wbGUgaGVyZSBidWlsZGluZyBmb3IgYXJt
NjQ6CisjIENGTEFHUz0iLVdjb252ZXJzaW9uIC1Xbm8tZXJyb3I9c2lnbi1jb252ZXJzaW9uIC1X
bm8tZXJyb3I9Y29udmVyc2lvbiIgXAorIyBtYWtlIC1DIHhlbiBDUk9TU19DT01QSUxFPSJhYXJj
aDY0LWxpbnV4LWdudS0iIFhFTl9UQVJHRVRfQVJDSD0iYXJtNjQiIFwKKyMgMj4gPih0ZWUgLWEg
Li4vYnVpbGQtYXJtNjQudHh0ID4mMikKKworY2xhc3MgVmlvbGF0aW9uTGlzdDoKKyAgICBjbGFz
cyBMaXN0RWxlbWVudDoKKyAgICAgICAgZGVmIF9faW5pdF9fKHNlbGYsIGZpbGVfcGF0aCwgbGlu
ZV9udW0sIGNvbF9udW0pOgorICAgICAgICAgICAgc2VsZi5wYXRoID0gZmlsZV9wYXRoCisgICAg
ICAgICAgICBzZWxmLmxpbmUgPSBzdHIobGluZV9udW0pCisgICAgICAgICAgICBzZWxmLmNvbCA9
IHN0cihjb2xfbnVtKQorICAgICAgICAgICAgc2VsZi5jb3VudCA9IDEKKworICAgICAgICBkZWYg
X19lcV9fKHNlbGYsIG90aGVyKToKKyAgICAgICAgICAgIGlmIHNlbGYucGF0aCA9PSBvdGhlci5w
YXRoIGFuZCBzZWxmLmxpbmUgPT0gb3RoZXIubGluZSBcCisgICAgICAgICAgICAgICBhbmQgc2Vs
Zi5jb2wgPT0gb3RoZXIuY29sOgorICAgICAgICAgICAgICAgIHJldHVybiBUcnVlCisKKyAgICAg
ICAgICAgIHJldHVybiBGYWxzZQorCisgICAgZGVmIF9faW5pdF9fKHNlbGYpOgorICAgICAgICAj
IF9fbGlzdCBpcyBhIGRpY3Rpb25hcnkgd2l0aCB0aGlzIGZvcm1hdDoKKyAgICAgICAgIyBrZXkg
ICAgICAgICAtPiB2YWx1ZQorICAgICAgICAjIFtmaWxlIHBhdGhdICAgIFthcnJheSBvZiBpdGVt
cyB3aXRoIGxpbmUgbnVtYmVyIGFuZCBjb2wgbnVtYmVyXQorICAgICAgICBzZWxmLl9fbGlzdCA9
IHt9CisKKyAgICBkZWYgYWRkX2VsZW1lbnQoc2VsZiwgZmlsZV9wYXRoLCBsaW5lX251bSwgY29s
X251bSk6CisgICAgICAgIGVudHJ5ID0gc2VsZi5MaXN0RWxlbWVudChmaWxlX3BhdGgsIGxpbmVf
bnVtLCBjb2xfbnVtKQorICAgICAgICBpZiBmaWxlX3BhdGggaW4gc2VsZi5fX2xpc3Qua2V5cygp
OgorICAgICAgICAgICAgaWYgZW50cnkgaW4gc2VsZi5fX2xpc3RbZmlsZV9wYXRoXToKKyAgICAg
ICAgICAgICAgICBmb3IgZWwgaW4gc2VsZi5fX2xpc3RbZmlsZV9wYXRoXToKKyAgICAgICAgICAg
ICAgICAgICAgaWYgZWwgPT0gZW50cnk6CisgICAgICAgICAgICAgICAgICAgICAgICBlbC5jb3Vu
dCArPSAxCisgICAgICAgICAgICBlbHNlOgorICAgICAgICAgICAgICAgIHNlbGYuX19saXN0W2Zp
bGVfcGF0aF0uYXBwZW5kKGVudHJ5KQorICAgICAgICBlbHNlOgorICAgICAgICAgICAgc2VsZi5f
X2xpc3RbZmlsZV9wYXRoXSA9IFtlbnRyeV0KKworICAgIGRlZiB0b19saXN0KHNlbGYpOgorICAg
ICAgICByZXBvcnRfbGlzdCA9IFtdCisgICAgICAgIGZvciBfLCBlbnRyaWVzIGluIHNlbGYuX19s
aXN0Lml0ZW1zKCk6CisgICAgICAgICAgICBmb3IgZW50cnkgaW4gZW50cmllczoKKyAgICAgICAg
ICAgICAgICByZXBvcnRfbGlzdC5hcHBlbmQoZW50cnkpCisKKyAgICAgICAgcmVwb3J0X2xpc3Qu
c29ydChyZXZlcnNlPVRydWUsIGtleT1sYW1iZGEgeDogeC5jb3VudCkKKyAgICAgICAgcmV0dXJu
IHJlcG9ydF9saXN0CisKKyAgICBkZWYgX19zdHJfXyhzZWxmKToKKyAgICAgICAgcmV0ID0gIiIK
KyAgICAgICAgdG90YWwgPSAwCisgICAgICAgIGZvciBlbnRyeSBpbiBzZWxmLnRvX2xpc3QoKToK
KyAgICAgICAgICAgIHJldCArPSBlbnRyeS5wYXRoICsgIjoiICsgZW50cnkubGluZSArICI6IiAr
IGVudHJ5LmNvbCArICIgKCIgXAorICAgICAgICAgICAgICAgICAgICsgc3RyKGVudHJ5LmNvdW50
KSArICIpXG4iCisgICAgICAgICAgICB0b3RhbCArPSBlbnRyeS5jb3VudAorCisgICAgICAgIHJl
dCArPSAiXG5cblRvdGFsIGNvdW50OiAiICsgc3RyKHRvdGFsKSArICJcbiIKKworICAgICAgICBy
ZXR1cm4gcmV0CisKKworZGVmIG1haW4oYXJndik6CisgICAgcGFyc2VyID0gQXJndW1lbnRQYXJz
ZXIocHJvZz0icnVsZV8xMF8zLnB5IikKKyAgICBwYXJzZXIuYWRkX2FyZ3VtZW50KCItbCIsICIt
LWxvZyIsIHJlcXVpcmVkPVRydWUsIHR5cGU9c3RyLAorICAgICAgICAgICAgICAgICAgICAgICAg
aGVscD0iUGF0aCB0byB0aGUgYnVpbGQgbG9nLiIpCisgICAgYXJncyA9IHBhcnNlci5wYXJzZV9h
cmdzKCkKKworICAgIGxvZ19wYXRoID0gb3MucGF0aC5yZWFscGF0aChhcmdzLmxvZykKKyAgICBp
ZiBsb2dfcGF0aCA9PSAiIjoKKyAgICAgICAgcHJpbnQoIlBsZWFzZSBwYXNzIHRoZSBsb2cuIikK
KyAgICAgICAgc3lzLmV4aXQoMSkKKworICAgIHRyeToKKyAgICAgICAgd2l0aCBvcGVuKGxvZ19w
YXRoLCAicnQiKSBhcyBpbmZpbGU6CisgICAgICAgICAgICBsb2dfbGluZXMgPSBpbmZpbGUucmVh
ZGxpbmVzKCkKKyAgICBleGNlcHQgT1NFcnJvciBhcyBlOgorICAgICAgICBwcmludCgiSXNzdWUg
d2l0aCByZWFkaW5nIGZpbGUge306IHt9Ii5mb3JtYXQobG9nX3BhdGgsIGUpKQorICAgICAgICBz
eXMuZXhpdCgxKQorCisgICAgdmlvbGF0aW9uX2VudHJ5ID0gcmUuY29tcGlsZShyJ14oLiopOihc
ZCspOihcZCspOi4qJCcpCisgICAgdmlvbGF0aW9uX2xpc3QgPSBWaW9sYXRpb25MaXN0KCkKKwor
ICAgIGZvciBsaW5lIGluIGxvZ19saW5lczoKKyAgICAgICAgaWYgKCJbLVdzaWduLWNvbnZlcnNp
b25dIiBpbiBsaW5lKSBvciAoIlstV2NvbnZlcnNpb25dIiBpbiBsaW5lKToKKyAgICAgICAgICAg
IGVudHJ5ID0gdmlvbGF0aW9uX2VudHJ5Lm1hdGNoKGxpbmUpCisgICAgICAgICAgICBpZiBlbnRy
eSBhbmQgZW50cnkuZ3JvdXAoMSkgYW5kIGVudHJ5Lmdyb3VwKDIpIGFuZCBlbnRyeS5ncm91cCgz
KToKKyAgICAgICAgICAgICAgICBmaWxlX3BhdGggPSBlbnRyeS5ncm91cCgxKQorICAgICAgICAg
ICAgICAgIGxpbmVfbnVtYmVyID0gaW50KGVudHJ5Lmdyb3VwKDIpKQorICAgICAgICAgICAgICAg
IGNvbF9udW1iZXIgPSBpbnQoZW50cnkuZ3JvdXAoMykpCisgICAgICAgICAgICAgICAgdmlvbGF0
aW9uX2xpc3QuYWRkX2VsZW1lbnQoZmlsZV9wYXRoLCBsaW5lX251bWJlciwgY29sX251bWJlcikK
KyAgICAgICAgICAgIGVsc2U6CisgICAgICAgICAgICAgICAgcHJpbnQoIk1hbGZvcm1lZCByZXBv
cnQgZW50cnkgaW4gZmlsZSB7fTpcbnt9IgorICAgICAgICAgICAgICAgICAgICAgIC5mb3JtYXQo
bG9nX3BhdGgsIGxpbmUpKQorICAgIHByaW50KHZpb2xhdGlvbl9saXN0KQorCisKK2lmIF9fbmFt
ZV9fID09ICJfX21haW5fXyI6CisgICAgbWFpbihzeXMuYXJndlsxOl0pCi0tIAoyLjM0LjEKCg==

--_002_D36FE72243D54A93B725AD4157A1BA61armcom_--

