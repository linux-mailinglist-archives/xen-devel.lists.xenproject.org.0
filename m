Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0923250FCE6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 14:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313855.531626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njKHC-0006ec-AG; Tue, 26 Apr 2022 12:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313855.531626; Tue, 26 Apr 2022 12:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njKHC-0006bE-6l; Tue, 26 Apr 2022 12:26:42 +0000
Received: by outflank-mailman (input) for mailman id 313855;
 Tue, 26 Apr 2022 12:26:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vuZH=VE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1njKH9-0006b7-Mz
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 12:26:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e9ab812-c55c-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 14:26:38 +0200 (CEST)
Received: from DB6P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::28) by
 DB7PR08MB3756.eurprd08.prod.outlook.com (2603:10a6:10:79::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.13; Tue, 26 Apr 2022 12:26:35 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::5b) by DB6P191CA0018.outlook.office365.com
 (2603:10a6:6:28::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Tue, 26 Apr 2022 12:26:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Tue, 26 Apr 2022 12:26:34 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Tue, 26 Apr 2022 12:26:34 +0000
Received: from 4bb3d6bd8488.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B4D65FD0-0894-42CE-B3E3-C8081EBF12B0.1; 
 Tue, 26 Apr 2022 12:26:28 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4bb3d6bd8488.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Apr 2022 12:26:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8064.eurprd08.prod.outlook.com (2603:10a6:20b:54d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 12:26:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 12:26:26 +0000
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
X-Inumbo-ID: 1e9ab812-c55c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNUztbPFo3Lr9FHKh0MxM/uivONhzKNC1jZQvPVxjdM=;
 b=BcXj/TJcfBZR8cwPn+Yk+ni+vmiFWY0aKhAowybT7j1H1gHxcqBtbUE4BDNqvXTvXjGwQ0uNcx1CKg76ON52gfcRxWsHaEmThiPIK0EQUCsPNB8REg9tccic2hRnaefEHQKUEyq+eE+FVkTOCStqf+6OtyKKnRGF0oFd7qBLHOg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5e674d52120ff84
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jebITiMSQi0k0NeAz+8J65Dkiez/w+WKRpBwCBZUsxnQNNbU3N/STtzV6iNUaIqr3u+hpfzkkTcusrhlWsobP0/ZyAVUEWGozgGLrkVuLsSmybc1N21esmr1kgI+cIveOaHQplK9Xkb4Oi162zW+x0FIAe/UigXCkyf6ODrXsxgQYIor89VltuFfFZq7cZfUTduFQyCli4DhMMl2Cice/TfVt4d9RAMY7a9W1BM1BpsRJ0zW2apBhps1PFl2pROYFnk0rFA/6zh5L4roWkT14P33d+vx9yVqqfnPzBkRepm83Hwfu3mARaoK2g78vc4srE2fVl8x73yWyybw6rqw7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNUztbPFo3Lr9FHKh0MxM/uivONhzKNC1jZQvPVxjdM=;
 b=fpWR+RGgcM48dI75Ia3IbZ20h3IgJ+DUKXpkFYNIp2hDI2lFSfjVDUjGOqWt5YTmn+qUPt0ppRVBNa96J4r0UgTP08xdxx+WLXiZj/78UtyKJLy6fAgVDEKK0MyVLnWi8RMrPcKx/vQTjGBHl7CcUHUqz4wYon/Zsm114JYNNU85lFrZGf0DFrcZ2Z+Vf47fqmMzrvevMCQTXaaqrPQG5KZOTebgXZIabFt9LqP0/gnTiGOR6p1F2Qq6NnCYP5kNFHahQsSZ03rvrSznJeB88tzqRBFF+tfYFMYUYxlLW3v6J7dPZWQs6Ub3BmwmYcDZgf5xftL2xded9ncf1lhsQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNUztbPFo3Lr9FHKh0MxM/uivONhzKNC1jZQvPVxjdM=;
 b=BcXj/TJcfBZR8cwPn+Yk+ni+vmiFWY0aKhAowybT7j1H1gHxcqBtbUE4BDNqvXTvXjGwQ0uNcx1CKg76ON52gfcRxWsHaEmThiPIK0EQUCsPNB8REg9tccic2hRnaefEHQKUEyq+eE+FVkTOCStqf+6OtyKKnRGF0oFd7qBLHOg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH RFC] EFI: strip xen.efi when putting it on the EFI
 partition
Thread-Topic: [PATCH RFC] EFI: strip xen.efi when putting it on the EFI
 partition
Thread-Index: AQHYWJHILrDj2EEGDUWtEVYmIvMHMK0CII4A
Date: Tue, 26 Apr 2022 12:26:26 +0000
Message-ID: <DFF300CA-944E-47D9-9674-6858790D45C2@arm.com>
References: <394c1b94-beaf-bdcb-c333-65dd9987be54@suse.com>
In-Reply-To: <394c1b94-beaf-bdcb-c333-65dd9987be54@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 401b9f54-094a-4a93-f219-08da278000ba
x-ms-traffictypediagnostic:
	AS8PR08MB8064:EE_|DB5EUR03FT054:EE_|DB7PR08MB3756:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB37563505E234CFCFFB132A149DFB9@DB7PR08MB3756.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 p/vPayEi3jQETSOJRiKCt1NJSvUnOyyHOGXzJREPAcBiEtHQZg58zlISMQ/iLHRFtA+mOpWswCqaLg+GqVqIs4iMOv4QPdOINieQYhgYck8UpELuP5a4pMGNChnD2ckzepZU6uZ0pnRqEcCekiAnD0gLdb4uAvoJ4E5R6VXKiCKaPmxgG69wXwsCGQMV6dAxUCmKsqextOUxXL0eY+6sv6oWtebY/Eqr57kqrVWzhpoqqmv+zqqeVTGS29R5dvPQT/ptjiDn9KGYlcDMK5WfCZG2/my5k1nimQtY5PQ5SokYXwEUOjdGKoWotiwBgWMmcAO2VY1XO898DQT1XI9V+cqbjdm57H4CuHoyVcArs+nO9I0sScSXzCUY3YO+fInZgzrCQxDCSX/H/VguzgKMQpOHkPW4lsAyCVSpxic2s0ULBDuQbCvTFtMq48NDuo8O1fvqiPecoPf/GaVJUWsFIOJKBXtHfswVv0AL5RvZ8JtMHM7XAy/KhkXE3LGwaXWB7HT/NwP+6i5ODiNuKZIt8ZU7hroBuw/KVu1OlOp8++NIjvb4NrsO6eW27A/oRr+h43wokg2oA0HCXO8TvGsxR6L01ppvLmlvWBFlBMQ+tEpWy8iV8u5CKNW+SoSk7iTEsdHE0ZwNe2wfe4JVkQkpx+Hy25aB2/sT3owp4dUXhWq+HUSY/ndW7D1LhTB2ceDaUFYyhLr5FfYBYoNYtJByU+TZjUS6evvIea70rDT7VOiNtF6hWbUIJ6+K+J80MRiU
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(64756008)(66556008)(186003)(66476007)(66446008)(4326008)(5660300002)(66946007)(38100700002)(36756003)(38070700005)(26005)(6506007)(6512007)(53546011)(6916009)(316002)(76116006)(86362001)(54906003)(122000001)(2616005)(33656002)(6486002)(2906002)(83380400001)(508600001)(71200400001)(8936002)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3AB5A1C968F2464E8AA9BCECDC12EF32@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8064
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ea85392e-ec76-44a7-83b7-08da277ffbfa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/ZaQYPLrVKy9E731ehp79QvdwQZRm8iDjcA45sSz5fOAmPrcSPzSDTCJCn6CEu1XmL6Nte6IWIjVJlU+083rVpHqNwO2yoI3ZW0U72AUkurFIjVQtkh0NSHpmAw0jc+3+o3he5nP1LqrVIguAOJic/g5TKq7u5w395Hm35HxEr7uJYKLx5VBBBuVo6ucohZREHDcPku/ml9IvVIjOz7ivcdCKmrvNDPcx4USGv7gyBvf34imH/kjC6DARFWu6PzdmxdFpHIgdnoyRgyOXDaY5F+eWpkKotueSj4uX3WZOpdMkHZ6UR4yzyZ7riL/wqm9Y0iQL6Juizmb6xrQ+8xBt+QaQbOONhm1BMSpBuPTKry4uOTBImJJMZDT1d3uIr/ayjnObHH+4eQKz6r2GVVAALzWDnuLonM4Rlq6TAkQ8TP3tmvSkO1pF/jTjW1LitZB8HEKWz79tBln9TQdrGf/Sew/OgLVwHujjwgVh1ZQ9iVcBHP54BBA4oLPY1ZEf+OCHKz2GMq2506+9CCuN5w99QPbgmSba0i92ctvDYJgdQCVa5yk6ZqXGs//FsKSVUtMol5wZw9vJ3CnuapDnE3PpXnoI2knn2i+qoXDtLb6z9SUVSIiqh03Kl71/qo4QWuGU0zETOzJ7iBilfCtCROandNuUvrazyc1Dul9LAfXP5JSVRyAJBTE4cZ2+djIG3gN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(70586007)(47076005)(6862004)(8936002)(4326008)(2616005)(33656002)(8676002)(70206006)(86362001)(508600001)(83380400001)(6486002)(356005)(6506007)(53546011)(40460700003)(2906002)(6512007)(336012)(5660300002)(82310400005)(81166007)(26005)(54906003)(186003)(36860700001)(36756003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 12:26:34.7739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 401b9f54-094a-4a93-f219-08da278000ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3756

SGkgSmFuLA0KDQo+IE9uIDI1IEFwciAyMDIyLCBhdCAxMTo0NiwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IFdpdGggZGVidWcgaW5mbyByZXRhaW5lZCwgeGVu
LmVmaSBjYW4gYmUgcXVpdGUgbGFyZ2UuIFVubGlrZSBmb3IgeGVuLmd6DQo+IHRoZXJlJ3Mgbm8g
aW50ZXJtZWRpYXRlIHN0ZXAgKG1rZWxmMzIgdGhlcmUpIGludm9sdmVkIHdoaWNoIHdvdWxkIHN0
cmlwDQo+IGRlYnVnIGluZm8ga2luZCBvZiBhcyBhIHNpZGUgZWZmZWN0LiBXaGlsZSB0aGUgaW5z
dGFsbGluZyBvZiB4ZW4uZWZpIG9uDQo+IHRoZSBFRkkgcGFydGl0aW9uIGlzIGFuIG9wdGlvbmFs
IHN0ZXAgKGludGVuZGVkIHRvIGJlIGEgY291cnRlc3kgdG8gdGhlDQo+IGRldmVsb3BlciksIGFk
anVzdCBpdCBhbHNvIGZvciB0aGUgcHVycG9zZSBvZiBkb2N1bWVudGluZyB3aGF0IGRpc3Ryb3MN
Cj4gd291bGQgYmUgZXhwZWN0ZWQgdG8gZG8gZHVyaW5nIGJvb3QgbG9hZGVyIGNvbmZpZ3VyYXRp
b24gKHdoaWNoIGlzIHdoYXQNCj4gd291bGQgbm9ybWFsbHkgcHV0IHhlbi5lZmkgaW50byB0aGUg
RUZJIHBhcnRpdGlvbikuDQo+IA0KPiBNb2RlbCB0aGUgY29udHJvbCBvdmVyIHN0cmlwcGluZyBh
ZnRlciBMaW51eCdlcyBtb2R1bGUgaW5zdGFsbGF0aW9uLA0KPiBleGNlcHQgdGhhdCB0aGUgc3Ry
aXBwZWQgZXhlY3V0YWJsZSBpcyBjb25zdHJ1Y3RlZCBpbiB0aGUgYnVpbGQgYXJlYQ0KPiBpbnN0
ZWFkIG9mIGluIHRoZSBkZXN0aW5hdGlvbiBsb2NhdGlvbi4gVGhpcyBpcyB0byBjb25zZXJ2ZSBv
biBzcGFjZQ0KPiB1c2VkIHRoZXJlIC0gRUZJIHBhcnRpdGlvbnMgdGVuZCB0byBiZSBvbmx5IGEg
ZmV3IGh1bmRyZWQgTWIgaW4gc2l6ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gLS0tDQo+IFJGQzogR05VIHN0cmlwIDIuMzggYXBwZWFy
cyB0byBoYXZlIGlzc3VlcyB3aGVuIGFjdGluZyBvbiBhIFBFIGJpbmFyeToNCj4gICAgIC0gdGhl
IG5ldyBmaWxlIHBvc2l0aW9ucyBvZiB0aGUgc2VjdGlvbnMgZG8gbm90IHJlc3BlY3QgdGhlIGZp
bGUNCj4gICAgICAgYWxpZ25tZW50IHNwZWNpZmllZCBieSB0aGUgaGVhZGVyIChhIHJlc3VsdGlu
ZyBsb29rcyB0byB3b3JrIG9uDQo+ICAgICAgIG9uZSBFRkkgaW1wbGVtZW50YXRpb24gd2hlcmUg
SSBkaWQgYWN0dWFsbHkgdHJ5IGl0LCBidXQgSSBkb24ndA0KPiAgICAgICB0aGluayB3ZSBjYW4g
cmVseSBvbiB0aGF0KSwNCj4gICAgIC0gZmlsZSBuYW1lIHN5bWJvbHMgYXJlIGFsc28gc3RyaXBw
ZWQ7IHdoaWxlIHRoZXJlIGlzIGEgc2VwYXJhdGUNCj4gICAgICAgLS1rZWVwLWZpbGUtc3ltYm9s
cyBvcHRpb24gKHdoaWNoIEkgd291bGQgaGF2ZSB0aG91Z2h0IHRvIGJlIG9uDQo+ICAgICAgIGJ5
IGRlZmF1bHQgYW55d2F5KSwgaXRzIHVzZSBtYWtlcyBubyBkaWZmZXJlbmNlLg0KPiAgICAgT2xk
ZXIgR05VIHN0cmlwIChvYnNlcnZlZCB3aXRoIDIuMzUuMSkgZG9lc24ndCB3b3JrIGF0IGFsbCAo
IkRhdGENCj4gICAgIERpcmVjdG9yeSBzaXplICgxYykgZXhjZWVkcyBzcGFjZSBsZWZ0IGluIHNl
Y3Rpb24gKDgpIikuDQo+IA0KPiAtLS0gYS94ZW4vTWFrZWZpbGUNCj4gKysrIGIveGVuL01ha2Vm
aWxlDQo+IEBAIC00NjEsNiArNDYxLDIyIEBAIGVuZGlmDQo+IC5QSE9OWTogX2J1aWxkDQo+IF9i
dWlsZDogJChUQVJHRVQpJChDT05GSUdfWEVOX0lOU1RBTExfU1VGRklYKQ0KPiANCj4gKyMgU3Ry
aXANCj4gKyMNCj4gKyMgSU5TVEFMTF9FRklfU1RSSVAsIGlmIGRlZmluZWQsIHdpbGwgY2F1c2Ug
eGVuLmVmaSB0byBiZSBzdHJpcHBlZCBiZWZvcmUgaXQNCj4gKyMgaXMgaW5zdGFsbGVkLiBJZiBJ
TlNUQUxMX0VGSV9TVFJJUCBpcyAnMScsIHRoZW4gdGhlIGRlZmF1bHQgb3B0aW9uDQo+ICsjIC0t
c3RyaXAtZGVidWcgd2lsbCBiZSB1c2VkLiBPdGhlcndpc2UsIElOU1RBTExfRUZJX1NUUklQIHZh
bHVlIHdpbGwgYmUgdXNlZA0KPiArIyBhcyB0aGUgb3B0aW9uKHMpIHRvIHRoZSBzdHJpcCBjb21t
YW5kLg0KPiAraWZkZWYgSU5TVEFMTF9FRklfU1RSSVANCj4gKw0KPiAraWZlcSAoJChJTlNUQUxM
X0VGSV9TVFJJUCksMSkNCj4gK2VmaS1zdHJpcC1vcHQgOj0gLS1zdHJpcC1kZWJ1Zw0KPiArZWxz
ZQ0KPiArZWZpLXN0cmlwLW9wdCA6PSAkKElOU1RBTExfRUZJX1NUUklQKQ0KPiArZW5kaWYNCj4g
Kw0KPiArZW5kaWYNCg0KVGhpcyBkb2VzIHNvdW5kIHZlcnkgY29tcGxleCBhbmQgdXNpbmcgY29t
YmluYXRpb24gb2YgaWZkZWYgYW5kIGlmZXEgb24gYW4gZXh0ZXJuYWwgdmFyaWFibGUgaXMgbm90
IGRvbmUgYW55d2hlcmUgZWxzZS4NCg0KSG93IGFib3V0IHNwbGl0dGluZyBpbnRvIGEgdmFyaWFi
bGUgdG8gdHVybiBzdHJpcCBvbiBvciBvZmYgYW5kIGxldCB0aGUgdXNlciBvdmVycmlkZSBhIGxv
Y2FsIHZhcmlhYmxlIHNldHRpbmcgdXAgdGhlIHN0cmlwIG9wdGlvbnMgaWYgaGUgd2FudHMgdG8g
Pw0KDQpTb21ldGhpbmcgbGlrZToNCg0KRUZJX1NUUklQX09QVElPTiA/PSAi4oCUc3RyaXAtZGVi
dWciDQoNCkFuZCB0aGVuIGp1c3QgdXNpbmcgSU5TVEFMTF9FRklfU1RSSVAgdG8gc3RyaXAgb3Ig
bm90IGR1cmluZyB0aGUgX2luc3RhbGwgcGhhc2UgDQoNCk9uZSB3YW50aW5nIHRvIHVzZSBubyBz
cGVjaWZpYyBvcHRpb24gd291bGQgaGF2ZSB0byBwYXNzIElOU1RBTExfRUZJX1NUUklQPTEgRUZJ
X1NUUklQX09QVElPTj3igJzigJ0gZm9yIGV4YW1wbGUuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0K
PiArDQo+IC5QSE9OWTogX2luc3RhbGwNCj4gX2luc3RhbGw6IEQ9JChERVNURElSKQ0KPiBfaW5z
dGFsbDogVD0kKG5vdGRpciAkKFRBUkdFVCkpDQo+IEBAIC00ODUsNiArNTAxLDkgQEAgX2luc3Rh
bGw6ICQoVEFSR0VUKSQoQ09ORklHX1hFTl9JTlNUQUxMXw0KPiAJCWxuIC1zZiAkKFQpLSQoWEVO
X0ZVTExWRVJTSU9OKS5lZmkgJChEKSQoRUZJX0RJUikvJChUKS0kKFhFTl9WRVJTSU9OKS5lZmk7
IFwNCj4gCQlsbiAtc2YgJChUKS0kKFhFTl9GVUxMVkVSU0lPTikuZWZpICQoRCkkKEVGSV9ESVIp
LyQoVCkuZWZpOyBcDQo+IAkJaWYgWyAtbiAnJChFRklfTU9VTlRQT0lOVCknIC1hIC1uICckKEVG
SV9WRU5ET1IpJyBdOyB0aGVuIFwNCj4gKwkJCSQoaWYgJChlZmktc3RyaXAtb3B0KSwgXA0KPiAr
CQkJICAgICAkKFNUUklQKSAkKGVmaS1zdHJpcC1vcHQpIC1wIC1vICQoVEFSR0VUKS5lZmkuc3Ry
aXBwZWQgJChUQVJHRVQpLmVmaSAmJiBcDQo+ICsJCQkgICAgICQoSU5TVEFMTF9EQVRBKSAkKFRB
UkdFVCkuZWZpLnN0cmlwcGVkICQoRCkkKEVGSV9NT1VOVFBPSU5UKS9lZmkvJChFRklfVkVORE9S
KS8kKFQpLSQoWEVOX0ZVTExWRVJTSU9OKS5lZmkgfHwpIFwNCj4gCQkJJChJTlNUQUxMX0RBVEEp
ICQoVEFSR0VUKS5lZmkgJChEKSQoRUZJX01PVU5UUE9JTlQpL2VmaS8kKEVGSV9WRU5ET1IpLyQo
VCktJChYRU5fRlVMTFZFUlNJT04pLmVmaTsgXA0KPiAJCWVsaWYgWyAiJChEKSIgPSAiJChwYXRz
dWJzdCAkKHNoZWxsIGNkICQoWEVOX1JPT1QpICYmIHB3ZCkvJSwlLCQoRCkpIiBdOyB0aGVuIFwN
Cj4gCQkJZWNobyAnRUZJIGluc3RhbGxhdGlvbiBvbmx5IHBhcnRpYWxseSBkb25lIChFRklfVkVO
RE9SIG5vdCBzZXQpJyA+JjI7IFwNCj4gDQo+IA0KDQo=

