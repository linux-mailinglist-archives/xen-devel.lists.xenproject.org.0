Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F22755E550
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 16:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357135.585570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6C95-0002Ap-Aq; Tue, 28 Jun 2022 14:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357135.585570; Tue, 28 Jun 2022 14:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6C95-00027s-7w; Tue, 28 Jun 2022 14:24:51 +0000
Received: by outflank-mailman (input) for mailman id 357135;
 Tue, 28 Jun 2022 14:24:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pAZO=XD=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o6C93-00027m-Ha
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 14:24:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60060.outbound.protection.outlook.com [40.107.6.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1051ee85-f6ee-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 16:24:48 +0200 (CEST)
Received: from AM5PR1001CA0044.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::21) by DB9PR08MB6505.eurprd08.prod.outlook.com
 (2603:10a6:10:23e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 14:24:46 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::76) by AM5PR1001CA0044.outlook.office365.com
 (2603:10a6:206:15::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Tue, 28 Jun 2022 14:24:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 14:24:45 +0000
Received: ("Tessian outbound 4748bc5c2894:v121");
 Tue, 28 Jun 2022 14:24:44 +0000
Received: from 95a6fee2ce30.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 48F377B4-CC6C-4173-9E10-9095CB14994C.1; 
 Tue, 28 Jun 2022 14:24:37 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 95a6fee2ce30.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Jun 2022 14:24:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB7165.eurprd08.prod.outlook.com (2603:10a6:20b:41f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 14:24:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5373.017; Tue, 28 Jun 2022
 14:24:35 +0000
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
X-Inumbo-ID: 1051ee85-f6ee-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FQYme7JkvGzhi1p7aFboOYWdbWVT4uBH9PRVFHY1ZJBkYvhPv9aNqk50QuKFtG/lpsdnVD0hjhTDJQ2Vb7UlH7Zl54Q2bxuxZJvoEk/k3q+dgkMxL5lpEK+DybZUOAl3gfx/BGE27m/KgMm6+pwNNq0/9DCA+I/uy3dNT1Mr5yeucjxQOMjkKs+ekh9mCZWfPM+3cf7nD/v53y50O2jsKfsIhX5jGAWRhA7uSIpXLptbAyNvx7bk6vJQYsf83oVKMnpJdsIAGhSWcCrw4A6Xg56jNkmVdK7c0ZtL4czS+olfnP8TNiKLclY5aSy1467o75l67lcBNdifqlezLp0l0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNFCa9PQXZb27xq1mDfcE0Ls2j5jP0DKStu6VYCidqI=;
 b=NfPLgdUGxU9wwEqGN1yBC0bmCWeuul6Q9vagNLccyo/K8KfSUZ2WBnIWrr5gs0sBbXmYL1zafdXxjHAAicxRNKK/FsGHKCReI1h26oyixNqRMIX8KkopDHkFL7IE1ZEmqwSWSbLkhFg115eSMoaFtxoVUFzNEGGS4aTPiKVwzivb0rVGILJfVXNmVNQqhu0niImsz+vodAxqigL0mvu9IADFOQn5jUs1oS23vj/OM4e5i1ZzGXFzQUDd+kwZmwcEHYGiuAJfPi/xQL6X6CKRh+bYryrj6LU67a9KxairuKrZX7NR0+xSG8M2rHA3Gw1TJzUVUcd3JHb0Xq3H5A2h/Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNFCa9PQXZb27xq1mDfcE0Ls2j5jP0DKStu6VYCidqI=;
 b=rlrJ5Mhf/I5LrBRUwU72rYE8sCd8hQ4+iVWKAWEY/5ECfl/AYy7cR4lxEQslhfqR2xztTWPCiXkVqtmy0/wne/L+lCGQuXasKhE/4ji/PbHdtG4MpXRMrKv3AEaeG29Iw6hdn/ZfwrvaS+9BztZ//G2wUbxuViDUE8nQjflT2i8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 07b896fbeff96a15
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEQYUqEYvhAv6CMXDUmrxZpF+5qQ9fayzrMqBfEydZ6xFnTpButIs9sTIYGtK/qNH+wJjW90XgIGh8p2xcredm/uJuMbkHI9jeTSgAic3WaKFCbzQEBlMmyzTBHO70gQOhLbWjr/m+CZcXv7aALmJHaBjy/5dUvIPtlaGZ682Q/S9kiA6AWM4hEQxIVkM9r7/YZq5AcvM5/NqSc+JsUKBRguD6arwGiRR7T9qnfYtzh2bVqXchn+5LaVtTnNNPT3KqG1CwIRHbTOeWSZq7Hvx6WYpGbjJXJJvK6wlZy/Qp/h7hBvfxagODtmTAh5uL3RSn8XQRUdgfvWRnzJPyC/xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNFCa9PQXZb27xq1mDfcE0Ls2j5jP0DKStu6VYCidqI=;
 b=UJUKJMyneFkq/yxyCm1ZHzI73XuAPorMdZZMFlsanLC9WmBIIKinaFz1SX7ytXvfCkIf62UZNHvtn0lMZ+Q3s9ZiU9apGSnq5vHOVvfngUVVr3XVFO8XE5nwHcTOdVeZ9Kop9ETsHH5n7Q5LUu/xHQVUBEPfgQttycAqg2l6PPxxwM3BY4HHxaFouc2IoAiEXw7QOrkjFYQhVv9JofvuPbQGAzwebAGzX2GHq7AUtODFG5ytA9e2R+nQPm0OezKW21ZFtI/yBRh/AhlYUs8Q3zuNqBLAkb80CXSuUAqLI7flTQu1CfM8cJOB6NlUO/VcFp6fhiSWKxHXUO4TEUfb7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNFCa9PQXZb27xq1mDfcE0Ls2j5jP0DKStu6VYCidqI=;
 b=rlrJ5Mhf/I5LrBRUwU72rYE8sCd8hQ4+iVWKAWEY/5ECfl/AYy7cR4lxEQslhfqR2xztTWPCiXkVqtmy0/wne/L+lCGQuXasKhE/4ji/PbHdtG4MpXRMrKv3AEaeG29Iw6hdn/ZfwrvaS+9BztZ//G2wUbxuViDUE8nQjflT2i8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH] xen/arm: Remove most of the *_VIRT_END defines
Thread-Topic: [PATCH] xen/arm: Remove most of the *_VIRT_END defines
Thread-Index: AQHYbt5OQ+9i9MqGEE+kzOfwd/8WE60trFiAgDALKYCAB2BXgA==
Date: Tue, 28 Jun 2022 14:24:35 +0000
Message-ID: <E2A3AE34-D584-4FD6-8101-2668F68A5684@arm.com>
References: <20220523194953.70636-1-julien@xen.org>
 <F2040FC0-C040-46F5-8DD0-79EE0E1B3A1E@arm.com>
 <b8f364cc-ef22-75bb-8362-c44698d318ff@xen.org>
In-Reply-To: <b8f364cc-ef22-75bb-8362-c44698d318ff@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 01a1f524-3385-40b7-b28f-08da5911f30d
x-ms-traffictypediagnostic:
	AM9PR08MB7165:EE_|VE1EUR03FT052:EE_|DB9PR08MB6505:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G5jccSJ6b5IETjnd0g4wWlVISC11icfRaizanuJYMAR0zkvDlbjqO+9kY7CK8wK40eQUWXdpFnpg+qHj1KRyVTZBjexf8uB1RAYBOt4wiG4U43eyYhgAmL+ifm6fFf44m9Z5JHQxzbUNnFLE+9lm9OQ43RbRYthD6OFsg/BtoJ41+fNVkTyGlRWn72U0YI7wFILU7Id4gNflVlpjfOu8u3N7iwaY7v55ms5RiHWliE3RjEKPmkimYSPy5y/V/IQmmRJwsjXTig3FLDNvhnu5oPTx4Zfkh4T/qj8OWOrmaL+0KD2vDtH2oJsgjQyZv263ZDLE26h/hiQsIEm6gfV8VYQfzXs0rRvuQhACqjQLvXGLpmU1K6qVYSmzg+bVlP64qPxwAwZE8YK+v0DsVrIYfUh3eDnbhe5t+uCFORxMdzqs5TwREITQ08SF2nGWTyjbtC0K2xzRBvoc9nFKBVSsJUasTCLkBkSPpkVGbqkva9Rhl6xUxcvpA+ReXnpY+fZ2v80SbJ7F6hGXQBirr8ZVnP6CPTbHKIb5ZYDRod/0ZmGjodg+TDI5cRUZMKQfi64mS+Iczbyi+/5/TH32SjyPErPPBFoVsFOS4Yn2sERearFsQBTaCUULSVAmi9RC2jv6jdYOaH7s3RHo/AnnzZj2vFW+Lod2ExuUKDYX0m0D7qvLm4wYNOskKaN9p4atkPIvcx4/jdYtK4n3rcfZBKDct12/amZfwFEYoISB8JWkIxl5xtbd9p3gD9MdiDce7peQPXYHQWcMR/burljkR6RCA57WbK6GscfrNL5zfixjiMbbfPFA7Z79OzVfwqwTfgwxL3oCwtlWh36XDzWgVL9l1g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(26005)(53546011)(66556008)(38070700005)(91956017)(122000001)(6512007)(2906002)(76116006)(66476007)(66446008)(8676002)(66946007)(64756008)(316002)(36756003)(6506007)(4326008)(38100700002)(41300700001)(478600001)(71200400001)(8936002)(2616005)(6916009)(6486002)(33656002)(186003)(5660300002)(83380400001)(86362001)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <23304E84DE2F0B42BECD0E890DD8183E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7165
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ab9c4029-b539-4eda-ad96-08da5911ed25
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ul1n5d24w2JFM4VYewE6rvN+Gp4RcdPLzH2osjIEXz2iVL9hm7VK17whrk/VJHhqBvQ5IisBe18r1vHOANdG0DhMdRorh+3UW4IyP9gDg2Qypucb1wXtqzBii2g1gB0qoA+9yF5sib9jq5cELSFz2bbQq6IHEoi5uhqc1Rr48EDtuZyMgKbe104owTFIAS9LeR9rfPlHrtTbQb3k2GyFqNWQ+gbyzMGP/qfOfV/65AlFzuUviVvYEW8ZWVdMhEyg6eXUCwYch0aC/hOOop+n0bcnLLgXaZ871nMzRE2GXaTP/kARhsyDy2u0qA5h4+shQ+lygb14tU2SW7hs5qdyAHagPGeYTJ9Mtzr9WTxHHJTIlGtQqICZmEnCP9UdqEONk+EGUs3pOFA8Hz9zKIafxbFp1JxMo+AwfO2iK5Rq719pJyW7iXu3cDeylwFxTtipRt/tdDjPIHjwBcgwN7icrGaFR6oS1rEbfMFVVWDChNg+hZC6P0h8CZm7Vvr3thCXs1OX/zMR09ZY/R1F+j1kEYWnnvpURa4dlB+RoF2tw9SqtepM67/gmlYW2ONbFX1f1tKZg5AIl+fdEWkJWnnxca+qCzQqCXx5LnxhrJU8mH/2P4eaPiTo4UrKUNU5K9rWzHYgzROC/WRYzEhqFNPfge1KgkNLjDJEnPQ1VAPMnerG4s8L72NCZv/EhRa8jESakIYQ5xW/TEcfhRxlwF+i8pPLhhFEjCwapTwCXEl/Hd39a4SypUy5MM7Dtrw9JCZAEsBYpw0B6EZPmFyZ1Mi1EyA1ej+aNmfVRFCW3asMFJiqW2YRV4IlqWA3mzdOgeHC
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(40470700004)(36840700001)(2616005)(6512007)(26005)(83380400001)(41300700001)(6506007)(336012)(186003)(82310400005)(107886003)(5660300002)(40460700003)(86362001)(8676002)(40480700001)(33656002)(6486002)(8936002)(53546011)(70586007)(36756003)(478600001)(4326008)(70206006)(6862004)(36860700001)(82740400003)(54906003)(2906002)(81166007)(316002)(47076005)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 14:24:45.2330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a1f524-3385-40b7-b28f-08da5911f30d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6505

Hi Julien,

> On 23 Jun 2022, at 22:45, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 24/05/2022 09:05, Bertrand Marquis wrote:
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>=20
>>> ----
>>>=20
>>> I noticed that a few functions in Xen expect [start, end[. This is risk=
y
>>> as we may end up with end < start if the region is defined right at the
>>> top of the address space.
>>>=20
>>> I haven't yet tackle this issue. But I would at least like to get rid
>>> of *_VIRT_END.
>>> ---
>>> xen/arch/arm/include/asm/config.h | 18 ++++++++----------
>>> xen/arch/arm/livepatch.c          |  2 +-
>>> xen/arch/arm/mm.c                 | 13 ++++++++-----
>>> 3 files changed, 17 insertions(+), 16 deletions(-)
>>>=20
>>> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/a=
sm/config.h
>>> index 3e2a55a91058..66db618b34e7 100644
>>> --- a/xen/arch/arm/include/asm/config.h
>>> +++ b/xen/arch/arm/include/asm/config.h
>>> @@ -111,12 +111,11 @@
>>> #define FIXMAP_ADDR(n)        (_AT(vaddr_t,0x00400000) + (n) * PAGE_SIZ=
E)
>>>=20
>>> #define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
>>> -#define BOOT_FDT_SLOT_SIZE     MB(4)
>>> -#define BOOT_FDT_VIRT_END      (BOOT_FDT_VIRT_START + BOOT_FDT_SLOT_SI=
ZE)
>>> +#define BOOT_FDT_VIRT_SIZE     _AT(vaddr_t, MB(4))
>>>=20
>>> #ifdef CONFIG_LIVEPATCH
>>> #define LIVEPATCH_VMAP_START   _AT(vaddr_t,0x00a00000)
>>> -#define LIVEPATCH_VMAP_END     (LIVEPATCH_VMAP_START + MB(2))
>>> +#define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
>>> #endif
>>>=20
>>> #define HYPERVISOR_VIRT_START  XEN_VIRT_START
>>> @@ -132,18 +131,18 @@
>>> #define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE=
 - 1)
>>>=20
>>> #define VMAP_VIRT_START        _AT(vaddr_t,0x10000000)
>>> +#define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
>> This looks a bit odd, any reason not to use MB(768) ?
>=20
> This is to match how we define FRAMETABLE_SIZE. It is a lot easier to fig=
ure out how the size was found and match the comment:
>=20
> 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
>                     space
>=20
>> If not then there might be something worse explaining with a comment her=
e.
>=20
> This is really a matter of taste here. I don't think it has to be explain=
ed in the commit message.

You are right make sense with the comment at the beginning of the section i=
n config.h


>=20
> [...]
>=20
>>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>>> index be37176a4725..0607c65f95cd 100644
>>> --- a/xen/arch/arm/mm.c
>>> +++ b/xen/arch/arm/mm.c
>>> @@ -128,9 +128,11 @@ static DEFINE_PAGE_TABLE(xen_first);
>>> /* xen_pgtable =3D=3D root of the trie (zeroeth level on 64-bit, first =
on 32-bit) */
>>> static DEFINE_PER_CPU(lpae_t *, xen_pgtable);
>>> #define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
>>> -/* xen_dommap =3D=3D pages used by map_domain_page, these pages contai=
n
>>> +/*
>>> + * xen_dommap =3D=3D pages used by map_domain_page, these pages contai=
n
>>>  * the second level pagetables which map the domheap region
>>> - * DOMHEAP_VIRT_START...DOMHEAP_VIRT_END in 2MB chunks. */
>>> + * starting at DOMHEAP_VIRT_START in 2MB chunks.
>>> + */
>> Please just mention that you also fixed a comment coding style in the co=
mmit message.
>=20
> Sure.
>=20
>>> static DEFINE_PER_CPU(lpae_t *, xen_dommap);
>>> /* Root of the trie for cpu0, other CPU's PTs are dynamically allocated=
 */
>>> static DEFINE_PAGE_TABLE(cpu0_pgtable);
>>> @@ -476,7 +478,7 @@ mfn_t domain_page_map_to_mfn(const void *ptr)
>>>     int slot =3D (va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
>>>     unsigned long offset =3D (va>>THIRD_SHIFT) & XEN_PT_LPAE_ENTRY_MASK=
;
>>>=20
>>> -    if ( va >=3D VMAP_VIRT_START && va < VMAP_VIRT_END )
>>> +    if ( (va >=3D VMAP_VIRT_START) && ((VMAP_VIRT_START - va) < VMAP_V=
IRT_SIZE) )
>>>         return virt_to_mfn(va);
>>>=20
>>>     ASSERT(slot >=3D 0 && slot < DOMHEAP_ENTRIES);
>>> @@ -570,7 +572,8 @@ void __init remove_early_mappings(void)
>>>     int rc;
>>>=20
>>>     /* destroy the _PAGE_BLOCK mapping */
>>> -    rc =3D modify_xen_mappings(BOOT_FDT_VIRT_START, BOOT_FDT_VIRT_END,
>>> +    rc =3D modify_xen_mappings(BOOT_FDT_VIRT_START,
>>> +                             BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE,
>>>                              _PAGE_BLOCK);
>>>     BUG_ON(rc);
>>> }
>>> @@ -850,7 +853,7 @@ void __init setup_frametable_mappings(paddr_t ps, p=
addr_t pe)
>>>=20
>>> void *__init arch_vmap_virt_end(void)
>>> {
>>> -    return (void *)VMAP_VIRT_END;
>>> +    return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
>>> }
>>>=20
>>> /*


Cheers
Bertrand


