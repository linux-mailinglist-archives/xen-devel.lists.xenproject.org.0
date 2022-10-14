Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E196C5FECA6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422724.668949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojI6i-0007tY-9j; Fri, 14 Oct 2022 10:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422724.668949; Fri, 14 Oct 2022 10:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojI6i-0007rL-6u; Fri, 14 Oct 2022 10:40:00 +0000
Received: by outflank-mailman (input) for mailman id 422724;
 Fri, 14 Oct 2022 10:39:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Pkr=2P=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ojI6h-0007rD-3i
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:39:59 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130055.outbound.protection.outlook.com [40.107.13.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c528136-4bac-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 12:39:58 +0200 (CEST)
Received: from AS9PR04CA0146.eurprd04.prod.outlook.com (2603:10a6:20b:48a::19)
 by AM8PR08MB5745.eurprd08.prod.outlook.com (2603:10a6:20b:1c5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 10:39:52 +0000
Received: from AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48a:cafe::79) by AS9PR04CA0146.outlook.office365.com
 (2603:10a6:20b:48a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Fri, 14 Oct 2022 10:39:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT020.mail.protection.outlook.com (100.127.140.196) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Fri, 14 Oct 2022 10:39:52 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Fri, 14 Oct 2022 10:39:52 +0000
Received: from 4da4eab61a33.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F1E8F0F1-6A94-480D-BC08-FC4E0E5C8C26.1; 
 Fri, 14 Oct 2022 10:39:46 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4da4eab61a33.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Oct 2022 10:39:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB8650.eurprd08.prod.outlook.com (2603:10a6:10:3d2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 14 Oct
 2022 10:39:40 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 10:39:41 +0000
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
X-Inumbo-ID: 8c528136-4bac-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kNUuJUaPNN/78oi/aInYMdhUKrxiWqiooMrK1TKya4ibXj1QzdzyUs0g1GCO8vw6qe6qt54P2QHEQAs0wqN/Q7R4+z/JomZ2+Jk9KQTDyfdCuKqI53FJT4zVXlIxF+ns1ZwxT6STlrCyGdDzKcioNXfT7UR0xMNs5XX3RcubgIaEKirq5zHr+VSH6J+cCvsbA4hTWupLTxEfVELHApKVldQAUzPRCD0cx5aCeow24nI6Kqf94YSZnv6//J4V2iuTztdEDIG/vZLM0fe2fkS6GZaKY/LKGqscZVrsBhbq1C4NWXQKyMFyEzd48WBtcVSng7Sv2Xkdj6d1XZNyGm/G6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7E1wiQH65i3X5Gff51xUzVsC7jolGBG4OLTRZecPec=;
 b=R9ClbrliImXOqgxRWW0461Q/RtSkSeVWwfdMLATV53pVq6mMNAKCx4fwqg1s3/80KtWqB8xGd27yVl/TtD628+SrZsTM0c4XZd11sJ8/eTzs9qs/hDHDcvxzEi48mOs+JY6IuXRJwiXFuuU2iN56oynfTOIgRnoVStQRnQokfwhsWLyremBrxLtH/JcapGKTOBXZDBXELuqkd+58IWr331L32HMz5ZOKD9XSPyqZ64KhfPFg/+I23CQAunHaTRiwHX6WtJBPVVbyqHSWKIEISqGU26jHiaOGbDBD/qEzgJr39trumFp8T4+gOMhrGOLsB8QJTxfbZ/wp1OjteqWzDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7E1wiQH65i3X5Gff51xUzVsC7jolGBG4OLTRZecPec=;
 b=ukhPdD/ItOVWboBiPDE427+8qOLmh5ESK4eEpy1nMEOA4MiGnUoH2oLNw3PjwHAtP0V61kkOVbuYdBTlq/jQFhyq8VZefygtaVNU3SU+QXsRscx1FH/+rj/iZQiajWccn4ASf53lmw56adWYUHo9qLNgNv21RG0KJSAJKGsG0K4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKrBpG0Nh6k8uOekRYeiKR2DGXVFMlYXIU5XIFHWs68gZ2CUZOrj7uhlV4ofLBQVmMMnsi0d1lK13ia3r7z7v4ueKcRAhhWHPioC2TqAJ41lcT0QAK/p8iKcxgaeP1Bn8Z6iMetPpJqOGzvDK87NGTlfu/urOIeBTABoz6fuqWgZKu2O+irQ/m5yvnbNVczd89VMdetE7Cn1t6Z32abmV3nm3RwMiG+5+p40tWt11i3AkXeYG2SU6oUF6MxTf0FYl6U6dmgZ/x9qTrZTLIOU2ZzT4J813Vq5yFQhh4BgVOZgzHf/kwNF235FDZo6KMY7InLdGKfjFVbopdMxLV2u6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7E1wiQH65i3X5Gff51xUzVsC7jolGBG4OLTRZecPec=;
 b=gNMFOJSq9ojysedR6CruILPPYSfIQXuARLN5Ch8pcbYoV9b0QQIJUsOlrEH1RyF4J1fkWb3zjZaQQlCsdC+25BPq9+zXvkkSKMvGx36pDAgJxjQCgDMMrl+RZtqznrBFqWk4vsE7S8+mwPJhMpq+9jg2aYY5sz7eQ28psPPfDz06eLSooXHL6hFniqhiaiJjYSez6iooeOxwzL6m6KPD8xWC2ghVWDLL5TKp/MQKJm17Mn4GdEBzrftpzDRitgxPHQSnrmn2YHgk2RBgv7C7+cT7AoTdXm91op+96EnbVoLe8mEjkAHuze5wbA186wvpoGdSte+MdRlrFs/v5fp+lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7E1wiQH65i3X5Gff51xUzVsC7jolGBG4OLTRZecPec=;
 b=ukhPdD/ItOVWboBiPDE427+8qOLmh5ESK4eEpy1nMEOA4MiGnUoH2oLNw3PjwHAtP0V61kkOVbuYdBTlq/jQFhyq8VZefygtaVNU3SU+QXsRscx1FH/+rj/iZQiajWccn4ASf53lmw56adWYUHo9qLNgNv21RG0KJSAJKGsG0K4=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Anthony Perard
	<anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [XEN PATCH for-4.17 v5 00/17] Toolstack build system improvement,
 toward non-recursive makefiles
Thread-Topic: [XEN PATCH for-4.17 v5 00/17] Toolstack build system
 improvement, toward non-recursive makefiles
Thread-Index: AQHY3wSf1tDccsob1U2UzC8OPggTyq4MneqAgADO4WCAAECRgIAABO4AgAACA/A=
Date: Fri, 14 Oct 2022 10:39:41 +0000
Message-ID:
 <AS8PR08MB79919BF19B6FD82FAA7B320F92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <381f1ae6-d539-ad52-79da-e44e9dfd5066@citrix.com>
 <AS8PR08MB79916265D28F1533ECC538F992249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <Y0k2cQu8a3sHKSkf@perard.uk.xensource.com>
 <0faa9a33-e3a2-1a8b-b0a5-581a14175c2e@citrix.com>
In-Reply-To: <0faa9a33-e3a2-1a8b-b0a5-581a14175c2e@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D0CED4A2F3CA7843A44BC707FD185EA8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB8650:EE_|AM7EUR03FT020:EE_|AM8PR08MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f06e856-a8ff-4ae0-2cec-08daadd06d3d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WOiRK/WLsesmBNf0Ylg4IGSlMNxSvTjigL/obd1zsaD3hNFKVn6JcGqf6IemwfmoyZe7GVo38FA5SDplwnF3EM2kJgjB8WD77w+tUZxCS9SWay88AiRiONcxS4W5e05j8NV4Elf3iMafukN2Z9lM7W360ogK9myVmje9rbA+BKPbp4u25EEXPG9BQ91NkIOOwlC0fGTj+wxhMhCMtBWZwWk54lRAWtSuQQxG7wsEB4x58dJuvB2MwrJ0g1h1cW0URLeQjpK4T5yeMndiRl2vHCKAqCJkUxtIigVjwulvVwsIDN0Nni+YG+N+qKu80g7k999bLghAQKq9AylxejJnxj0l6phCqfCmSLY02G6MwL1RHb4xKAFVj/jyOfkKTffyB7lxYH/e1PFKiXkmyozJBpTNyBI70wrHOrYu0+5Cmpv5pIYszNeEJId+CsZQLNVSUmK88Wp9pAcbCBOsgVep7XjE3xn4+e9kdu4rC/IcAhReGgCGf7VbBjsN4POd301eRAaWGwDi5jvHMKPEhR9Hj44LocTQXykgtq4HxLSpGTDiOLhauovmsa67tOvTLvfZwh3WzVA5mSxBDTUmBjUwOlGHWTP6gqVTnG8wVwHLHljSh1hRWRPB6VxPVM+1O4CwZOztPrvO4r6XSWjyA8uCWUn62QbrE2qe8OKOlg86GWO06Ujdu8LCa7ibHcTrzM/AY1cH/YYFl73z0lZ4TyFkvx3D9QuCgTUkkjjeKkH57sPeStkox7x4DX4s8/zwlLG3XJizy7A/3G1h57JC2hMQ9qFDaxCy0+iVR3p0SOCooqYX8gPGR05WkSh6XzepwRl6
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199015)(5660300002)(478600001)(6506007)(64756008)(316002)(66946007)(66446008)(110136005)(33656002)(66556008)(83380400001)(66476007)(186003)(41300700001)(4326008)(55016003)(38070700005)(71200400001)(8676002)(76116006)(8936002)(86362001)(7696005)(2906002)(9686003)(52536014)(26005)(122000001)(38100700002)(4744005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8650
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ae73b4df-728f-4b95-e27d-08daadd0668d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nXIui2EzavqKf7NPNNF8Jh5cAt4ZTjUe5fjE3L2CDOpWLWOyr9X5BcPH6PWB3b4VUhGFavfz++tXdrtjKx76+2Aw2zJZH/zNbDv1PHHnYpKY25jPKnJ/9/wM6aQzA7qVSPVqM3XQXdBxBKolFh8GMBjB2Myb4z+fu7eSRy49wQWBaAVMHIXiPT7L+iSjWAwvEyatOdV7hk8TFVqUStgtr++9f6Wr9fJZe6uEIcLUpBnlmp+kBZnF+qqT334BCKzmVtqkyxSvme6usVkW1lTN+a8hgBw1Rn/39GRRRoAgFIGBToiqGwrxn7B1ymYJ2+hKq3Hxwjp+eHOG3PSnqFJjRm/Ymmfd15RhwLFIN95L7ZWwFKpQ1NMyeeqLUjYYKmxDPRUqBW16q7SCX+kR4iJjHdF0vPT7fvENTGCZS9xCTtMzDIkKQ/gm1/qOO4g52DZmh2GFSS1BAm66So+0NDl//SuRgFtQNfUr73tVuAZ79uvwSP29HA8RphK5RUMrv3azXT6mAx30zf8D6dfpgr1QoQ3GzustqACBe0HAapysxfAFyKtSYE0IzjzgqQwpBwdldrZ0SEm1z3BVVeugUg/wC6ouZDiU6YpeR9lWUtwbANczLpwPFtMET729W8mfAJZ1JrDYeCkmQWEF4/u/OK41v0hegjN5wQifK08VJGsUwPXSCaS42Hrt44qHhD9MGhMXGNBgNL+lDdDoaL8deJjL4v/HSStbqzN+oKpcLHC4F/FbTkSYjt5O0Ky9BloEFjjPeWEcFQMlMJJfDgSpXxommQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(36840700001)(40470700004)(46966006)(110136005)(316002)(478600001)(70206006)(8676002)(70586007)(4326008)(26005)(9686003)(6506007)(7696005)(41300700001)(33656002)(52536014)(186003)(8936002)(5660300002)(2906002)(336012)(4744005)(47076005)(83380400001)(36860700001)(82740400003)(82310400005)(356005)(55016003)(40480700001)(86362001)(81166007)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 10:39:52.3250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f06e856-a8ff-4ae0-2cec-08daadd06d3d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5745

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWEVO
IFBBVENIIGZvci00LjE3IHY1IDAwLzE3XSBUb29sc3RhY2sgYnVpbGQgc3lzdGVtDQo+IGltcHJv
dmVtZW50LCB0b3dhcmQgbm9uLXJlY3Vyc2l2ZSBtYWtlZmlsZXMNCj4gVGhlIFhlblNlcnZlciBz
cGVjZmlsZSBsaXN0cyBhbGwgYnVpbGQgYXJ0ZWZhY3RzIHNwZWNpZmljYWxseSwgYmVjYXVzZQ0K
PiB3ZSd2ZSBoYWQgdG9vIG1hbnkgYnVncyB3aGVyZSB0aGluZ3MgaGF2ZSBzaWxlbnRseSBkaXNh
cHBlYXJlZC4NCj4gDQo+IE15IHRlc3RpbmcgY29uZmlybXMgdGhhdCBub3RoaW5nIGhhcyBhcHBl
YXJlZCBvciBkaXNhcHBlYXJlZCBhcyBhIHJlc3VsdA0KPiBvZiB0aGVzZSBjaGFuZ2VzLCBhbmQg
dGhlIGZ1bmN0aW9uYWwgbG9va3MgcHJldHR5IGdvb2QuwqAgKGV4Y2VwdCBmb3IgdGhlDQo+IGxh
dGVzdCBzaGFkb3cgYXNzZXJ0aW9uIGZvdW5kLCB3aGljaCB3YXMgYSByZWdyZXNzaW9uIGluIFhT
QS00MTAuwqAgRml4DQo+IGlzIGluIHJldmlldyBlbHNld2hlcmUuKQ0KDQpUaGlzIGlzIGdvb2Qg
dG8ga25vdy4gVGhhbmtzIGZvciB0aGUgY29uZmlybWF0aW9uLiBObyBwcm9ibGVtIGZyb20NCm15
IHNpZGUgdGhlbi4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gfkFuZHJldw0K

