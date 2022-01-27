Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3564449DC9A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:35:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261306.452276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0FV-0000yi-RP; Thu, 27 Jan 2022 08:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261306.452276; Thu, 27 Jan 2022 08:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0FV-0000vW-O9; Thu, 27 Jan 2022 08:35:21 +0000
Received: by outflank-mailman (input) for mailman id 261306;
 Thu, 27 Jan 2022 08:35:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xPLH=SL=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nD0FU-0000vQ-C7
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:35:20 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe08::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e0d9eaa-7f4c-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 09:35:18 +0100 (CET)
Received: from DU2PR04CA0079.eurprd04.prod.outlook.com (2603:10a6:10:232::24)
 by VI1PR0801MB1872.eurprd08.prod.outlook.com (2603:10a6:800:86::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Thu, 27 Jan
 2022 08:35:15 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::36) by DU2PR04CA0079.outlook.office365.com
 (2603:10a6:10:232::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 08:35:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 08:35:14 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Thu, 27 Jan 2022 08:35:14 +0000
Received: from d266de9932ce.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1311F2D0-FF19-42DE-92F9-0912D78A3BAA.1; 
 Thu, 27 Jan 2022 08:35:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d266de9932ce.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 08:35:04 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS8PR08MB6581.eurprd08.prod.outlook.com (2603:10a6:20b:33a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 08:35:03 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%7]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 08:35:02 +0000
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
X-Inumbo-ID: 0e0d9eaa-7f4c-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mab40k7/0J8oTR/+k8Vujec6oE3MdZUkH3iyI2oUna8=;
 b=l7JZxmIwz8ZySNoeamKjqjCdxptktHx2E+jyzU8cyGydiuI0iFskvpo1TIn0m9j4RtjCzf3Nm8RWvn2BEo3LevhhslEMGuUp3oo46pJ52+B+5vAI8feDxgvHpsCGZ9zGGpaw9jJ1KJhhUGUOBy2wwnSNOCmNePH7hgWzMbBmDjU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIZlkqYkohGaieNnrm9xcmQz/u+XeNshbKMKln+NGei5C8Xrjvhh4BE6t+Xx818T5/kgd6NnUGYLcc80Tm9Fx1ALBF5AXHfrHNOOQ0qJXXpJfLY3EzA79wJfLDDnQ6xx87zxxkc9nLXtB0QB/hlJZelLMm9Gp7Mz0ryw939UMuwUtM84EAY3I1/u+CQeGkIhgMvI6YVpyps4ZYj1VTkc5i0Jz1SClaCJdvIsDAS8t87NYlSs9hIX5kEGjZ6yTlnFuAzAZppkOVw8UfVzkebxZ/L6ceQh9w75zOgh7ISQSxct+9G881h9gPJU1FGNdHVUYA3tsQP9KRZRgsymv2oMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mab40k7/0J8oTR/+k8Vujec6oE3MdZUkH3iyI2oUna8=;
 b=ki+H2Y2P0+U7aMNUeMwubKB6UXClupVgy1wrJxYPGyQOiV4bf28uo6mKLIjyhULpE19ZLpea+3uref+B10aHP1TNhyHE6+izKLFuGiRpEdLDhF0rsPXutgS6TAdntL8xgdnp5Mq10ItRYGj9MTbf2rbVGTnyu2mOdKk9cpEykxYHc43YbCOmTJOOr/raEsgZGTIdPJpyjCSWA+bveL86/2zGZvQ1IC7duwTA7PlYu+23ygi326LGzFN2lP8DHTqkzmnWV7UHK3yp3tc+jvBP1d5twHpGCOWXa1IeLjm8LSFOita4iZ69mguNjpsSElDYdakjgVmBxgzPp5I8Ez8cnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mab40k7/0J8oTR/+k8Vujec6oE3MdZUkH3iyI2oUna8=;
 b=l7JZxmIwz8ZySNoeamKjqjCdxptktHx2E+jyzU8cyGydiuI0iFskvpo1TIn0m9j4RtjCzf3Nm8RWvn2BEo3LevhhslEMGuUp3oo46pJ52+B+5vAI8feDxgvHpsCGZ9zGGpaw9jJ1KJhhUGUOBy2wwnSNOCmNePH7hgWzMbBmDjU=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 16/37] xen/x86: export srat_bad to external
Thread-Topic: [PATCH 16/37] xen/x86: export srat_bad to external
Thread-Index: AQHXsHMnFy02K9wv1EmfXGO37i6/5qx0SfuAgAMEmKA=
Date: Thu, 27 Jan 2022 08:35:02 +0000
Message-ID:
 <PAXPR08MB742092EAA94BF614FCF7EE3E9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-17-wei.chen@arm.com>
 <de67a7ab-785b-f545-5aa3-36e710db0868@suse.com>
