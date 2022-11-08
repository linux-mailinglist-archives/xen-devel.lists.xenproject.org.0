Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E7562067D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 03:16:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439671.693700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osE8Y-0003VL-T5; Tue, 08 Nov 2022 02:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439671.693700; Tue, 08 Nov 2022 02:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osE8Y-0003TK-OR; Tue, 08 Nov 2022 02:14:50 +0000
Received: by outflank-mailman (input) for mailman id 439671;
 Tue, 08 Nov 2022 02:14:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cq9g=3I=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1osE8X-0003TE-0A
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 02:14:49 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2069.outbound.protection.outlook.com [40.107.247.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c0aa07a-5f0b-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 03:14:46 +0100 (CET)
Received: from AS8PR04CA0113.eurprd04.prod.outlook.com (2603:10a6:20b:31e::28)
 by PA4PR08MB6174.eurprd08.prod.outlook.com (2603:10a6:102:e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 02:14:41 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::c5) by AS8PR04CA0113.outlook.office365.com
 (2603:10a6:20b:31e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Tue, 8 Nov 2022 02:14:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 02:14:39 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Tue, 08 Nov 2022 02:14:39 +0000
Received: from 3a7f5fb9f7e8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 09589D5F-13EB-4480-BB09-D3BB4BB884D1.1; 
 Tue, 08 Nov 2022 02:14:29 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3a7f5fb9f7e8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Nov 2022 02:14:29 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PAXPR08MB6590.eurprd08.prod.outlook.com (2603:10a6:102:152::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 02:14:28 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%5]) with mapi id 15.20.5813.011; Tue, 8 Nov 2022
 02:14:27 +0000
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
X-Inumbo-ID: 1c0aa07a-5f0b-11ed-8fd1-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=m5aQKG5Q2Uu7r/MCFgtCxoOsLVFC3iNeE7P1+tgzGM0qZ1F1cwB4cgHcjilML6yNwIV1YkUEV//PZwVNO/0Bty0Kl7T54iDRQlcC/lRuqUwa4NsJcgIhvvRuJvycfZeC6fXL2/hpLxJh0jbZRUP6OAMW6uj5qaRqISB/uPbE7x1+YgxOfgawHdR6hzOGiz5Fv86Zz1vBqdD39q3s5wnG4z4SsfWGFtb6Pc9I0d1vX2eMS7Fkh7QFfsItUW3vFx3kLeRFlauiPAeoqrP0TO7d7uI7OACITQB1wzq9XOazIcEemb5dr/HX5oF/V9h45EsBrXptqUPNu7efmJXRdkJElA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjF17iVkr4reWQKsw0Uv9LswPpcZegPaSK5J0X+Nzrs=;
 b=fVWk4lKwADXg2udKY/8in2Iziu9XTlUKO/PR4XIULzVvFaWWP9acoYFdMoBEgMFKwcKcxnVrlkZPvp8uz10Yrp5a/+cn+Ylu6Aj8fvcgoXpAiDIu3yVDJ0EhkL3X1vxsVaGvVsYNxzPeq1ZVAPW8SC9G+MoZ1jjeYv3lNbkzHSY9yEy8S8OYBT4R15p82dhMyypberqJ/EjwrNzHcKu2ijY9K52jDE08pLG517UHOcWT5RcvIwSPpqoFjl6VpApX8SqcvRw/alcNDyfnxvZaYtGWi9E3/F6PZhiDVdZyS+580WUIJEPIJcUAaZx1H1EeL6EgyGBwUr25bagRaX0T1A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjF17iVkr4reWQKsw0Uv9LswPpcZegPaSK5J0X+Nzrs=;
 b=XuT5xFP0QKF0BovF7G0iaY1gwsz/2hh+7aYhlSyWcbGnPnUlJOK/kO3wmzLctbp8v9QjnkUllpozkQIQZ9TEpRfAoRvKrq/gsVDWM3ELWeS0PFE9vIgAbK8L6EaImVxIzLWuxnQuzGUZh+lQ/bL5x3A7vptIepu+s0elDZofn64=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBQ6stISBBlsgvhSasEaIcK7l6XQx5qLqHJlYFNw4lcXeHji5CkzJUQ6RUgB1PCdO2XEFAeXd+BscZ7xQ8vVVWq59aycFbMtNdOHrGdUF1GpPJW0xOmfUk9jSV8/FMDAVKRCov3N7X0TrGGMuUNcwKos0reCoySJc5PeWkT5w4DnAJlH1WAs8QBrEKegIsIwxYTcO1F20tZsjCmb7ewiOgriU2zUzao+UKUeffrTi4j0M63WRPMaVy7UWoVc959jncK24aKVMD7FDeV3Jvb3y2w3ohnDYgqyxK7ygctow/0EJGm31KhsA3SHWFdlavsYh31rExdDLB79lXsUJMvDAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjF17iVkr4reWQKsw0Uv9LswPpcZegPaSK5J0X+Nzrs=;
 b=WRNIgZA0lp2GDbyFNltdLvPVhXEDeKBzMY8tx1JIz1U/wneTs43l0LUrx5+qyjfe99ddF/otBSgPv5qrpgAJHd5B4psp6d97LbX0CTknV+LOv7vNS00/1N8FMV6//ya47WuVVJ8+BQ/u6Egs8/rU8kjTFM9KPFezQB1TJgqNehM3t6829gu7DcurbXLIguO5vqpgtdviYsSGXXJTun6swxtU6vz5UIFUrAjLLiLh/osSgDNAG3KCJSiavmMHK5JKRJTYFUMPQYmB2EQpnzQkEGuew2pdr6XPaTSJKg66CCIFWh4dlYX7Tuk1p7zOIHLmLmTdHbnVGOY0cFQkm8OuQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjF17iVkr4reWQKsw0Uv9LswPpcZegPaSK5J0X+Nzrs=;
 b=XuT5xFP0QKF0BovF7G0iaY1gwsz/2hh+7aYhlSyWcbGnPnUlJOK/kO3wmzLctbp8v9QjnkUllpozkQIQZ9TEpRfAoRvKrq/gsVDWM3ELWeS0PFE9vIgAbK8L6EaImVxIzLWuxnQuzGUZh+lQ/bL5x3A7vptIepu+s0elDZofn64=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: RE: [PATCH v6 02/11] xen/arm: add iounmap after initrd has been
 loaded in domain_build
Thread-Topic: [PATCH v6 02/11] xen/arm: add iounmap after initrd has been
 loaded in domain_build
Thread-Index: AQHY8DVmEdLqaRCRCUuW0jNzr25ema4yQiqAgAIMi/A=
Date: Tue, 8 Nov 2022 02:14:27 +0000
Message-ID:
 <PAXPR08MB742002FC135BED2CB4360BC79E3F9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-3-wei.chen@arm.com>
 <a3b0c695-3e2f-7529-39c6-2e4c23ee9b78@xen.org>
In-Reply-To: <a3b0c695-3e2f-7529-39c6-2e4c23ee9b78@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C25938EC87CAA643AEDB0E0EC50874BD.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|PAXPR08MB6590:EE_|AM7EUR03FT036:EE_|PA4PR08MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: 069682a2-e30c-4667-0ab7-08dac12efdff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GrVoHuz5snUWev+bEhey329ZJq4ywAxqT9qkO4y+XNRDaoRDBvGKSNW11oVPnimNdK0x6KqPlr3r3vylBIQII0vDPguCqXQLN/cEYO73kfjwawU5aN9t1qb4IuUveUDFxU7kkFbaNAoX3BMfO2oL+FlpgtUI9dhP+Qpx/JkTzBD23pX14SS0AVA2//9gxziH5lPQi0clYRqOLhyiz1reoWOiPV8WnjrkHiCvLQKEIn3RJuHs1wcv9ciLysO4PcDT5Zxa8m26L27vBxYymedBzfvHTKtrhHOhjDGXtbAREF6fh67gn6bzlZt17mFxjNFvWBrMesIW242C6G1j1m3cEPtIKXCZkSrY31THdBti37JMgLgxEfrzDSjl2P7RoiXzc27OOMlg09572gNOWnV6AYUV8I2lf2ppnvyhzj4D+rS6HOWw31oHsHINknVUXPRgCbdx++RcWpTZ6F1aZKQIxbD0RlCluvyWCCZRtSI9h+lS+Q9f5dNpZlN12mrWi6DtDHaGGRT4DyBRZ7T+dYH7a9EmIWsR3rwsDju7v/jv7EUPRzXpCAkyy0B/O7yojm0Ql69jCp6i+5dqNxPyqotUVpuVOQncfMRaBlb6JMQEurRp4be26JvTJKumQNiDf9z4CO7x9shUh9fLg7z2u840Yc+BTs/w7eFlfbCwXXdEduQoVwmDJAD+t7OlWY41LMdbKN5z2znWaz5cLVGWggugUlHxQC2+3giy2VGiXckT9WupNbaL55JZTtygMuevHNzG7Rk0eTkDjs3WGc8gIiZOLQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199015)(41300700001)(6506007)(7696005)(52536014)(8936002)(76116006)(71200400001)(316002)(66556008)(55016003)(66446008)(66946007)(4326008)(64756008)(66476007)(8676002)(38100700002)(2906002)(122000001)(33656002)(5660300002)(54906003)(110136005)(38070700005)(86362001)(26005)(186003)(53546011)(478600001)(9686003)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6590
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	309d0817-7639-42d0-abf7-08dac12ef663
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kxDZUf/Gu89ZprmvNujYBJGLenzJ0/QhlnUINjX74ncy56UK5nkCK7O1FoMRBkvsTxtUrMUjDjFDSQ15M0smZE3R4ByeBbEMSVBwoxe0w/ZfNNfB51w6UCeWfSm/JGFKm9kKePax4V+l2acyYgTb/+wvxbzVFwOyn0nuevWYNKcx8c4/caRSKRI0WVBhs9me7BKnNjOIeLSBB2p5maLzlOSE141zOoDJjNFEGBZNB/r51WtEZJl2h+FCN7FTPs2FoziYwSE9kcLOfuFD395RH8UsP1cECL2Q2zYJvaEwjqtRkPtViO/W/2Vfw2m1S7Mp1c23PrZ2k66iTGQf1Nl4bkVPREic0+ICkO8qk0IYoxTNf9MGbYhiQqklH3v7nDk9WIRSgysaiTDlfyE+BrQeX50MNdFBc+al3EDm/lANWeYDUgvmubB8WViz5fohB5EULGqlvg2htH5FARXBkPqXUbeRKVYMOmF1lSUA2IjxR2vdfMEmgM0/qxzMQKZXfLq9PzqxydBuA5V7gdS9oDRcACm6NRwk4Jd42+4Wv/4FiikLHSxP1frXwmRV2xtRAxHWQhMc8SpbAobqqyZqHMGSp9nVQ9wqetgiD8pssw72jrpjZfh12M31u6lsBrBBOO0yCX2ARl333NkMWyhVLkbNKegMrcuwvTLQqMmX511PiAzeEVgu0ak63AIv0X2IDzp14DahtuTN5MQxiQeUz561o/uvarE7PDmtqEOwATaBLvho6zscGpV54EU5vsvP20QlrqUChBgvX7QpmVE3UkqHqg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(36840700001)(46966006)(40470700004)(336012)(47076005)(186003)(40460700003)(316002)(82740400003)(55016003)(478600001)(86362001)(33656002)(40480700001)(356005)(81166007)(82310400005)(6506007)(7696005)(26005)(36860700001)(53546011)(9686003)(110136005)(54906003)(8936002)(2906002)(41300700001)(83380400001)(52536014)(5660300002)(4326008)(70206006)(70586007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 02:14:39.9884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 069682a2-e30c-4667-0ab7-08dac12efdff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6174

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFhlbi1k
ZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBP
Zg0KPiBKdWxpZW4gR3JhbGwNCj4gU2VudDogMjAyMuW5tDEx5pyIN+aXpSAyOjU1DQo+IFRvOiBX
ZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zw0KPiBDYzogbmQgPG5kQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+OyBCZXJ0cmFuZA0KPiBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5j
b20+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBI
ZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYg
MDIvMTFdIHhlbi9hcm06IGFkZCBpb3VubWFwIGFmdGVyIGluaXRyZCBoYXMgYmVlbg0KPiBsb2Fk
ZWQgaW4gZG9tYWluX2J1aWxkDQo+IA0KPiAoKyBIZW5yeSkNCj4gDQo+IEhpLA0KPiANCj4gT24g
MDQvMTEvMjAyMiAxMDowNywgV2VpIENoZW4gd3JvdGU6DQo+ID4gZG9tYWluX2J1aWxkIHVzZSBp
b3JlbWFwX3djIHRvIG1hcCBhIG5ldyBub24tY2FjaGVhYmxlIHZpcnR1YWwNCj4gDQo+IHMvdXNl
L3VzZXMvDQo+IA0KPiA+IGFkZHJlc3MgZm9yIGluaXRyZC4gQWZ0ZXIgWGVuIGNvcHkgaW5pdHJk
IGZyb20gdGhpcyBhZGRyZXNzIHRvDQo+ID4gZ3Vlc3QsIHRoaXMgbmV3IGFsbG9jYXRlZCB2aXJ0
dWFsIGFkZHJlc3MgaGFzIG5vdCBiZWVuIHVubWFwcGVkLg0KPiA+DQo+ID4gU28gaW4gdGhpcyBw
YXRjaCwgd2UgYWRkIGFuIGlvdW5tYXAgdG8gdGhlIGVuZCBvZiBkb21haW5fYnVpbGQsDQo+ID4g
YWZ0ZXIgWGVuIGxvYWRlZCBpbml0cmQgdG8gZ3Vlc3QgbWVtb3J5Lg0KPiA+DQo+IA0KPiBQbGVh
c2UgYSBmaXhlcyB0YWcuIFRoZSBpc3N1ZSB3YXMgaW50cm9kdWNlZCBieSBjb21taXQgYmI3ZTZk
NTY1ZDkyLg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNv
bT4NCj4gPiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDIgKysNCj4g
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMNCj4gPiBpbmRleCA0ZmI1YzIwYjEzLi5iZDMwZDM3OThjIDEwMDY0NA0KPiA+IC0tLSBhL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYw0KPiA+IEBAIC0zNDE4LDYgKzM0MTgsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaW5p
dHJkX2xvYWQoc3RydWN0IGtlcm5lbF9pbmZvDQo+ICpraW5mbykNCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluaXRyZCwgbGVuKTsNCj4gPiAgICAgICBp
ZiAoIHJlcyAhPSAwICkNCj4gPiAgICAgICAgICAgcGFuaWMoIlVuYWJsZSB0byBjb3B5IHRoZSBp
bml0cmQgaW4gdGhlIGh3ZG9tIG1lbW9yeVxuIik7DQo+ID4gKw0KPiA+ICsgICAgaW91bm1hcChp
bml0cmQpOw0KPiANCj4gVGhpcyBsb29rcyBnb29kIHRvIG1lLiBCdXQgSSBhbSB3b25kZXJpbmcg
d2hldGhlciB1c2luZyBpb3JlbWFwX3djKCkgaXMNCj4gYWN0dWFsbHkgY29ycmVjdCBiZWNhdXNl
IHdlIGFyZSByZWFkaW5nIHRoZSByZWdpb24uIFNvIGl0IHNlZW1zIHN0cmFuZw0KPiB0byBtYXAg
aXQgd2l0aCB3cml0ZS1jb21iaW5lLg0KPiANCj4gU28gSSB3b3VsZCBjb25zaWRlciB0byB1c2Ug
aW9yZW1hcF9jYWNoZSgpLiBUaGF0IHNhaWQsIHRoaXMgd291bGQgYmUgYQ0KPiBzZXBhcmF0ZSBw
YXRjaC4NCj4NCg0KT2ssIHdlIHdpbGwgdHJ5IHRvIHVzZSBpb3JlbWFwX2NhY2hlIGFuZCB0ZXN0
IGl0LiBJZiBldmVyeXRoaW5nIHdvcmtzDQp3ZWxsIHdlIHdpbGwgaW50cm9kdWNlIGEgc2VwYXJh
dGUgcGF0Y2ggaW4gbmV4dCB2ZXJzaW9uLg0KDQpDaGVlcnMsDQpXZWkgQ2hlbg0KDQoNCj4gSSB0
aGluayB0aGlzIHdhbnRzIHRvIGJlIGluIDQuMTcuIFRoaXMgd2lsbCBhdm9pZCBYZW4gdG8gaGF2
ZSB0d28NCj4gbWFwcGluZ3Mgd2l0aCBkaWZmZXJlbnQgY2FjaGluZyBhdHRyaWJ1dGUgKGluaXRy
ZCBpcyBwYXJ0IG9mIHRoZSBSQU0gYW5kDQo+IHRoZXJlZm9yZSBkaXJlY3RtYXApLg0KPiANCj4g
Q2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQoNCg==

