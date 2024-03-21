Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDA1885510
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 08:42:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696216.1086924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnD4X-0004wr-0Y; Thu, 21 Mar 2024 07:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696216.1086924; Thu, 21 Mar 2024 07:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnD4W-0004te-TN; Thu, 21 Mar 2024 07:42:44 +0000
Received: by outflank-mailman (input) for mailman id 696216;
 Thu, 21 Mar 2024 07:42:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RpBj=K3=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rnD4V-0004tW-Po
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 07:42:43 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2054.outbound.protection.outlook.com [40.107.13.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98e25d89-e756-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 08:42:41 +0100 (CET)
Received: from DUZPR01CA0075.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::7) by PAVPR08MB9650.eurprd08.prod.outlook.com
 (2603:10a6:102:31a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Thu, 21 Mar
 2024 07:42:07 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::ee) by DUZPR01CA0075.outlook.office365.com
 (2603:10a6:10:3c2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Thu, 21 Mar 2024 07:42:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.12 via Frontend Transport; Thu, 21 Mar 2024 07:42:06 +0000
Received: ("Tessian outbound ff4e98f65004:v300");
 Thu, 21 Mar 2024 07:42:06 +0000
Received: from 37657267ce1b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7F9D0B0B-FAFE-4165-B8AF-CF129322B3A4.1; 
 Thu, 21 Mar 2024 07:42:00 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 37657267ce1b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Mar 2024 07:42:00 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB8310.eurprd08.prod.outlook.com (2603:10a6:20b:555::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Thu, 21 Mar
 2024 07:41:57 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 07:41:57 +0000
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
X-Inumbo-ID: 98e25d89-e756-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=inlfm12s9c5/+JuxtDprhFlfEZ+gQ1LhE5NJHRwq44FBViLh/b6yBJODTbaXn5XV1VVaKRDGkX02jEThnMFI9tfA2rL7ximWFuUj10LKsLx5E3XNpTx9c4w/xKFNeOJsspw9rC6hABrdtChl30/pgFv6YQ5jrR1Gd7e9v0m4jQPTmf4zDTf/ManZEofCsomG5W0BtbBJIF0mZVWLoPSn3HFKa7w6QnYHT7CDWcBHuXiX/edmC2jfnU+yONRWkd6AboGYRIyoJJ27rIHgWXWR5+u8CKlN0UynTu2FwnRxhDf/rd4WmG2GaL/HFC8Y8KwKFmAE0LBnFigqZncEX5+7mQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gMWqMyEG57HtI+Nne8AiZgBeldtDAfIj+AIysJCgmw=;
 b=mFcKrfiH6ooB//+JoK0ATjhOTR/Kp+RSkja6JgMqvT+TQ2NB9wKAffnDmKSGoL6PEkqEKD/IN/iNuozCtVfCWm8hLlA08kocvkx2MY/05ztLsFp7yAtXuNZEoOOucTdgD1DInpTpIb4kWg4AG5TB6zR2wWWlpMRoaVI0HlK5ZeAY7RTdlS+0vnCuhYfGbF7K6mb4L//8eag1BjATLcGfj0eYUNBTlbb8PJqXF8y7ip5Hn0HPxECsejo4wn61n98RsXgHCRknM4RnyHuXxwqmK99M6Z+LtwyaJPTZsVchKgN7qICLZw3WAdmfWxHvjNSyFMsqbuDYokgCWASE+JmUPA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gMWqMyEG57HtI+Nne8AiZgBeldtDAfIj+AIysJCgmw=;
 b=553VnNlehY8bcvsIdisfi3guvkdXNFQOusnmkzoP9fDee/oo2kjX8XeRaPQDCNBOsdZW8Rxxspy3MQwSZtnIXRL6TBxyWRE91eMLy4A+1Z4SmCWVQsnn55cxFRabT3ek8drF+FYTORxg7L0x2dPDXlTgC3qZrKPWRywBzEtw2R8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d0d2b899f0900ac2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnnGPfVZ3Wy5xfWW5sEZ4XmzlFxoZBSs8iW6lXJABIJH7dNvZej9J/ebdjbTtqRfWQ5qXHPy5Fx9de0HFE/ydR2jGyr0fxD5+zVnGT3OC8IXpP0ShSq6z81fIut4yPAj74YdlQiS3v0Emk7psd39sQ91YrAsT8NACtGPCMZpOg3XIjoMKl57QXMmozXqh2K1egl0vWDc1KL/AAhJDZ4cIxgRTb6mq2a4Me9zisT55yusKHt4eIPCaLsa9saCXWqqLEMci/3fNdrukyX4zO81XSqRurNHWP3MOeeoctemB/Tf9SZewaCL3u8YXSFUTt3f477F67PrXn7Mdgabmx9Ujw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gMWqMyEG57HtI+Nne8AiZgBeldtDAfIj+AIysJCgmw=;
 b=L6jHudM5NxUULmxYlMQaNvgDOY+TpOrRuy8LG70PbsooBfYaD8OuM3gv9brT1/x4/i3KJUMrhcJsEig9MLazL7TGkY1llyPSzSoIdx4/k796e6l++va8WMPDnN+rx07wJw0WbwrTQ8+xgpJp5ewNZj+nXqKGtnj4NB+r8+o6euMSp+gM9iJ/AOY+AYN31H2nEVu5II57Mv1uaM4pDbIwH39oCrSqIPql81loOd7PeBO4GaVox0sda8ZuStZvsGgjbL0oAcV84E4AXKqHy4OG3VBU0mTEWJ8S/Rpn3+6hKB9L7zpDkRzKcOxhy/cF9wBhowlsnxHlAiy8AYBMlDtuNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gMWqMyEG57HtI+Nne8AiZgBeldtDAfIj+AIysJCgmw=;
 b=553VnNlehY8bcvsIdisfi3guvkdXNFQOusnmkzoP9fDee/oo2kjX8XeRaPQDCNBOsdZW8Rxxspy3MQwSZtnIXRL6TBxyWRE91eMLy4A+1Z4SmCWVQsnn55cxFRabT3ek8drF+FYTORxg7L0x2dPDXlTgC3qZrKPWRywBzEtw2R8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: John Ernberg <john.ernberg@actia.se>, Peng Fan <peng.fan@nxp.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jonas Blixt
	<jonas.blixt@actia.se>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index:
 AQHaVDuqVQ/kgxLZgUK/m8/hE0ez5bDz198AgAA1LICAAVx4AIAAQjaAgAEdtQCAAynKwIABnCuAgAZ8E4CAKNxCgIAApf0AgAKGQwCAAAbHgIAHmWEAgAtpgACAABVOgIAA6w+A
Date: Thu, 21 Mar 2024 07:41:57 +0000
Message-ID: <2F07325F-428F-4570-BE14-B84DD0A1C9F7@arm.com>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-2-john.ernberg@actia.se>
 <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org>
 <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se>
 <167f0c7a-e037-446c-82f8-2584e35a7af1@xen.org>
 <a265ea2d-9b5f-4726-9395-448b1b669839@actia.se>
 <012b5f83-2f9b-4477-965e-07b8506c0052@xen.org>
 <DU0PR04MB94170CB1F77E3D594A6D0E9488402@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <5a0c8f09-4f01-45e9-892c-86342c0d0ec5@xen.org>
 <08ae764c-3490-4dd1-ab70-7a855a98d16d@actia.se>
 <911ec1bb-3733-4f37-839e-673a88e408ff@actia.se>
 <ab61278a-f3f1-41de-a0b2-eca6f19be103@xen.org>
 <848794f3-a337-49d9-84db-a969970f071b@actia.se>
 <48038c7f-d7cd-4100-a41b-8042bcb93208@xen.org>
 <967020E7-3D03-416A-8BFC-6F4E4BD9D7B5@arm.com>
 <c17e0eeb-b679-4685-9ae9-6662c2035500@actia.se>
 <849f3f5a-b960-444a-a10e-1f2df36c22a7@xen.org>
In-Reply-To: <849f3f5a-b960-444a-a10e-1f2df36c22a7@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB8310:EE_|DB1PEPF00039233:EE_|PAVPR08MB9650:EE_
X-MS-Office365-Filtering-Correlation-Id: 0913460d-b7ad-43b3-51e8-08dc497a6877
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bo25xEzqqfDPPvfyfz3n7RzF8S6YxdwLMvXd6Iiai3odPknmjTj8zbN1PelpjYJnPy+RJpntT0137bGJ7Mr+pvY1Bo/2LizkXu5BcTuuC7U3PwuruL41oGpNGQmKoeRTsYL5vxHhBsLb2HZaReLnBlSR2OT8k4uqhg/+fw8SizgJOT8VcGPu7afAajaWSe46eE1rVGgFD319+d4fH4a7fr7x3mrV0Ewp2nJQK18ser88ciDt2uMnf6POOybDf+ah+hFm/inwjKjrl13AtXQB1L5y5IdBy8XhPl8tTnt8HzetH9Vq4ChGIrWPUEnDu4XI2KsXxGlrEXAE3wP7pO3tY1rUKm0WoFD3fYKtHXgXVcMgIv3cVTRZzSRXH89V+kW1WpYXwC5y0GFyN0YOSLGR/X+vtBtNVewnERFQmyG3xAHNbVl0e6V69mBpFIpy2yJ77oCl9uB/u0NkAjdxYGO+EszYO9Qz2Pa18f4NFZBrikb62qhFhFj9/OY1BsInkuGKxt05NjHFHMImHPolrlIeKiMabYGRqCkHCvmWDwvGGEFjMeg+2eS3obIAnaio5BYoJfBknMZAaHcWFW7BNta5AM1g0KRvyINofS8AclYNp8xG77eI/BcXnpu698vj3KU5HIlQKjtuu9XdXOe1m+J0N/UxYlDz3cRcFqRsmSSZkd/dFi1UbOwwkcT6BhnB3WRyLjyq6R1An9ZFy37kuuXqmPfnSVmOUBeJcumdrCAb62A=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FA5624717F85094CBC0A96DC91DAF9BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8310
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8a9f64aa-afb2-4ce5-5558-08dc497a62f7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iCuyNteej8bwnKdZAvjdId+WLGRHEcgeYbJIzXTaCl/GxKew+vAAy3Q1fwfcHvSEF6EujzpV6dmJeeTaqgose/p5iQ7prp2s5qHNg7EiAOsWIW5EQOHOp7GKPVB5NhTy+u4HJDBgctzv7E8SZkIaQ1bJAs80h+1tzHZAXXiyLFYKqEBeHukOgRJifgfKysFtiEIAEJpPDA5l40v1/fRhx9HtQvfpw0BwfKGcTB6GH9WWpgqixPOGJauVU0TPnFB6/YoOpWJf3Rap6QoytWSyEEKXGKYjPL5s4HJcCgjncXFA1W7zXETZjkgoHzVWvHA9340gRTbDBShPrpgFAoxW6Y9q0M5+YMuBwm5b7yex4QIkMnJpVGYUs9yxYAyQz7pMcQEQB19lM7w0xqrPM4eU7wBfRESsqDGdOtPkBzXZoGc5/rBxMMWdkw8CG+X9RY6Ax3ROrNEnHUugU6dvAOEgdQIoeAwWPSMgOfV/Le4GcDV5uzFPtKMrt9LCmGdVvGELFsscaA0P/knnLN49AfsdSA9vuDQ4WYWaTr9G70paO/dbtKB/S6Am8MMJnLglB1m1ir5MIYO8uuC2Va4SVJNScr+BANlv6VB+0Xqpu8DJfudM8vXTRxFdvGyM9nvwSzTSrEBEX39ml3DaMyI736s4Fw2Qa87JzPz0f1GPFU+iu92RT/Ar2/D4pXu5XTyZD9PXOJg/caTgUXIVNT3Fzkxs6CcW8DkEk5Ap+oKPXfeo44wx6h/kvvIr76YILUxaUHqT
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 07:42:06.7099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0913460d-b7ad-43b3-51e8-08dc497a6877
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9650

Hi,

> On 20 Mar 2024, at 18:40, Julien Grall <julien@xen.org> wrote:
>=20
> Hi John,
>=20
> On 20/03/2024 16:24, John Ernberg wrote:
>> Hi Bertrand,
>> On 3/13/24 11:07, Bertrand Marquis wrote:
>>> Hi,
>>>=20
>>>> On 8 Mar 2024, at 15:04, Julien Grall <julien@xen.org> wrote:
>>>>=20
>>>> Hi John,
>>>>=20
>>>> Thank you for the reply.
>>>>=20
>>>> On 08/03/2024 13:40, John Ernberg wrote:
>>>>> On 3/7/24 00:07, Julien Grall wrote:
>>>>>>   > Ping on the watchdog discussion bits.
>>>>>>=20
>>>>>> Sorry for the late reply.
>>>>>>=20
>>>>>> On 06/03/2024 13:13, John Ernberg wrote:
>>>>>>> On 2/9/24 14:14, John Ernberg wrote:
>>>>>>>>=20
>>>>>>>>>      * IMX_SIP_TIMER_*:  This seems to be related to the watchdog=
.
>>>>>>>>> Shouldn't dom0 rely on the watchdog provided by Xen instead? So t=
hose
>>>>>>>>> call will be used by Xen.
>>>>>>>>=20
>>>>>>>> That is indeed a watchdog SIP, and also for setting the SoC intern=
al RTC
>>>>>>>> if it is being used.
>>>>>>>>=20
>>>>>>>> I looked around if there was previous discussion and only really
>>>>>>>> found [3].
>>>>>>>> Is the xen/xen/include/watchdog.h header meant to be for this kind=
 of
>>>>>>>> watchdog support or is that more for the VM watchdog? Looking at t=
he x86
>>>>>>>> ACPI NMI watchdog it seems like the former, but I have never worke=
d with
>>>>>>>> x86 nor ACPI.
>>>>>>=20
>>>>>> include/watchdog.h contains helper to configure the watchdog for Xen=
. We
>>>>>> also have per-VM watchdog and this is configured by the hypercall
>>>>>> SCHEDOP_watchdog.
>>>>>>=20
>>>>>>>>=20
>>>>>>>> Currently forwarding it to Dom0 has not caused any watchdog resets=
 with
>>>>>>>> our watchdog timeout settings, our specific Dom0 setup and VM coun=
t.
>>>>>>=20
>>>>>> IIUC, the SMC API for the watchdog would be similar to the ACPI NMI
>>>>>> watchdog. So I think it would make more sense if this is not exposed=
 to
>>>>>> dom0 (even if Xen is doing nothing with it).
>>>>>>=20
>>>>>> Can you try to hide the SMCs and check if dom0 still behave properly=
?
>>>>>>=20
>>>>>> Cheers,
>>>>>>=20
>>>>> This SMC manages a hardware watchdog, if it's not pinged within a
>>>>> specific interval the entire board resets.
>>>>=20
>>>> Do you know what's the default interval? Is it large enough so Xen + d=
om0 can boot (at least up to when the watchdog driver is initialized)?
>>>>=20
>>>>> If I block the SMCs the watchdog driver in Dom0 will fail to ping the
>>>>> watchdog, triggering a board reset because the system looks to have
>>>>> become unresponsive. The reason this patch set started is because we
>>>>> couldn't ping the watchdog when running with Xen.
>>>>> In our specific system the bootloader enables the watchdog as early a=
s
>>>>> possible so that we can get watchdog protection for as much of the bo=
ot
>>>>> as we possibly can.
>>>>> So, if we are to block the SMC from Dom0, then Xen needs to take over
>>>>> the pinging. It could be implemented similarly to the NMI watchdog,
>>>>> except that the system will reset if the ping is missed rather than
>>>>> backtrace.
>>>>> It would also mean that Xen will get a whole watchdog driver-category
>>>>> due to the watchdog being vendor and sometimes even SoC specific when=
 it
>>>>> comes to Arm.
>>>>> My understanding of the domain watchdog code is that today the domain
>>>>> needs to call SCHEDOP_watchdog at least once to start the watchdog
>>>>> timer. Since watchdog protection through the whole boot process is
>>>>> desirable we'd need some core changes, such as an option to start the
>>>>> domain watchdog on init. >
>>>>> It's quite a big change to make
>>>>=20
>>>> For clarification, above you seem to mention two changes:
>>>>=20
>>>> 1) Allow Xen to use the HW watchdog
>>>> 2) Allow the domain to use the watchdog early
>>>>=20
>>>> I am assuming by big change, you are referring to 2?
>>>>=20
>>>> , while I am not against doing it if it
>>>>> makes sense, I now wonder if Xen should manage hardware watchdogs.
>>>>> Looking at the domain watchdog code it looks like if a domain does no=
t
>>>>> get enough execution time, the watchdog will not be pinged enough and
>>>>> the guest will be reset. So either watchdog approach requires Dom0 to
>>>>> get execution time. Dom0 also needs to service all the PV backends it=
's
>>>>> responsible for. I'm not sure it's valuable to add another layer of
>>>>> watchdog for this scenario as the end result (checking that the entir=
e
>>>>> system works) is achieved without it as well.
>>>>> So, before I try to find the time to make a proposal for moving the
>>>>> hardware watchdog bit to Xen, do we really want it?
>>>>=20
>>>> Thanks for the details. Given that the watchdog is enabled by the boot=
loader, I think we want Xen to drive the watchdog for two reasons:
>>>> 1) In true dom0less environment, dom0 would not exist
>>>> 2) You are relying on Xen + Dom0 to boot (or at least enough to get th=
e watchdog working) within the watchdog interval.
>>>=20
>>> Definitely we need to consider the case where there is no Dom0.
>>>=20
>>> I think there are in fact 3 different use cases here:
>>> - watchdog fully driven in a domain (dom0 or another): would work if it=
 is expected
