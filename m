Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E2A610C8F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 10:58:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431813.684417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooLBm-0001dd-PC; Fri, 28 Oct 2022 08:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431813.684417; Fri, 28 Oct 2022 08:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooLBm-0001bj-Km; Fri, 28 Oct 2022 08:58:06 +0000
Received: by outflank-mailman (input) for mailman id 431813;
 Fri, 28 Oct 2022 08:58:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/aT=25=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ooLBk-0001Qc-Oa
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 08:58:04 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2067.outbound.protection.outlook.com [40.107.105.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a10f23d9-569e-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 10:58:02 +0200 (CEST)
Received: from DB9PR06CA0016.eurprd06.prod.outlook.com (2603:10a6:10:1db::21)
 by GV2PR08MB8148.eurprd08.prod.outlook.com (2603:10a6:150:7c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 08:58:00 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::70) by DB9PR06CA0016.outlook.office365.com
 (2603:10a6:10:1db::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Fri, 28 Oct 2022 08:58:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 08:58:00 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Fri, 28 Oct 2022 08:58:00 +0000
Received: from 0ca4b9fa6598.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 23F7E541-CCE8-44B2-8FBD-C5E9836A16D7.1; 
 Fri, 28 Oct 2022 08:57:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0ca4b9fa6598.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Oct 2022 08:57:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB7583.eurprd08.prod.outlook.com (2603:10a6:10:307::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 08:57:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 08:57:37 +0000
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
X-Inumbo-ID: a10f23d9-569e-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OLoBYMTMdgJOcsYGGrm5k6HDOLSMGgCjrJc6L5Bb/Ll0lAxXiAIZkuJb6EVCZPTJJNRMbw6gIFxrTig2dqUpIobpJGaRY4x5/QNEj5MlCDAfbDGRprIgKUyTbiKlZ+JUcHXJ4B/wC51OghDl3Ixr9D2oMHYdU2acTDGm2zBJGszWwrI/JH72UEl0zs0v2yRKNJauc5p8HqHn5DqEqP8dtyY1sWQfwUpTHSuUHcXxTm5JFldSlHFvKRRmaNrzR8dT/eaENUm9r0lG3ZPIfmW/Zh4Ue7Xc97mhNDDFk82FAa0Kz7Gyalt1CW41+sTS5NeoLA/JUWFnNz1mIGU0XbxPhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VNCvhs6oGQQaRUA5pPwEFORpnG7m11d65KmpGF/gaM=;
 b=f7RvW00NmBNtHMgijYaZ4oIa/UCl7w04dgn9HdZOl1Lmt9u1Cm6BIRyltB6J93N1UPGHhay5NL0klqfvCZCWHnc8WBbthimRsfnoy7IeZpa+F7unEpX3RkzNFKZ5a05qSlSbsNRXa4smmyz6V0dPBuRqJT42oJiPi/Xe9pkrlbwLffnVW3wdjHg94WEzRJcjQZOfYPUAtFIVWXTk0Zxv2NM1u9g3f0iS2cM74xOyQ8o2Z0lvKIQvdyeMeIOHN5RQoJz1tbn7S22M2c/WsaLHXUUeHeWV2QqtSMhsixpukewGKeA/eR8B39RJcgLLD6/RbhNk6iouQpAhl/jFyUvmyQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VNCvhs6oGQQaRUA5pPwEFORpnG7m11d65KmpGF/gaM=;
 b=edwn2LAEcDJPI/Z7KXcmTBAd7LsphdQx6KT3z+3cXgBTDVPhoSAhUU/GtPcsAh6XTzijcXgcp4+IoqeD0OIRdXI+V3dsa25BuuJVnajsotNcxHyUrzmyUQe6wYRB6j5RY4Vfqg9FU+NHTy+w8px7U0cejIxzQ+WMRQinQnUF4oQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQEt4SCXUZWU8rzeABhBaAdd6VxHDON2quuyBCJDzCRbC1SH/1xw0gwOLH1HdfHmvRCGCkHHzDnOcZghsrr/PvjoRiizw3sUzhgCg73Fjp33DmmgNETY7Df2M0cjj/7oIMhVF3F1WgbvPqI+nxZ8E7Xyd6ihonAtsZrpJsnP5yTHrK1aPicTuC/Kj/Gk+w01vbZFIhMc0zgnudJUlv6EIu8L3UlFYG76DGRXKFNZuC9miGJ6ZlWlbh6n7fhGDNvEp8T3N4OxLn5Xa8SphufZaJaxmbIcrVxpyV4nBmMuwO2j/CYmdcWwHe65QrpA3IrcFtxep4mGQFB0N3U4XqXH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VNCvhs6oGQQaRUA5pPwEFORpnG7m11d65KmpGF/gaM=;
 b=I8F/eWabGOtid59yAqiWJF4T8NA4iP4qcJlogMIN+lKrkYoUTRwS9df5GImO9BbPdsWcz0lYEGsX7IFo816QmaETbB6dAfJ7WsVtp+XZtX/+HUrnYNStah9WIgNB4oIa+vYSZ4bv0Hq0ZCzCuZTTZqgzu2xgQ1piRRgTHMDeUEDPouuuabXiZeBNSNWI8b5R+dU2Qr1nc0OcfuNkpqFXDvC5hD5Sb4FKJdh6BzdWYs4xfoceC7IKihTHK9MTXl2FCBsDNNWPbdXplt9eY/1ad/P+A/GQIgYuX1JKJLHMKX3guFSa0U8ytaFezKbmGzl68y5lhcrFfOyRkaaAEegd8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VNCvhs6oGQQaRUA5pPwEFORpnG7m11d65KmpGF/gaM=;
 b=edwn2LAEcDJPI/Z7KXcmTBAd7LsphdQx6KT3z+3cXgBTDVPhoSAhUU/GtPcsAh6XTzijcXgcp4+IoqeD0OIRdXI+V3dsa25BuuJVnajsotNcxHyUrzmyUQe6wYRB6j5RY4Vfqg9FU+NHTy+w8px7U0cejIxzQ+WMRQinQnUF4oQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Ayan Kumar Halder <ayankuma@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "stefanos@xilinx.com"
	<stefanos@xilinx.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject:
 =?utf-8?B?UkU6IFtmb3ItNC4xN13CoFJlOiBbWEVOIHYxXSB4ZW4vYXJtOiB2R0lDdjM6?=
 =?utf-8?Q?_Restore_the_interrupt_state_correctly?=
Thread-Topic:
 =?utf-8?B?W2Zvci00LjE3XcKgUmU6IFtYRU4gdjFdIHhlbi9hcm06IHZHSUN2MzogUmVz?=
 =?utf-8?Q?tore_the_interrupt_state_correctly?=
Thread-Index: AQHY6jes783wY66tZUuv7V7GxLd9Pa4it9YAgADJ0oCAAAA2oA==
Date: Fri, 28 Oct 2022 08:57:37 +0000
Message-ID:
 <AS8PR08MB7991735529442CA6021EB4F592329@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221027190913.65413-1-ayankuma@amd.com>
 <20221027215316.768881c9@slackpad.lan>
 <ef4cf2ac-7b79-e0c2-6e29-b24154c9379f@xen.org>
In-Reply-To: <ef4cf2ac-7b79-e0c2-6e29-b24154c9379f@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1D9E60B4502C874CA4632FFC666FC256.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB7583:EE_|DBAEUR03FT060:EE_|GV2PR08MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: acf1e213-161c-4186-6c93-08dab8c283d6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 emUPIVQOhKsLIJmmiriuiix7lcbZ46xdnQMn1eY3RnlGYkXdEg2gZkp5dxupdtz+KH009CKSTJDHhVKRy2JUUWW2JhWXWP1J+QKa+SfTpbeXSP5ZzGlCEJiuDwJ3Z+2BlazBMA++xZ7Dh2O8OC9+X1Tn+kLgCw+KeCRnnRFNSVh9C0SpRTlTATXF79I0U1yObcbQwSbkniQjsAvSSKGSTLtbVX3u9WSbrZPBrViwZf2lMHzQ6f5ahHu6RH+8LFRLsPhuzZX+6XmYqev5rThsg23HJ/6q0OUxxe7+69xQnIOs4yDyrfLwNTJHopPipczREGX+J0sLW1LlBF+++DZo8er6vlXbZRALY8gtFyLy1RttMYXH3/9/LuP04tF1Rk1Z1MXM9ea7cKCZxfwjll+OxhYwDLOjHiKLSCxNQ/eALTOYIPB2gv4g7MHmZYvs+qWxlQqz2GflpS1hsidX+6H1y2MlR1bvKWWnkl/BEJBY7okJGZYS420HVl0G2ONxVnNvpHdSo7Lr3JOMOad0lvOHYv2FMIAZoMdNoqsUrmgLpRt1ZaMWMAPsznjciq6COzF9JHbrYu/AzQYnB96UojZuDzFr/D3+i3RBJa1iTikSiLNLbxMRTO/Hj6DEw6uGkDTeesTlpIrQGsIWEGPsYRym7QJtgalbkj5lFnCy8iE6Im5Pmg/c95bkTCeY3iCIB/m5C3BgunPfDON89K9lD+DQzi0JKLWSUcHKMqfKBxqS7IOPfMpPtCjJ+UtAQKnzAO39n+qJgvjgImLc6Y5kBKSGoA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(451199015)(2906002)(186003)(8936002)(478600001)(83380400001)(52536014)(5660300002)(9686003)(71200400001)(41300700001)(38100700002)(122000001)(26005)(4326008)(53546011)(76116006)(7696005)(66476007)(54906003)(86362001)(64756008)(66556008)(38070700005)(6506007)(316002)(55016003)(66446008)(110136005)(33656002)(66946007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7583
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7ea9f62a-7807-4ff2-15b1-08dab8c27674
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cppMD4hGxOYuHAMp6aC1Q2ujFvPlBpiQmUpNaDNVWYZipecZabDsam3gjdGDjQE8i69RXMbnNiC3DMlUApN/bfw5klAYQkldk7emM7h6Mxa2v2lVw0pleelfz3OmHoXIJcLEgXn0dSqA4n89GL1fQ0sHNm7oMSrp6eibzMW5EgowfcxcoUgV/JXhfRvL4bsXEaYbqYVk3J9tQ883q9GjYlZ7z7lUWW51ESTpXqLLxMc9Q0wdjEFilEos5sMWmTUd+G3ORoDFzuKHRfzSPyDHinzvWEfFf0jfw7X1Bwe8Q2wqo1OoT/e/1QJkq7nIOHI1DB5mJWDUD3UkonKIrZUnz1/VAodiV75pJz2/fPAZ7/xwxbpdo4idXFbFKwu1aHZNuzlScxJ4gV40ero9Ta2y2eA5D2YrA6FsaHE4WwLVzLui6oSpAuopVlKT61e+7hUnKck0O8OGIxpchlRQQp8TBKDsj4AHM/77HMg0rt6DwcOTqipwVpsA9e976uVUep0WR2pyDPCbEVAHOrFFQLDJjlm+yhx02ZTA7Y30r1MjSJk17iRbiv+UYHZxz9K/8ApBGQlHypdpDIafMUrioykuPQNZ5a1kd9pJNNK+WkhL+dID3iXWli4EWbVMVlyD4p6++qsj0NPPcoXwgFu4I1WGtwBZfUEJPP4e7aTurfN/VmJZTa+uSFvhZnZNTZDQd0c+sOwnMHQBZ+VsF1DGHOFvp9WZY1xRaxGsnKkhRiqveGBmuLTt7/kLwhLdtdl5ZjcK3j7MHIO/ck1PAAZXR4ZW2w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199015)(40470700004)(36840700001)(46966006)(316002)(336012)(47076005)(83380400001)(33656002)(36860700001)(81166007)(356005)(8936002)(52536014)(5660300002)(70586007)(70206006)(82740400003)(53546011)(41300700001)(40460700003)(7696005)(82310400005)(86362001)(26005)(2906002)(4326008)(9686003)(54906003)(110136005)(6506007)(55016003)(186003)(478600001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 08:58:00.1224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acf1e213-161c-4186-6c93-08dab8c283d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8148

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAyOCwgMjAy
MiA0OjU2IFBNDQo+IFRvOiBBbmRyZSBQcnp5d2FyYSA8QW5kcmUuUHJ6eXdhcmFAYXJtLmNvbT47
IEF5YW4gS3VtYXIgSGFsZGVyDQo+IDxheWFua3VtYUBhbWQuY29tPg0KPiBDYzogeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOw0KPiBzdGVmYW5v
c0B4aWxpbnguY29tOyBWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbTsgQmVydHJhbmQgTWFycXVp
cw0KPiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bh
cm0uY29tPg0KPiBTdWJqZWN0OiBbZm9yLTQuMTddwqBSZTogW1hFTiB2MV0geGVuL2FybTogdkdJ
Q3YzOiBSZXN0b3JlIHRoZSBpbnRlcnJ1cHQgc3RhdGUNCj4gY29ycmVjdGx5DQo+IA0KPiBIaSwN
Cj4gDQo+IE9uIDI3LzEwLzIwMjIgMjE6NTMsIEFuZHJlIFByenl3YXJhIHdyb3RlOg0KPiA+IE9u
IFRodSwgMjcgT2N0IDIwMjIgMjA6MDk6MTMgKzAxMDANCj4gPiBBeWFuIEt1bWFyIEhhbGRlciA8
YXlhbmt1bWFAYW1kLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSwNCj4gPg0KPiA+PiBBcyAic3Bp
bl9sb2NrX2lycXNhdmUoJnYtPmFyY2gudmdpYy5sb2NrLCBmbGFncykiIHNhdmVzIHRoZSBjdXJy
ZW50DQo+IGludGVycnVwdA0KPiA+PiBzdGF0ZSBpbiAiZmxhZ3MiLCAic3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmdi0+YXJjaC52Z2ljLmxvY2ssIGZsYWdzKSIgc2hvdWxkDQo+IGJlDQo+ID4+IHVz
ZWQgdG8gcmVzdG9yZSB0aGUgc2F2ZWQgaW50ZXJydXB0IHN0YXRlLg0KPiA+Pg0KPiA+PiBGaXhl
czogZmU3ZmExMzMyZGFiZDljZTQgKCJBUk06IHZHSUN2MzogaGFuZGxlIHZpcnR1YWwgTFBJIHBl
bmRpbmcgYW5kDQo+IHByb3BlcnR5IHRhYmxlcyIpDQo+ID4+IFNpZ25lZC1vZmYtYnk6IEF5YW4g
S3VtYXIgSGFsZGVyIDxheWFua3VtYUBhbWQuY29tPg0KPiA+DQo+ID4gVGhhbmtzIGZvciBmaXhp
bmcgdGhpcyENCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6
eXdhcmFAYXJtLmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6
b24uY29tPg0KPiANCj4gSGVucnksIHRoaXMgaXMgZml4aW5nIGEgYnVnIGluIHRoZSBJVFMuIFRo
ZSBmZWF0dXJlIGlzIGF0IHRoZSBtb21lbnQNCj4gZXhwZXJpZW1lbnQgYW5kIHRoZSBjb2RlIGlz
IG5vdCB1c2VkIGJ5IG90aGVyIHN1YnlzdGVtLCBzbyB0ZWNobmljYWxseQ0KPiBub3QgbmVjZXNz
YXJ5IGZvciA0LjE3LiBCdXQgaWYgeW91IHN0aWxsIGFjY2VwdCBhbnkgYnVnIGZpeCAoSSBrbm93
IHdlDQo+IGFyZSBjbG9zZSB0byB0aGUgcmVsZWFzZSksIHRoZW4gSSB3b3VsZCBsaWtlIHRvIHJl
cXVlc3QgdG8gaW5jbHVkZS4gSXQNCj4gc2hvdWxkIGJlIHJpc2sgZnJlZS4NCg0KWWVhaCwgb2Yg
Y291cnNlLg0KDQpSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5j
b20+DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gQ2hl
ZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

