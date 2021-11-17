Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 515A3454B12
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 17:36:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226937.392339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnNuA-0008Es-8N; Wed, 17 Nov 2021 16:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226937.392339; Wed, 17 Nov 2021 16:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnNuA-0008D6-5F; Wed, 17 Nov 2021 16:35:26 +0000
Received: by outflank-mailman (input) for mailman id 226937;
 Wed, 17 Nov 2021 16:35:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5X4Q=QE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mnNu8-0008D0-EG
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 16:35:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c1ef830-47c4-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 17:35:23 +0100 (CET)
Received: from AS9PR06CA0054.eurprd06.prod.outlook.com (2603:10a6:20b:463::14)
 by DBBPR08MB6042.eurprd08.prod.outlook.com (2603:10a6:10:20f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 16:35:19 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:463:cafe::ff) by AS9PR06CA0054.outlook.office365.com
 (2603:10a6:20b:463::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 17 Nov 2021 16:35:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Wed, 17 Nov 2021 16:35:18 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110");
 Wed, 17 Nov 2021 16:35:17 +0000
Received: from 8448dd708420.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AE3403FC-D7C8-4510-B064-846C26268A04.1; 
 Wed, 17 Nov 2021 16:35:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8448dd708420.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Nov 2021 16:35:10 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6279.eurprd08.prod.outlook.com (2603:10a6:20b:294::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 16:35:07 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 16:35:07 +0000
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
X-Inumbo-ID: 5c1ef830-47c4-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ie43Xz3RA2BVNzsz7z6PKVadi/E9Qir6lsdO5bTEIbA=;
 b=S6D7uvW90KGu8DhH2H0WrrekpH1xhbHzz+RiiFQnp2d6QOqfCquezizlBkjTS10JqLazFEfRIWlP/Ugu3X9zW9f721y+VxxkwbT33KuwMhWBaYgbmaF43YhxOeMK/pOGyW0kGzo4pc3NP9A0QmWjchoHSR1OUzcG2z8Obtfw+u4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fc4f07fbab604ca7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSQj1duqtmGBvoa8Cfk29nvkXncUudvM5WIHXU7y1UOeEV+jX7giFMuX7lygE1FRfbRPktxzaHaMABnCzMhZfo2WtVQ9FqCywqmad4QYYpNqT7A73gc6RkYGl6W8L0Tdk/619CfDAWrpZZkITwE1wZFrYQ2/Z5BxFZoX7Wim6lRyuFK3hr38AhK+uj79U7avJKq16Q7XOVjjD2JlYMhcxER2Rl5Bn0R1uI59RXqh+OzJYVJya4wg+Fc9w+S1QHwRicE41bX5nhWWYbzb1GKBeL/i2CILyjEvDuLfq5gNnImkkWjmrhWCscZc9YNKai9IbKTgjB4jlr5q4K5FQHBwMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ie43Xz3RA2BVNzsz7z6PKVadi/E9Qir6lsdO5bTEIbA=;
 b=RQ1Uzyz4qusSBCZY+Dl80UV5n9jvpxPJNSZ8WWnGQ1j7OolMaKVUkDrddVw5hkqktMKsD9wUFK1ga8jNAb5A0nuCJffAH+3bHkgD8HeE51ZOkSKrLIWR4HH16BZ17hLnAKapFwIUxM71uHSwHoQ/me3y5MQrJ8nUNx2YQUeilx1SAy/rSn8K9ebdvEwzhplKpHrNaKD6twsHZBOCWP1Ded+fJU8bDlVSwnBzPXh3JHJIv9jnd9fUe7te/ITlep767IMSeDlzFRVYfV75gxh7tn1QD6t4LNNnYLAYotDJd2uM1TJJ2OmdDnTPM4MyBQ4+NZJxkEzuq5QLXswSeOZSzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ie43Xz3RA2BVNzsz7z6PKVadi/E9Qir6lsdO5bTEIbA=;
 b=S6D7uvW90KGu8DhH2H0WrrekpH1xhbHzz+RiiFQnp2d6QOqfCquezizlBkjTS10JqLazFEfRIWlP/Ugu3X9zW9f721y+VxxkwbT33KuwMhWBaYgbmaF43YhxOeMK/pOGyW0kGzo4pc3NP9A0QmWjchoHSR1OUzcG2z8Obtfw+u4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen/ARM - Query about a data abort seen while reading GICD
 registers
Thread-Topic: Xen/ARM - Query about a data abort seen while reading GICD
 registers
Thread-Index: AQHX2v69rH0Wb2BjYUqXheWDWZOLqqwGSWAAgAANoACAAYg3gIAACRuAgAAD2YA=
Date: Wed, 17 Nov 2021 16:35:07 +0000
Message-ID: <BA07700B-D025-492D-A376-513408927F68@arm.com>
References: <1489a1b9-aefa-0ddf-8dba-4a566388cc6f@xilinx.com>
 <CED537AF-44AA-41B8-9458-17A5C43FBECC@arm.com>
 <f91fd718-040e-88a3-ca96-30d1efe9a689@xilinx.com>
 <0ACF6308-EDB0-4B98-A029-1C7B23820198@arm.com>
 <636b9fe8-4c10-45f5-da95-513c87e5939f@xilinx.com>
In-Reply-To: <636b9fe8-4c10-45f5-da95-513c87e5939f@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0da2a74f-b053-45a9-e6ad-08d9a9e83e1a
x-ms-traffictypediagnostic: AS8PR08MB6279:|DBBPR08MB6042:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB6042FB76BB0BA4B5D23659A09D9A9@DBBPR08MB6042.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 e8EOSMi1f+8Mf4U7Wj4/CdaW97FQijAVlZt/Pk5+SA49wB4EBWxRyFGoEWp0sdyNs0+NDPebN9j57W4FgNJusXpZcIiusNsgUT4KiYXKP1OXy118EM24c7DaEXMx5a8OaGRlu8MdYIt/3e2t44lTt544LILZugY7RPqsOt0Ef05Xz2jlVh9i3j+Y05MeL3HQynd6zH2rgLRXqS+F40LLaP/UlavBfuH+Gh9BseHanpV7CXbqmEdS8n481qQpy4Ajhar4+22mk8LQn5hgqsOEJc/laOUI+1pdqZZdXxVqGrn59YWypj2bNCP0nVgqvcRS3nOMOfPIBKOwf3rqHck58dhxSk7GK/pqs+vVU/GWfTHxY+hVLtms8NRFWO1KAx9HWPhtfH7EoCkFjjTgrDI/BOsM7T8cFwgSzqufJtBZzSKA+U8s8LEqAYFAHvDtl8LEXjUpMCrXriAS3Gv2NBTT72IOUJG8Fk86/IInUaxT7hbyNXpEjkcF0LCes8a/OqdT5jg2+8iPok4pyUeKjSUBAMDhRcHbwts/X0waVTeuEU++ihbV5dgROB7tSBQVb89tmSWzyp6z3pjNqP6Jf+85euxQvNhhtWw2BdjBqtDFxxxRHS3w184XuMnySN4z1KQNcJmupKP+/6qxCOubHpVdTEAQ9NVvxFbn/kQFPJxtyE6i5A51/GPqprmLQaP9aakcLP8WzF2yee2fOEiEwW1+QyUO06LVJqKZVV+NEF7tuXGc4QyeDS313oC0G7zryPplxKisYCRqZ/GkTf1829JdtWJHed7QdbYzMqxtlqQRx62RWcRt9VNopnClGqN1fwK7USyDBOAwYuMLMZP51hVGYA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(66446008)(66476007)(86362001)(122000001)(316002)(64756008)(66556008)(38100700002)(8676002)(5660300002)(66946007)(186003)(8936002)(83380400001)(76116006)(54906003)(2616005)(91956017)(4326008)(26005)(6512007)(33656002)(71200400001)(508600001)(966005)(6486002)(53546011)(2906002)(38070700005)(36756003)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <703247B7198E254587858BB4F3B9038F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6279
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	215c7422-4313-43bc-9bb7-08d9a9e83774
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J7f1tQrARmfnyEJcXpiVHs5ChZZ1OcQH6Qeh1vl+FEokxA5UM0I3BMZ1zXJNSmmi0argnl3eEVqfFcuCbjvOJhDq1yQQGtXjAEnmEQ4NpAXQvtQl+Zu0/Nr/Oc8UZDjMhC0bwN1aMNnqscbiJSPOEeQaxbJjJN6y4Ki7228u2cWs2Wjpq86lXzA9IW9UgfFrZwPFTR7s4TBU0SpAMGaiFwuF9MsOWM1fYgXr/UhXNgwbDYjen5q0jBn+PHaNxs1flNTb6c2mhfChb88wyxtdZ40MKleEkxQLbFQCE1LK1mip3ferXPBXx11S6y0f/zo/uTlzZzeP6gr/8z7tAolPB610bf64lVMXPoVmD8YjRw5houfjMbw+cPC9iGwIxK6lxU1ffiyve/jQbaU6j1hQrCCKA1dWgHJ3OSCG/ErItKBpw8OkWICoF435TmpwC7AvTT9cedgjN1owVc+FGcXxtOWoVZTRn67Z7hhAc9GeKs1HUolMZSq9ynZey1rKGv8Rpsy3GeoyurtTtw1ORYH1uagwlyqzr/mfGJs2sDhxfmsyMdfe+/anTykWrhJAsIWOJhY/XOOGJ3apnmVT1X9U0My1Jj3Rz1ziKvoUT3JkFa12sQPt9EmS3vRSjT3p9sIyBVUpvK6yJg0rPUronXEKWI9KRIxDJfv0miJ0nJ7srGPcqqjb4uZjz42pgKT4SHiKp/f4BtJFfhlmrkapALnp6P+lstCnzjFtS76eXk6Q9+nL1ovdxnDCSdiY6BcJHMJ9sAxR/4ii9XdtbP/QhI1G9u8KuWCQL+zepCq/UFmciqY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(6486002)(6862004)(47076005)(26005)(186003)(356005)(82310400003)(966005)(36860700001)(316002)(107886003)(70586007)(508600001)(86362001)(4326008)(6506007)(336012)(8936002)(81166007)(53546011)(8676002)(2906002)(54906003)(36756003)(6512007)(2616005)(33656002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 16:35:18.2496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da2a74f-b053-45a9-e6ad-08d9a9e83e1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6042

SGkgQXlhbiwNCg0KPiBPbiAxNyBOb3YgMjAyMSwgYXQgMTY6MjEsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFuLmt1bWFyLmhhbGRlckB4aWxpbnguY29tPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5k
LA0KPiANCj4gTWFueSB0aGFua3MgZm9yIHlvdXIgcmVzcG9uc2UuDQo+IA0KPiBPbiAxNy8xMS8y
MDIxIDE1OjQ4LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gSGkgQXlhbiwNCj4+PiBPbiAx
NiBOb3YgMjAyMSwgYXQgMTY6MjQsIEF5YW4gS3VtYXIgSGFsZGVyIDxheWFuLmt1bWFyLmhhbGRl
ckB4aWxpbnguY29tPiB3cm90ZToNCj4+PiANCj4+PiBIaSBCZXJ0cmFuZCwNCj4+PiANCj4+PiBU
aGFua3MgZm9yIGxvb2tpbmcgaW50byBpdC4NCj4+PiANCj4+PiBPbiAxNi8xMS8yMDIxIDE1OjM2
LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+PiBIaSBBeWFuLA0KPj4+Pj4gT24gMTYgTm92
IDIwMjEsIGF0IDE1OjI3LCBBeWFuIEt1bWFyIEhhbGRlciA8YXlhbi5rdW1hci5oYWxkZXJAeGls
aW54LmNvbT4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IEhpIFhlbi9Bcm0gZXhwZXJ0cywNCj4+Pj4+
IA0KPj4+Pj4gSSBhbSBmYWNpbmcgYSB2ZXJ5IHN0cmFuZ2UgaXNzdWUgd2hpbGUgcnVubmluZyBh
IGJhcmVtZXRhbCBhcHBsaWNhdGlvbiBhcyBhIERvbVUgZ3Vlc3Qgb24gYXJtNjQgcGxhdGZvcm0u
DQo+Pj4+PiANCj4+Pj4+IFRoZSBiYXJlbWV0YWwgYXBwIHRyaWVzIHRvIHJlYWQgdGhlIEdJQ0Qg
cmVnaXN0ZXIgd2l0aCBwb3N0IGluZGV4aW5nIGFzIGZvbGxvd3MgOi0NCj4+Pj4+IGxkciB4MSwg
PTB4MzAwMTAwMA0KPj4+Pj4gbGRyIHcyLCBbeDFdLCAjNCA8PDwtLS0tLS0gUEMgPSAweDQwMDAw
Y2E4DQo+Pj4+IEluY3JlbWVudCBvbiBvbiBsb2FkIGlzIG5vdCBzdXBwb3J0ZWQgYnkgdGhlIGVt
dWxhdGlvbiBsYXllci4NCj4+PiANCj4+PiBUaGF0IGlzIHN1cnByaXNpbmcuIFRoZSByZWFzb24g
YmVpbmcgaWYgSSB0cnkgdG8gcmVhZCB0aGUgR0lDQyByZWdpc3RlciAoMHgzMDAyMDAwKSB3aXRo
IHBvc3QgaW5kZXhpbmcgdGhlbiBpdCB3b3JrcyBmaW5lLg0KPj4gV2hlbiB0aGUgSVNWIGJpdCBp
cyBub3Qgc2V0LCBYZW4gd291bGQgaGF2ZSB0byBkZWNvZGUgdGhlIGluc3RydWN0aW9uIHRvIGFj
dHVhbGx5IGVtdWxhdGUgdGhlIGFjY2VzcyBhbmQgcHJvcGVybHkgbW9kaWZ5IHRoZSByZWdpc3Rl
cnMgdmFsdWVzIGFzIGxvbmcgYXMgcHJvdmlkaW5nIHRoZSDigJxlbXVsYXRlZOKAnSBhY2Nlc3Mg
dmFsdWUuDQo+IA0KPiBUaGlzIGlzIHZlcnkgaW50ZXJlc3RpbmcuIElzIHRoaXMgYmVpbmcgZG9u
ZSBmb3IgYW55IG9mIHRoZSBvdGhlciBpbnN0cnVjdGlvbnMgaW4gWGVuID8NCg0KTm8gWGVuIGlz
IG5vdCB0cnlpbmcgdG8gZGVjb2RlIGFueSBpbnN0cnVjdGlvbnMuDQpJZiB5b3UgbG9vayBhdCBM
aW51eCBzb3VyY2UgY29kZSwgdGhpcyBpcyB0aGUga2luZCBvZiBzdHVmZiB0aGF0IHRoZSBrZXJu
ZWwgaXMgZGVsZWdhdGluZyB0byB1c2VyIGFwcGxpY2F0aW9uIChxZW11KSB0byBkbyBhcyBpdCBj
YW4gYmUgcXVpdGUgY29tcGxleC4NCg0KPj4gVGhlcmUgaXMgbm90IHN1Y2ggYSBkZWNvZGVyIGlu
IFhlbiByaWdodCBub3cgd2hpY2ggbWVhbnMgdGhvc2Uga2luZCBvZiBhY2Nlc3NlcyBhcmUgbm90
IHN1cHBvcnRlZCBmb3IgZW11bGF0ZWQgbW1pbyBhY2Nlc3Nlcy4NCj4gDQo+IEkgYW0gYWN0dWFs
bHkgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgd2hlcmUgSSB3aWxsIG5lZWQgdG8gbWFrZSB0aGUgY2hh
bmdlcyBpZiBJIGhhdmUgdG8gYWRkIHN1cHBvcnQgZm9yIHRoZSBkZWNvZGVyLiBUaGUgcmVhc29u
IGJlaW5nIHRoaXMgaXNzdWUgaXMgYmVpbmcgZmFjZWQgYnkgb25lIG9mIG91ciBjdXN0b21lciBh
cHBsaWNhdGlvbi4NCj4gQmVzaWRlcyBjaGFuZ2luZyB0aGUgaW5zdHJ1Y3Rpb24gdG8gcHJldmVu
dCBwb3N0IGluY3JlbWVudCwgaXMgdGhlcmUgYW55IG90aGVyIG1pdGlnYXRpb24gPw0KDQpOb3Qg
dGhhdCBJIGtub3cgb2YuDQoNCj4gDQo+IFRoZSByZWFzb24gYmVpbmcgSSBkb24ndCBzZWUgYSB3
YXkgdG8gaW5zdHJ1Y3QgdGhlIGNvbXBpbGVyIHRvIG5vdCBnZW5lcmF0ZSB0aGUgcG9zdCBpbmRl
eGluZyBpbnN0cnVjdGlvbnMuDQoNCllvdSBjYW4gZGVmaW5lIGlvIGFjY2VzcyBmdW5jdGlvbnMg
aW5zdGVhZCBvZiBsZXR0aW5nIHRoZSBjb21waWxlciBnZW5lcmF0ZSB0aGUgcmVhZC93cml0ZSBm
dW5jdGlvbnMuDQpMb29rIGF0IGFyY2gvYXJtNjQvaW5jbHVkZS9hc20tYXJtL2lvLmggaW4gbGlu
dXggZm9yIGV4YW1wbGUuDQoNCj4+PiANCj4+PiBDYW4geW91IHBvaW50IG1lIGluIHNvdXJjZSB3
aGVyZSB0aGlzIGxpbWl0YXRpb24gaXMgc2V0ID8NCj4+IEluIHRoaXMgY2FzZSB0aGUgaXN2IGZp
ZWxkIGlzIHNldCB0byAwIHdoZW4gdGhlIGV4Y2VwdGlvbiBpcyByZWNlaXZlZCBieSBYZW4gd2hp
Y2ggbWVhbnMgdGhlIGRlY29kaW5nIHBhcnQgb2YgSFNSIGlzIGludmFsaWQgc28gWGVuIGlzIG5v
dCBoYW5kbGluZyB0aGUgZW11bGF0aW9uIG9mIHRoZSBhY2Nlc3MuDQo+PiBAanVsaWVuIGFuZCBT
dGVmYW5vOiBJIGhhdmUgYmVlbiBnb2luZyBhcm91bmQgYW5kIGFyb3VuZCB0aGUgY29kZSBidXQg
SSBjYW5ub3QgZmluZCB3aGVyZSB0aGUgdmFsaWQgYml0IG9mIGhzcl9kYWJ0IGlzIGNoZWNrZWQs
IGNvdWxkIHlvdSBoZWxwIG1lIGhlcmUgPw0KPiANCj4gQnkgYW55IGNoYW5jZSwgYXJlIHlvdSBy
ZWZlcnJpbmcgdG8gaHR0cHM6Ly9naXRodWIuY29tL1hpbGlueC94ZW4vYmxvYi80YmQyZGE1OGI1
YjAwOGY3NzQyOTAwN2EzMDdiNjU4ZGI5YzBmNjM2L3hlbi9hcmNoL2FybS9pby5jI0wxMjkgPw0K
DQpZZXMgdGhhbmtzIDotKSBJIHdhcyBzdHVjayBpbiB0cmFwcy5jIGJ1dCBpdCBpcyBhY3R1YWxs
eSBkb25lIGxhdGVyLg0KDQo+IA0KPiBBbHNvLCBwb3N0IGluZGV4aW5nIHdvcmtzIGZvciBzb21l
IG90aGVyIHJlZ2lzdGVycyAoZWcgR0lDQykuIFNvLCBJIGFtIGd1ZXNzaW5nIHRoYXQgdGhlIGJl
aGF2aW91ciBpcyBzcGVjaWZpYyBmb3IgR0lDRCBvciByYW5kb20gPw0KDQpEaXN0cmlidXRvciBp
cyBlbXVsYXRlZCBieSBYZW4uDQpDcHUgcGFydCBvZiB0aGUgR0lDIGlzIHVzaW5nIHRoZSBoYXJk
d2FyZSBzbyBYZW4gaXMgbm90IGVtdWxhdGluZyBpbyBhY2Nlc3MgdG8gdGhpcyBhcmVhLCB0aGUg
cHJvY2Vzc29yIGlzIHdoaWNoIGlzIHdoeSBpdCB3b3JrcyBpbiB0aGF0IGNhc2UuDQoNCkJlcnRy
YW5kDQoNCj4gDQo+IC0gQXlhbg0KPj4+PiBDb3VsZCB5b3UgdHJ5IHdpdGg6DQo+Pj4+IGFkZCB4
MSwgeDEsICM0DQo+Pj4+IGxkciB3MiwgW3gxXQ0KPj4+IA0KPj4+IFRoaXMgd29ya2VkIGZpbmUu
DQo+PiBHb29kIDotKQ0KPj4gQmVydHJhbmQNCj4+PiANCj4+PiAtQXlhbg0KPj4+PiBSZWdhcmRz
DQo+Pj4+IEJlcnRyYW5kDQo+Pj4+PiANCj4+Pj4+IEFuZCB0aGVuIEkgZ2V0IDotDQo+Pj4+PiBI
U1I9MHg5MjAwMDAwNSBwYz0weDAwMDAwMDQwMDAwY2E4IGd2YT0weDMwMDEwMDAgZ3BhPTB4MDAw
MDAwMDMwMDEwMDANCj4+Pj4+IA0KPj4+Pj4gVGhpcyBwcm9ibGVtIG9jY3VycyBvbmx5IHdoaWxl
IHJlYWRpbmcgdGhlIEdJQ0QgcmVnaXN0ZXJzIHdpdGggcG9zdCBpbmRleGluZy4gSWYgSSByZWFk
IHRoZSByZWdpc3RlciB3aXRoIHByZS1pbmRleGluZywgdGhlbiBJIGRvIG5vdCBzZWUgYW55IGFi
b3J0LiBBbHRlcm5hdGl2ZWx5LCBpZiBJIHJlYWQgR0lDQyByZWdpc3RlciB3aXRoIHBvc3QgaW5k
ZXhpbmcsIEkgZG9uJ3Qgc2VlIHRoZSBhYm9ydCBlaXRoZXIuDQo+Pj4+PiANCj4+Pj4+IEZyb20g
dGhlIEhTUiB2YWx1ZSwgSSBpbnRlcnByZXQgaXQgYXMNCj4+Pj4+IEVDID0gMTAwMTAwYiAjIERh
dGEgYWJvcnQgZnJvbSBsb3dlciBleGNlcHRpb24NCj4+Pj4+IElMID0gMWIgIyAzMiBiaXQgaW5z
dHJ1Y3Rpb24gdHJhcHBlZA0KPj4+Pj4gREZTQyA9IDEwMSAjIFRyYW5zbGF0aW9uIGZhdWx0IGxl
dmVsIDENCj4+Pj4+IA0KPj4+Pj4gT24gZGVidWdnaW5nLCBJIGZvdW5kIHRoYXQgdGhlIGFib3J0
IGlzIHRyaWdnZXJlZCBmcm9tDQo+Pj4+PiANCj4+Pj4+IHRyeV9oYW5kbGVfbW1pbygpDQo+Pj4+
PiB7IC4uLg0KPj4+Pj4gICAgLyogQWxsIHRoZSBpbnN0cnVjdGlvbnMgdXNlZCBvbiBlbXVsYXRl
ZCBNTUlPIHJlZ2lvbiBzaG91bGQgYmUgdmFsaWQgKi8NCj4+Pj4+ICAgIGlmICggIWRhYnQudmFs
aWQgKSB7DQo+Pj4+PiANCj4+Pj4+ICAgICAgICByZXR1cm4gSU9fQUJPUlQ7DQo+Pj4+PiAgICB9
DQo+Pj4+PiAuLi4NCj4+Pj4+IH0NCj4+Pj4+IA0KPj4+Pj4gRnJvbSB0aGUgQXJtIFY4IEFybSBz
cGVjcywgSSB1bmRlcnN0YW5kIHRoYXQgZGFidC52YWxpZCBpcyBJU1YsIGJpdFsyNF0gaW4gIklT
UyBlbmNvZGluZyBmb3IgYW4gZXhjZXB0aW9uIGZyb20gYSBEYXRhIEFib3J0Ii4NCj4+Pj4+IA0K
Pj4+Pj4gDQo+Pj4+PiBJIHNhdyB0aGF0IHRoZSBjYWxsZXIgaXMNCj4+Pj4+IA0KPj4+Pj4gZG9f
dHJhcF9ndWVzdF9zeW5jKCkgImNhc2UgSFNSX0VDX0RBVEFfQUJPUlRfTE9XRVJfRUwiDQo+Pj4+
PiB3aGVyZSBkYWJ0LnZhbGlkIGlzIGZhbHNlLg0KPj4+Pj4gSW4gdGhlIHN1Y2Nlc3Mgc2NlbmFy
aW8sIGRhYnQudmFsaWQgaXMgdHJ1ZS4NCj4+Pj4+IA0KPj4+Pj4gSSBjb3VsZCBub3QgZmluZCB0
aGUgY2FsbGVyIGZvciBkb190cmFwX2d1ZXN0X3N5bmMoKQ0KPj4+Pj4gDQo+Pj4+PiBTbywgY2Fu
IGFueW9uZSBoZWxwIG1lIGhlcmUNCj4+Pj4+IDEuIFdobyBpcyB0aGUgY2FsbGVyIGZvciBkb190
cmFwX2d1ZXN0X3N5bmMoKSA/DQo+Pj4+PiAyLiBBbnkgaWRlYSBvbiB3aGF0IHRoZSBpc3N1ZSBp
cyBhbmQgaG93IEkgY2FuIGRlYnVnIGl0IGZ1cnRoZXIgPw0KPj4+Pj4gDQo+Pj4+PiBLaW5kIHJl
Z2FyZHMsDQo+Pj4+PiBBeWFuDQoNCg==