In-Reply-To: <de67a7ab-785b-f545-5aa3-36e710db0868@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 582FE7E34CBCE64CBEC2B963402B689D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8bdefd56-1952-4ace-0257-08d9e16ff0dc
x-ms-traffictypediagnostic:
	AS8PR08MB6581:EE_|DB5EUR03FT031:EE_|VI1PR0801MB1872:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB1872477EFD4CD1FD92C689569E219@VI1PR0801MB1872.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FeNIJlgZSFDSs8plf/JDJwfBlSEGp7O544llYibsI1wxFua3tQ3Ruh4exloWRoR89bIdBDGt1nQzWOqSd574gTy3n7EEwRVJC/PAvnkIXVGFhoYcPFBoNcqchlH8ngwguUp7OxDHZexfv5ENoAoaKKUgltG5MBRD5C/9ji3dCFLiiKQ2ZjSd3RnT2MyZrIz5bkkgAadbaQchE3T4CRSEjjQcG2LngUgmW+ZKFrXH599rcU/fF0nuvFHG8vEsVCPc7MmdHLVFGAxYGqztUnRuH5BwlAJhjuwEkDU4fnHDm4hgGH/sm/Jx5E6ML1jxCK71nCXfugtEBeWxvZF1oay8ima0IslXy6w2mpDMdu0vW6QPg7S4BKh+n5F/y/Kc7JRvkw4xGcznq4zf2ERo6agzX0YYw9x0LMIS5NhMicxw5OVNmGNvo9+racTDQqx3VBqMBW5jEbiXg9lMd7nGQJZFU7sMMKBsgJ6lxvp2PnhOOWiOLGxa8uMHk4Nmw7kcXJnoOOLzwz4eiusvFCjL+G6H4sURt129cwlcu3CSTu6/qU21xVDuNQUBG69zj+3+AfaA+4sm5syYYvLPiaI4sSou6ODl1G37E83SeyRKV5+19GRLutuf3YKmtiAEDrl4crkyeKyMW2fC8ECXojoMl2a4xB0xOXGXdtKvmk8hbfAX6CJYuQJYd+R26VGcIXhgjv7u3xC9yr2PaEgKywGgKnOgAg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(38100700002)(66476007)(66556008)(66946007)(2906002)(33656002)(64756008)(4326008)(55016003)(76116006)(8676002)(5660300002)(66446008)(8936002)(52536014)(26005)(9686003)(122000001)(7696005)(38070700005)(6506007)(86362001)(508600001)(71200400001)(316002)(83380400001)(54906003)(53546011)(6916009)(20210929001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6581
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	578c0ef7-3858-45e6-4845-08d9e16fe974
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h7BB7Acjkzg96OT8tneFEhAy5yA1i7DVSxhskRxCMBz/TQQl5gkDDvyuz8uk9wNWgVNnicaZuTuBV0juMek+FXmGWbqrzdhIAkYlobpLh1jMf4RDN5xzBtZUp2/1BRKeqG7d7VRbqnCEg+qIxNGASkYfckCRld/GC1T5gvuXfRA6hXnWbi8TPq4yHhDlRIo2p8lzsJb+PqgocfgTEwU2UAKJg5XlmGOrclhYElzBwnpr7M3kv4tOmyp7pTTiOhykQW6XAzut7dGWj/TFKGK1Ovrb1tbuKkNw8Bn6WbwCzfq5rIoyw2nt+d0JzbvGZ+SSW/S4KG76oYePPvDEbpDnIPObKUcBcyOD63zd07QKJyn0objZGZObsT8bHksVelY5u2Q4X2boYKQ0TQJ/Y9oC8chlAex9+DUgoYzjrizbFC+VpYJ5uF3ATJNhzaQ/r8DGTD0pi9FMpxLKN3ISUsA8qknXAXvmaaWsmYT1lqdeUSCiyLZnCbzNtCug0wwaXlO4r7K+so5a7Xe/uRk8qFETA/wFS+6F/u11Fg+iYoPv6qhhqgdzkCCdEQdTwX3aSDVS/gtYljzWmxrIxdSXOfRSwSwajvxiDYOhUON2VFzPjTnc2ajwG+Y+APHK79WxXILGpMC7rscoC4EffqTUb2Xa2RxBT4eIA1kcT3Fpah+ZiGf0xAH4ri78n7Bt2oUx5DiZ0rtAAterWTvvZxeNOvALDgLlf2PR2aOOpAXjPjq5ZbZMha2Lv6GMM2Rs7v5GOV2vMYKc+ztx1kgg/tYq79cfqA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700004)(8936002)(8676002)(6506007)(336012)(40460700003)(53546011)(55016003)(356005)(9686003)(2906002)(6862004)(186003)(4326008)(52536014)(82310400004)(7696005)(26005)(316002)(47076005)(54906003)(36860700001)(70586007)(83380400001)(81166007)(33656002)(86362001)(508600001)(5660300002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:35:14.8049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdefd56-1952-4ace-0257-08d9e16ff0dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1872

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgyNeaXpSAxODoyMg0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDE2LzM3XSB4ZW4veDg2OiBleHBvcnQgc3JhdF9iYWQgdG8gZXh0ZXJuYWwN
Cj4gDQo+IE9uIDIzLjA5LjIwMjEgMTQ6MDIsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IHNyYXRfYmFk
IGlzIHVzZWQgd2hlbiBOVU1BIGluaXRpYWxpemF0aW9uIGNvZGUgc2NhbiBTUkFUIGZhaWxlZC4N
Cj4gPiBJdCB3aWxsIHR1cm4gZndfbnVtYSB0byBkaXNhYmxlZCBzdGF0dXMuIEl0cyBpbXBsZW1l
bnRhdGlvbiBkZXBlbmRzDQo+ID4gb24gTlVNQSBpbXBsZW1lbnRhdGlvbi4gV2Ugd2FudCBldmVy
eSBOVU1BIGltcGxlbWVudGF0aW9uIHRvIHByb3ZpZGUNCj4gPiB0aGlzIGZ1bmN0aW9uIGZvciBj
b21tb24gaW5pdGlhbGl6YXRpb24gY29kZS4NCj4gPg0KPiA+IEluIHRoaXMgcGF0Y2gsIHdlIGV4
cG9ydCBzcmF0X2JhZCB0byBleHRlcm5hbC4gVGhpcyB3aWxsIGFsbG93IHRvDQo+ID4gaGF2ZSB0
aGUgY29kZSBtb3N0bHkgY29tbW9uLg0KPiANCj4gSGVyZSBhcyB3ZWxsIGFzIGluIHRoZSBzdWJq
ZWN0IGl0IHdvdWxkIGhlbHAgaWYgdGhlIGZ1bmN0aW9uIG5hbWUNCj4gd2Fzbid0IHRoZSB3cm9u
ZyB3YXkgcm91bmQuIEkgYWxzbyBkb24ndCBzZWUgaG93IHlvdSBtZWFuIHRvIHVzZSBhDQo+IGZ1
bmN0aW9uIGNvbnRhaW5pbmcgInNyYXQiIGluIGl0cyBuYW1lIGZyb20gbm9uLUFDUEkgY29kZS4N
Cj4gDQo+IFBlcmhhcHMgYWxvbmdzaWRlIG51bWFfbW9kZSgpIChzZWUgdGhlIHJlcGx5IHRvIHRo
ZSBlYXJsaWVyIHBhdGNoKQ0KPiB5b3Ugd2FudCB0byBoYXZlIGEgc2V0X251bWFfb2ZmKCkgaGVs
cGVyIChuYW1lIHN1YmplY3QgdG8NCj4gaW1wcm92ZW1lbnQpPw0KPiANCg0KWWVzLCBhY3R1YWxs
eSwgSSB3YW50IGEgZnVuY3Rpb24gdG8gZGlzYWJsZSB0aGUgbnVtYSB3aGVuIHdlIGVuY291bnRl
cg0KYW55IGVycm9yIGluIG51bWEgaW5pdGlhbGl6YXRpb24uIEFuZCB3ZSBhbHNvIHNvIHdhbnQg
dG8gaW5kaWNhdGUgdGhlDQpudW1hIG9mZiBpcyBjYXVzZWQgYnkgY29uZmlndXJhdGlvbiBlcnJv
ci4gU28gd2UgaGFkIHRob3VnaHQgdG8gdXNlDQpudW1hX2Z3X2ZhdWx0IHRvIHJlcGxhY2Ugc3Jh
dF9iYWQuDQoNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvc3JhdC5jDQo+ID4gKysrIGIveGVuL2Fy
Y2gveDg2L3NyYXQuYw0KPiA+IEBAIC0xNjMsNyArMTYzLDcgQEAgc3RhdGljIF9faW5pdCB2b2lk
IGN1dG9mZl9ub2RlKGludCBpLCBwYWRkcl90IHN0YXJ0LA0KPiBwYWRkcl90IGVuZCkNCj4gPiAg
CX0NCj4gPiAgfQ0KPiA+DQo+ID4gLXN0YXRpYyBfX2luaXQgdm9pZCBiYWRfc3JhdCh2b2lkKQ0K
PiA+ICtfX2luaXQgdm9pZCBiYWRfc3JhdCh2b2lkKQ0KPiANCj4gTml0OiBPbmNlIGFnYWluLCB3
aGVuIHRvdWNoaW5nIGNvZGUsIHBsZWFzZSB0YWtlIHRoZSBvcHBvcnR1bml0eSBhbmQNCj4gYWRq
dXN0IHN0eWxlIGlzc3VlcyAoaGVyZTogX19pbml0IGFuZCB2b2lkIHdhbnQgdG8gY2hhbmdlIHBs
YWNlcykuDQo+IA0KDQpUaGFua3MgYWdhaW4hDQoNCj4gSmFuDQoNCg==