>>>    that Xen + Domain boot time is under the watchdog initial refresh ra=
te. I think this
>>>    could make sense on some applications where your system depends on a=
 specific
>>>    domain to be properly booted to work. This would require an initial =
refresh time
>>>    configurable in the boot loader probably.
>> This is our use-case. ^
>> Our dom0 is monitoring and managing the other domains in our system.
>> Without dom0 working the system isn't really working as a whole.
>> @Julien: Would you be ok with the patch set continuing in the direction
>> of the
>> original proposal, letting another party (or me at a later time) impleme=
nt
>> the fully driven by Xen option?
> I am concerned about this particular point from Bertrand:
>=20
> "would work if it is expected that Xen + Domain boot time is under the wa=
tchdog initial refresh rate."
>=20
> How will a user be able to figure out how to initially configure the watc=
hdog? Is this something you can easily configure in the bootloader at runti=
me?

Definitely here it would be better to have the watchdog turned off by defau=
lt and document how to enable it in the firmware.

Even if a long timeout is configured by default, a user could run into trou=
ble if using a linux without watchdog or not running linux or using dom0les=
s without a linux having access to it.
I agree with Julien here that the concern could be that users would come to=
 us instead of NXP if there is system is doing a reset without reasons afte=
r some seconds or minutes.

>=20
>=20
> Overall, I am not for this approach at least in the current status. I wou=
ld be more inclined if there are some documentations explaining how this is=
 supposed to be configured on NXP, so others can use the code.
>=20
> Anyway, this is why we have multiple Arm maintainers for this kind of sit=
uation. If they other agrees with you, then they can ack the patch and this=
 can be merged.

I agree with Stefano that it would be good to have those board supported.

One thing i could suggest until there is a watchdog driver inside Xen is to=
 have a clear Warning at Xen boot on those boards in the console so that we=
 could at least identify the reason easily if a reset occurs for someone.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall



