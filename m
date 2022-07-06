Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B463856878E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 14:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362189.592158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o93hA-0006yV-MQ; Wed, 06 Jul 2022 11:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362189.592158; Wed, 06 Jul 2022 11:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o93hA-0006vD-JS; Wed, 06 Jul 2022 11:59:52 +0000
Received: by outflank-mailman (input) for mailman id 362189;
 Wed, 06 Jul 2022 11:59:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LAHD=XL=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1o93h9-0006v5-NI
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 11:59:51 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2075.outbound.protection.outlook.com [40.107.104.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23863ef3-fd23-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 13:59:50 +0200 (CEST)
Received: from DB9PR05CA0005.eurprd05.prod.outlook.com (2603:10a6:10:1da::10)
 by VI1PR0802MB2528.eurprd08.prod.outlook.com (2603:10a6:800:ad::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Wed, 6 Jul
 2022 11:59:47 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::aa) by DB9PR05CA0005.outlook.office365.com
 (2603:10a6:10:1da::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21 via Frontend
 Transport; Wed, 6 Jul 2022 11:59:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 11:59:47 +0000
Received: ("Tessian outbound 13cb25bfb745:v122");
 Wed, 06 Jul 2022 11:59:47 +0000
Received: from 6b9f9c6e2203.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DC08EAFE-0B52-4A97-9E98-BC96C5D9FC98.1; 
 Wed, 06 Jul 2022 11:59:40 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6b9f9c6e2203.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 11:59:40 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM0PR08MB3554.eurprd08.prod.outlook.com (2603:10a6:208:e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 11:59:39 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 11:59:39 +0000
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
X-Inumbo-ID: 23863ef3-fd23-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=b4mlFdbmkKgdL+Mp5CxatbqjQDaGbyDId7XyzreOvyxzP38C41FZooqO1rpN5SSBdh8RW3uViA2pRGe+Cv4CK4m9gu+aM4TyJFU9nuv1TbHneaqlIdgSwwMr7DNN4GHIn6MmtphsbL01mMbs/j3KzGeUX9czq59vUBUOQe2iO8yqxSfgPobM5vAliWoXjm3omvD7gzA7Z73ikKiZEvG630SI+sy18Tkn2eu1CwHzZNoglHwtNrZ4dMFUocJVDR1DKj/Wx5XuacIhO/6WbuhmtmCTFabrx3lYomNFaGju+L+BWHmgSTYmpngi6Fbxuaewcuf4zlEC8kYgDK7oeSNuVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTcn2qsjfcs/sS6vCPWitDMWsvpXLXSi6QJa5DTFGPo=;
 b=Fo3gDFGPIMF7h30hYPeO3fMuoA6p1DIBTXU6Bflcz4mwuaNk/BiYNwb9xywrOo7pg1fEADar4Yq0hULouV2WDQmoyYjV9hKofRRmVF5UlZYIRDpl5I+8j9p7Z+vOwPDJAaO2mQPPcv2hxchi1QHHUzWXGvhWUs0M0cwyudxSHWSA8nX7bqCxQ0N9dufaxitcykzt0njKl6IZ/IH7js48JHFaCeQ8WMbujtojDwPkGa1FaQ04zmmi7/8mUNwEwh86mjiRaSMwDLEPto0YUSwixXlQeBRzLvIJDQpnIupHOU/RelCP/qy9d3ln4NqiKT7pUbUMacywCudXrWgw+W4hAg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTcn2qsjfcs/sS6vCPWitDMWsvpXLXSi6QJa5DTFGPo=;
 b=9qpitGgabb7OqxaMRWJLSve2R29Ye6Pk3pPHOMbH+t/p7MmA3U548OzZXfEdM6k0h3sU+eczBQyUY3h3wlB9sJqAj/Z2wXNzZonqRDxSGLgj8bYKDX7wz8gephMO6S5eSJb04TIMJLVUujV/FGerKqXttaT1aD3Ws7DenXUa5nA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dfae215a2df38756
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMWT6iiNU8gEDxrIInVTfjw+++1ZGaHiJgGxNV5h8ikmyLTVo72HZErQvkUGRSx9RaWPixgSvcH/7UL9z5b32OR2O73vmbMpt/pWlrjUEHrjUFazmiz/y3LNfW39fEMuot6XwU5kRkXFPHF96iRhybpbNYHuIq27PyyPBtSeLTsPqHyV91S2CZgDtW0fmS9SDHO+ltXl4NNAR5YbpfYbKE9+H2vjWHdjcCgyRa64ZMeBHbAr55h3ClKi+BcqYr6z0RbP6fNW8UnqXhLGZ4IRRqsh4ftlmVbbmE2OABlKBObEffDjuYG9ck5Kg6NXszQ19ob28wvEXl7F4qtEXzAPew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTcn2qsjfcs/sS6vCPWitDMWsvpXLXSi6QJa5DTFGPo=;
 b=fGpgegX81ObHneF0RKf6v7uC77iBgUfNFAHc1qgqJAlC1QVmlIxn/zga4tJe0wutK9HXtYbBkS6B18CcXXfkzRpJ/dvJbp5phpKJ4sUgsIchQ24qaaQOR56u/r1hsKN2L40pTUnAP1mselZDqTDw6KDTzkNuRo0TabqGAI8/B9+ZNZO6wtWmGfLLMBUJBOBwbcdN3GHeLTuq9VjutnbZFCE9ReotlpVc1KjMTqFSENqX1BCOkoEqSysxCpUgKqA9i/070LAQ0ja0LE/7l6jfFpTF3JBmiQAOnPdZZYddVCidcEU+s+UJ+a96wf7qa+JT4B4r207NHquXkNktIJbFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTcn2qsjfcs/sS6vCPWitDMWsvpXLXSi6QJa5DTFGPo=;
 b=9qpitGgabb7OqxaMRWJLSve2R29Ye6Pk3pPHOMbH+t/p7MmA3U548OzZXfEdM6k0h3sU+eczBQyUY3h3wlB9sJqAj/Z2wXNzZonqRDxSGLgj8bYKDX7wz8gephMO6S5eSJb04TIMJLVUujV/FGerKqXttaT1aD3Ws7DenXUa5nA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/8] xen/evtchn: modify evtchn_bind_interdomain to
 allocate specified port
Thread-Topic: [PATCH 3/8] xen/evtchn: modify evtchn_bind_interdomain to
 allocate specified port
Thread-Index: AQHYhkXgFvoQlpdPN0O1CKuVc36nOK1v9mEAgAADLoCAAAWTAIABVA4A
Date: Wed, 6 Jul 2022 11:59:39 +0000
Message-ID: <46C308B8-E7D3-48F9-8BC6-662E725EEEC0@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <08fab20e71d280396d7b65397339ad9d9ab96d5c.1655903088.git.rahul.singh@arm.com>
 <9822e10e-ea7e-a39e-1270-14f0e2741325@suse.com>
 <473505a8-7df8-49a7-c33a-02b383efc22f@xen.org>
 <fe30cb36-22fd-3f13-daf8-dce0e6a820fd@suse.com>
In-Reply-To: <fe30cb36-22fd-3f13-daf8-dce0e6a820fd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bac72ff6-44d6-4c6a-93c1-08da5f4705fd
x-ms-traffictypediagnostic:
	AM0PR08MB3554:EE_|DBAEUR03FT014:EE_|VI1PR0802MB2528:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PYW58KBXSLOSABBdnY88sE/4qcVvziBkTiWOogR++/sL4DPXxWiC1LX7NILCrQJQnKf3xaNkL2DhbvbyLulubTXh0i5t3/MLcx6JO8gN9wFrqp47pWh0YZVbwz3TzUrCZ3/pKT1rndNPKx0mhXkMEzO3zDygG2mO5960gJwy3fx0v7HB4HUmX9iErKKSBgsIyBVYelxOOfT2gjKBj4agFi1U9iRskBT/KFtuOQ7lseYsyTdbpWM4vxdsXqYS/MTv/B07zPmFA7eJkOPudmsKuXAMf6PBUqG0QdO/JzzFNIEd2yjB0CBaDK26QRPxso0TZxrw+hmEZem7O2ybEje5pgslE9YMwMOlISeTA2Rx6YDooX3RToy4VxzJ19tFmBkI0eQHH1w84INo4nlAgcqRdV60yIJtP7j/b2L497xeJ3a0u5pgAKEp6Md0IJnWu2E3rW7x9q1dTVpDPjed0MZDvFUxBU1Ik41Mev9W42KuNIa2JEOjDq9ELVtVBY+aiQfC3FPT3qnJi4yg1DG0mBV8hyWgSaP0IVynby1UMDPQ4N4A7XwLmFtOE9Zhfvn83wXlL52uhc0avRaXhBQ/96f3RdrO9sJuI69kFCgSMC0CmZyVVKl7RUpyx5RT7WN05TKURdlHJs/0mQEQNaGT4wNqdCjQNtGThQ/2pD4j/FMfuwXRsE8WKEPwIZDL6/eTWHBFLd3fHnIg4SlJT8b4S6YKcuHXJnCXOwrQRbhNYNcF0PC1CRShT+rOmD3j4LMSdjSD34LSJtwIUHv15MIalnKkyKK94cDrpbswWtYi2eisgMyMUZjR7L6hbW1GhlvVPMLPUtsNJxpeG2TkY0SZKbr1tCr5mrRj/pRJudgefmfJWPw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(6486002)(478600001)(54906003)(41300700001)(71200400001)(6512007)(26005)(316002)(122000001)(6916009)(8936002)(5660300002)(38070700005)(86362001)(53546011)(91956017)(186003)(8676002)(66556008)(4326008)(66476007)(2616005)(66446008)(64756008)(66946007)(76116006)(38100700002)(36756003)(2906002)(6506007)(33656002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BA85FD49B57047469F50F7E7FB77DD4F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3554
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cc0cc82b-473d-4f0a-a104-08da5f47011d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yi3Ul64pw2fV5SYHTqaTpnBsa1LpDofgDNsh84tCurf+BCs3MvoKkGJW8H5UaaLjq+w4b7nl+3UC39YERDvdBGpuDC3KxTkytWeGfmY9LoEHkYQcvsU+ju7Sww7Rtvp0hNq9oVW4XXc9hbqwX9NfnpAUpm4cLtz+kiw20pTUqlo9qwCCmZ3H/WmNG+MP5gJO35maPtq26hYwQbUtj8TxACh8S4bzDYXJskWuJNOxN3aHtpFM4ECYwlswXJsNOsrUKX4/Bjmb4OaUckyIXJG3xa0dQxz9rtO9h0R4guotisvVjggB77zDEo2cqf14Q8kxc3p7eMTV4uuAXSuJuP5Mz55VclJ4/bIYW7IKdzra5vxLfob7b/u7Iv0Nkhj6Qr8goaSPrZkKm9hVMv1COWYqZO4nBbVJMw3W/62eFXrYj/uX2XDQfCg6ran0gHoUDcVzY/sFW0ty0IcOUIi+Ym3GonYy4t5k8P+F/fWQAUXTUcLQXfEIx5jfHs5Zj4OL1XpfmnGMX9uFdJC+xA0kGe5umeo/QpGhJCRJADccMqSsQQR3RTh4G2r+AX1N4qi6LVDJDWszgk+01moFAugFxHrIBymtL5d6yCcyfSDnXGwnPuZkAcYGb1XgJxDIw7/FubCHHBRvoSj88IcUhBlgT0wkVcVo3SCuN/+cx0l+q59sEaoUvGqrhqEbaCzVEE8M91Kf9e2Hu2yZ3zUs0mD+EWplxzSUEORdNn+SZi3yZl+oGoxwiexBYwrxRbe7tdgkT/UW3LJwe65Ffmlu7E8Gg2nIvHbvacV8TQ/cZV/u0slwcP7ZxpHX1l/TUQxLvWmErdYR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(396003)(346002)(36840700001)(46966006)(40470700004)(478600001)(5660300002)(8936002)(6862004)(6486002)(53546011)(33656002)(40460700003)(6506007)(86362001)(41300700001)(2906002)(26005)(6512007)(82740400003)(81166007)(356005)(36860700001)(82310400005)(47076005)(336012)(2616005)(186003)(40480700001)(83380400001)(70586007)(70206006)(54906003)(316002)(36756003)(8676002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 11:59:47.4011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bac72ff6-44d6-4c6a-93c1-08da5f4705fd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2528

Hi Jan

> On 5 Jul 2022, at 4:42 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 05.07.2022 17:22, Julien Grall wrote:
>> Hi Jan,
>>=20
>> On 05/07/2022 16:11, Jan Beulich wrote:
>>> On 22.06.2022 16:38, Rahul Singh wrote:
>>>> @@ -387,8 +392,19 @@ int evtchn_bind_interdomain(evtchn_bind_interdoma=
in_t *bind)
>>>> spin_lock(&ld->event_lock);
>>>> }
>>>>=20
>>>> - if ( (lport =3D get_free_port(ld)) < 0 )
>>>> - ERROR_EXIT(lport);
>>>> + if ( lport !=3D 0 )
>>>> + {
>>>> + if ( (rc =3D evtchn_allocate_port(ld, lport)) !=3D 0 )
>>>> + ERROR_EXIT_DOM(rc, ld);
>>>> + }
>>>> + else
>>>> + {
>>>> + int alloc_port =3D get_free_port(ld);
>>>> +
>>>> + if ( alloc_port < 0 )
>>>> + ERROR_EXIT_DOM(alloc_port, ld);
>>>> + lport =3D alloc_port;
>>>> + }
>>>=20
>>> This is then the 3rd instance of this pattern. I think the logic
>>> wants moving into get_free_port() (perhaps with a name change).
>>=20
>> I think the code below would be suitable. I can send it or Rahul can=20
>> re-use the commit [1]:
>=20
> Ah yes; probably makes sense (right now) only in the context of his
> series.

Ack.=20
>=20
>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -292,6 +292,18 @@ void evtchn_free(struct domain *d, struct evtchn *c=
hn)
>> xsm_evtchn_close_post(chn);
>> }
>>=20
>> +static int evtchn_get_port(struct domain *d, uint32_t port)
>=20
> Preferably evtchn_port_t.

Ack.=20
>=20
>> +{
>> + int rc;
>> +
>> + if ( port !=3D 0 )
>> + rc =3D evtchn_allocate_port(d, port);
>> + else
>> + rc =3D get_free_port(d);
>> +
>> + return rc !=3D 0 ? rc : port;
>=20
> We commonly use "rc ?: port" in such cases. At which point I'd be
> inclined to make it just
>=20
> static int evtchn_get_port(struct domain *d, evtchn_port_t port)
> {
> return (port ? evtchn_allocate_port(d, port)
> : get_free_port(d)) ?: port;
> }
>=20
> But I can see you or others having reservations against such ...

If everyone agree with above code I will modify the Julien patch to include
this code in next version.

Regards,
Rahul


