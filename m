Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16825927A4
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 03:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386947.622984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNPLx-0005bZ-3C; Mon, 15 Aug 2022 01:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386947.622984; Mon, 15 Aug 2022 01:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNPLw-0005Z1-V7; Mon, 15 Aug 2022 01:57:16 +0000
Received: by outflank-mailman (input) for mailman id 386947;
 Mon, 15 Aug 2022 01:57:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lfrC=YT=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1oNPLv-0005Yv-Pm
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 01:57:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9535f788-1c3d-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 03:57:14 +0200 (CEST)
Received: from AS9PR05CA0043.eurprd05.prod.outlook.com (2603:10a6:20b:489::27)
 by AM9PR08MB5970.eurprd08.prod.outlook.com (2603:10a6:20b:2df::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 01:57:12 +0000
Received: from AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::da) by AS9PR05CA0043.outlook.office365.com
 (2603:10a6:20b:489::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.18 via Frontend
 Transport; Mon, 15 Aug 2022 01:57:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT012.mail.protection.outlook.com (100.127.141.26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 01:57:11 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Mon, 15 Aug 2022 01:57:11 +0000
Received: from 9cb4e42159c5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2236E141-6F09-497C-B417-A9CD1049B414.1; 
 Mon, 15 Aug 2022 01:57:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9cb4e42159c5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 01:57:05 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by VE1PR08MB5725.eurprd08.prod.outlook.com (2603:10a6:800:1b0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 01:57:03 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::48c7:a78d:1802:5c35]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::48c7:a78d:1802:5c35%6]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 01:57:03 +0000
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
X-Inumbo-ID: 9535f788-1c3d-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SM48gVFyQyhfr923aNghiQqXQIKuTN9WmADPUfzC0ob3J43ZbLRahLOV2+koJYuasxqs5r0Maueliu2hqXGcDiGNRiDSUJ97u+qExFolZKipm/upzjm+jOencghXf0TC8i2xjm82WzGfelHoGKS2viyFBiEgbuFKLJMhQHwdYegE2yEf1xTcfZiQ1F6dt8mIgwPyWmlQ74uoNSZD28pRpuUv+Hg2Q6UIrMz0XRNCXiLJBK4xFAFe9LUkjdPElOhvpIOekd0PdENkBADEcpq7DvFLo6nUDoYtkmzqg81pn+xKuNsYHeYWvfYdE8lpeWdHonytXHE3VsbNuWV1rmgQxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqRxi4owzZheNTdVrBxVUgSOIEGw6tiPtdiPxEA+Xs0=;
 b=NOzya0HQ89sr0MrLE5/vehJaRtZ+SvEJvXMXZdC2jeqOw5/d1NhadH623Zbg2LYcOpF1UIWQAV3t+88IQWSlwBqMSLiy17ro9NN+yWzzONolKUy3uLuITQVUASuY0HNSBpmYnncQJ3hVnOf6PZwaPiY3CCAWeMho3ByP+ZQMiNpsf9pE5h80PyelCBk6utts2nZkG6U1TuJBxVzAgTFuekFG7x0ARAg2PPEn0TYWhNjuFOhH5Lsk3bWaWURKUWvTqFtCBk3DT3JYnn+2MdFcUGfu+jQKtz75CqdiW7J8DPKrmbzP9p9ORdx/BLUctBL9JqEVimZzMV+9ZY/GoMUZDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqRxi4owzZheNTdVrBxVUgSOIEGw6tiPtdiPxEA+Xs0=;
 b=syLHITKU/T6ZeYQOm9XH6fbBaEhprWte61mML2GdrK6Y1nqYkpgRhs4tpDBJkiIwxutDgarsdkpFHfk5OVIWnXvhak5DCOz6kMyTc2jpb/fjIwX228tKHA0ER9SPWgE7LOAGh+4PeIyxAiiWQj/59b9KwvzsnicFIF6nJX1KyAs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvZGr6lRg+CpylFDGqKhcOVIAEWF73znaC1PVtjKBhWxSwkXoFA8sY5HRNBJiH4ldlyuZDIE2mN9vxYrARRv61U6kCwUi8ZyeRaTkBS572+XZYBnFMEYHVeREP4FJiaBcMfyakYfGjlZznJG6PXyff3cDr2V3CvHmY9giELJjPW5KmKk2cBh6EixcBFUOfVW9dLeRjhzcKbwqz3X0z3DMzpGpfFTREIN6Vr+r/Bx4Qk+UVRMBzr8wwsu/PQhg4vQLAuEyphWs+Hjnv14s1OtiemBJg4jCJhOExhnv3CQGu5DqROwyIsGO+EQIjtN6ZaBSxyuZQypQNOziAwib+M2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqRxi4owzZheNTdVrBxVUgSOIEGw6tiPtdiPxEA+Xs0=;
 b=GK+le4ZWe/4dH1kN3J6S++iGvgL+MsABc0lRHHAGmQnu16egsaxFLajgVHBtQtW1NcDcvMfEU9FR1rbOs/a+h6CC9xNzkmzNKQbrAWOfHLLMQrlzAlr4iImIumI2T1JCa+4Cnro7BZ/0ds5sAS/50uBI7BPjnqYvaoXJ5IKKl8IuTOWcOblvqTbbzxdJiva+hvCxRd4b/8ToXn7ykSNx7A9Aj1CjUORNl/UwKjHGTlAZ7qaU+iAEMWuYbkJH/dzZ5VRs6K1u2Ui4HEQFZZnvSBNft/a+mW5nprF8iEKzY+hW++LTjEk1OvkNfyaZw/NtQ+f3TtMpdhqGcaxUgHVydA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqRxi4owzZheNTdVrBxVUgSOIEGw6tiPtdiPxEA+Xs0=;
 b=syLHITKU/T6ZeYQOm9XH6fbBaEhprWte61mML2GdrK6Y1nqYkpgRhs4tpDBJkiIwxutDgarsdkpFHfk5OVIWnXvhak5DCOz6kMyTc2jpb/fjIwX228tKHA0ER9SPWgE7LOAGh+4PeIyxAiiWQj/59b9KwvzsnicFIF6nJX1KyAs=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 5/7] xen/arm32: head: Move earlyprintk messages to
 .rodata.str
Thread-Topic: [PATCH 5/7] xen/arm32: head: Move earlyprintk messages to
 .rodata.str
Thread-Index: AQHYroFLBRc7msyHakaqPASkuC1hfq2vNtWg
Date: Mon, 15 Aug 2022 01:57:03 +0000
Message-ID:
 <AS8PR08MB76962F9EFDFC959E3D7F64C892689@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-6-julien@xen.org>
In-Reply-To: <20220812192448.43016-6-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2B7552965B2CAD4AA6625CDCAF07FD72.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 540e0c6c-05a3-4361-cdb1-08da7e6177ec
x-ms-traffictypediagnostic:
	VE1PR08MB5725:EE_|AM7EUR03FT012:EE_|AM9PR08MB5970:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YjEDmxtFdMlfF7DQti1BjA9NKqJInBrhjO1DxMLUnB/etNAUBMtFIGD2ryzGjvihaolyUdW7C7ye/YlFy0By7HkyMa6taykWBjlC6VBheV4KXIaoR0rEzwe4X28c6k/10nqfkayHYcjh01p6tOgS/Szg0gF9NwZStP5AGZB1u4g9h4xOog8s+4jpXGO/i8qTeMx8dNVMnDx6+8twDTeu7TPZQoGH/esKAQ+/kTFQkMVZBBuV14ipYs19BAJmI8ARFBEey9Q7GUovE8wRRSNaHHlUL1D+obrG0eHHgMNKrbF7GHlIZjkwGCpv4twVepeyZVkm/CZoyJcydd/VdpkzDAXFjbz0+PCs7RZuqDsAmRJyG+bA6U8gWQX/4b09VspZuWWF7hwe+2wnW49vIONcp6b8nHL8AlkJeyd3STGv5L5z6JyNqKg1IXXFrj8pafgJpOQtiTiAgcXFN286qylT7yIE+pdeZur+7Lo2Fgd8tVdf6bAffHnqUx2XUw8ORffcmGkAlw+S24QOMB4innGYm/iFepbQ7WfYglQz6qJi/mZGMdxGBZvxFWcn2iLsrRG1zdkFBtnkNUdQmcE+RRd4srLw1fzVG0/OzAsHNxRbumzxozB7naScrJDqrfegOrSGTMeAI3/zQtc0zx/lZ2axPoTQdNvFJi05wkHbk0uJTflpsC+ydI7a0JIf6cwsnVZt08aOa4NH17a4N0Su3sDO+CsprgSOETo3cHwh6/OYkYkVibhfl08Zwq/TZTC7Qn8swnhv6zNDnZZr1uviEXPgzZFXFd99cHPdR6vao3YfAFGIZiBNbtIhF3SdKM56I0GWUQfFifcEVap8SwTlEoZYEA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(366004)(396003)(41300700001)(71200400001)(316002)(54906003)(478600001)(26005)(38100700002)(4326008)(110136005)(64756008)(5660300002)(66946007)(8676002)(8936002)(66446008)(76116006)(15650500001)(66556008)(66476007)(52536014)(2906002)(38070700005)(53546011)(122000001)(186003)(86362001)(6506007)(33656002)(83380400001)(9686003)(7696005)(55016003)(142923001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5725
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4d9d1958-1243-4e5e-ef29-08da7e61732d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rr1JJwh25Baeif2GWqSfb6Go0+IR6RhkrCX8etpx0lrnHFDzKHNrWzZ9u7paqlPuujOPAdqn+Kr6RrOH0eMbNT2TRwCp286iMqeRFgPVkPScYMsJf0TupKVtcj5juhtLXyPUQSaWCeFUYtQ6PsCTpDtCRumNQIwXDnU8lOargFSNFBDKP1ZPAJdOtg04oIZVMPg0orx93oxhznbp1nVmHHKfcPCRP19+b3ABLhf4jJgFA5wIFW9HtG2hDmVh15KLuIw6c77Vf263ZMNARVAtjYunfDtmlnjWkkMz4bWToWwCXQHi/nOI+GqXeT8/uMlzwh3G4dq679oT+I3DPkpT2TpwKlf9f9FakhphzldQcc1Q2qJ1lAoott9SU/BzYiTFDJzVeOz74FlPFILw7tlCZs3mYH1iA1ek65SnQ3x7yvna9csbygM0IHPdjy6M2DjlUzZjmKxzSmp29jsTYLcbbyxDkqPgs8z8HwNAXsoIBsjVUr+b1USuXpb4zqU8KTZHMHwHlA+F947pq4OpoLYiL4tZXCt91It3wRmIF6hqk5YxnAhyk/mOGUzivluSxd/kDFM7EcZvf6f+Z13aUa/THwtB/Mt4stAuMKMDBmgAFoUghBFuLCyEhD+ysiYvmvzy/V7H7AvajH8CVUJ4MGj0FRNpTwcXQLyWzB3MKr2whC1woXTlUzZEqNi1rcIBA23DhDS1++5l0WT/z7vtwadzNzkfsnAIfWYaACu+4I2EVeYv8KzpPSnqM8Pms5lZWUFwPgmGPHTZJvrE5Jo6Y9KyRJc8tYTMMwhIjxf+L5WthydomHdzz7dq9tqlzS3Ceyof
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(36840700001)(46966006)(33656002)(336012)(47076005)(83380400001)(81166007)(82740400003)(356005)(70586007)(5660300002)(4326008)(316002)(8676002)(186003)(70206006)(52536014)(7696005)(15650500001)(41300700001)(26005)(9686003)(2906002)(54906003)(107886003)(478600001)(86362001)(36860700001)(55016003)(40480700001)(110136005)(53546011)(8936002)(82310400005)(6506007)(142923001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 01:57:11.4656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 540e0c6c-05a3-4361-cdb1-08da7e6177ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5970

Hi Julien,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Julien Grall
> Sent: Saturday, August 13, 2022 3:25 AM
> To: xen-devel@lists.xenproject.org
> Cc: julien@xen.org; Julien Grall <jgrall@amazon.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> Subject: [PATCH 5/7] xen/arm32: head: Move earlyprintk messages
> to .rodata.str
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, the strings are in text right after each use because
> the instruction 'adr' has specific requirement on the location
> and the compiler will forbid cross section label.
>=20
> The macro 'adr_l' was recently reworked so the caller doesn't need
> to know whether the MMU is on. This makes it easier to use where
> instructions can be run in both context.
>=20
> This also means that the strings don't need to be part of .text
> anymore. So move them to .rodata.str.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/arm32/head.S | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 27d02ac8d68f..a558c2a6876e 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -93,13 +93,10 @@
>   */
>  #define PRINT(_s)           \
>          mov   r3, lr       ;\
> -        adr   r0, 98f      ;\
> +        adr_l r0, 98f      ;\
>          bl    puts         ;\
>          mov   lr, r3       ;\
> -        b     99f          ;\
> -98:     .asciz _s          ;\
> -        .align 2           ;\
> -99:
> +        RODATA_STR(98, _s)
>=20
>  /*
>   * Macro to print the value of register \rb
> @@ -736,7 +733,7 @@ ENDPROC(puts)
>   * Clobbers r0-r3
>   */
>  putn:
> -        adr   r1, hex
> +        adr_l r1, hex
>          mov   r3, #8
>  1:
>          early_uart_ready r11, r2
> @@ -749,8 +746,7 @@ putn:
>          mov   pc, lr
>  ENDPROC(putn)
>=20
> -hex:    .ascii "0123456789abcdef"
> -        .align 2
> +RODATA_STR(hex, "0123456789abcdef")
>=20
>  #else  /* CONFIG_EARLY_PRINTK */
>=20
> --
> 2.37.1
>=20

That looks good to me.
Reviewed-by: Jiamei Xie <jiamei.xie@arm.com>

Best wishes
Jiamei Xie



