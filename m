Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A386078D7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 15:47:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427702.677013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olsMi-0002mJ-6G; Fri, 21 Oct 2022 13:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427702.677013; Fri, 21 Oct 2022 13:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olsMi-0002kS-3J; Fri, 21 Oct 2022 13:47:12 +0000
Received: by outflank-mailman (input) for mailman id 427702;
 Fri, 21 Oct 2022 13:47:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gujA=2W=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1olsMg-0002kM-Nx
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 13:47:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60062.outbound.protection.outlook.com [40.107.6.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da8ac905-5146-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 15:47:07 +0200 (CEST)
Received: from AS9PR06CA0596.eurprd06.prod.outlook.com (2603:10a6:20b:486::31)
 by PAVPR08MB9433.eurprd08.prod.outlook.com (2603:10a6:102:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Fri, 21 Oct
 2022 13:47:05 +0000
Received: from AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:486:cafe::31) by AS9PR06CA0596.outlook.office365.com
 (2603:10a6:20b:486::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.36 via Frontend
 Transport; Fri, 21 Oct 2022 13:47:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT045.mail.protection.outlook.com (100.127.140.150) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Fri, 21 Oct 2022 13:47:05 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Fri, 21 Oct 2022 13:47:04 +0000
Received: from 04a402a7427e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 167D069D-4641-49AE-96EA-3CEDCDE443F4.1; 
 Fri, 21 Oct 2022 13:46:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 04a402a7427e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Oct 2022 13:46:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB8419.eurprd08.prod.outlook.com (2603:10a6:20b:567::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Fri, 21 Oct
 2022 13:46:57 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 13:46:57 +0000
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
X-Inumbo-ID: da8ac905-5146-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XmcmxlC4OhHpQLfWEisuso8Q1wDxLbvqpXLfm/QFgQt7AVr4+9b32GtzEz4z0mMVkhJ9qGRnjvDmV2CbUCBuFrIRlcXklnpml4EFAtvDiLV0AqYNHAaFU5LAbKxmJFa93jN/IxwZKnb9iKXoVQxpDtAJCjHLDzw5v/ldT+eGHklf/ZU5iKCyO2Ug+3g54Mm6aMzKt30uTMp5pwBx1HholJ6cv8GuUt5NzGeq9OLGnJrveLQFNtsbIBLzJBjovS0U6ETHeMaADR9xBtI3jskLeDWiWSCdk7XdTaY0lhZjivGZvaRZoacagTN+oLshkXgR/OUyhBSHMdSZGbVF+You+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GD4iChV8i1eBkRb6dA9fhmlqyI+MJFhCQBl1YC85M6w=;
 b=V1wI8swbnCIOZycFmjKt6WEGyskDSlwvzRCPAZfOCPmRbqq0tayYdR5fJxA4CYZYAL1B0fGkWxRQaQ9VMUs6CU5fta8U/uRlpw3y5rlEQrIA3a8EUhFAJfciO3/53fCfOQgL+HSx9YKRQvck22eGP1rmdjGQ/FZiAexRwtZCtF/RzO21U5pKI2tJa/XkdvdWUZOJR/bVDcboBiEw/adsAdSHIRpFpPbcOWflUFYrtdwR9ihB3e1CoFSoDNvZMo47f8FhPbKHe2SFYij6I/G66TbH1v1qN/bFRhWw3qKPFHtNS0zbZr0ZXO9u/2RMuHTuy/D8oyrWW89sTmlU4maTpw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GD4iChV8i1eBkRb6dA9fhmlqyI+MJFhCQBl1YC85M6w=;
 b=1W8c6VZKG9ire5g9ujABNJ+uy1mWh2UqniQEvgHhTODX3PEyoHOv2PtlNHvmxsG+Y6d936RFYJElTOpSKfY5R1+ORfc2mpIhF2+h0a7GYg+Aj7bR9K4BiI3Kl5tFnW0xd0732wnFsMbwBYtSk4JaRQ9BMmmRdyOqGMdTRwoFCew=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbizueFyyg7nNQ4KD967uaqca+kGuWS0uHCeycP7ChMllyijodA0RAR9i/m8sx6LC5IgF+8Iv/dziwr0tk0Y8YzC6XdP8i3AXnPt/vt3JPcXf+0ePevF1Vb2iLndcq/ozdvU9qlGRS8aOgXGe366nsJsSs+a2QG05u9rk625oNzMwmRAsGBzih7YhECWzyJ96lWAMsjE+AiZnn9XhaiMJX7/MX79fMc2kiEuBlC/NTNIuhcLt1JCVX1DQwpv0HKoD5Cg/eUqVDfU9QpoaTEgqzxAqB48QtFEBOUVuSwueBN5Py50e5DyFr+N/0ssKl5s9KgFMAVoKJCAShyX0vP6Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GD4iChV8i1eBkRb6dA9fhmlqyI+MJFhCQBl1YC85M6w=;
 b=RfJP/tzuWfw2Vsk7SRoqeo8FFndVeL4E0CWEtU4dxMCZVg1GDPh3D3iMStOLNr2zsYoozBW3sVBiHpKSIPV7UDn3JQRhrB3/wQbcrrwoHFfoH2TzB6ZwDZ3GZu784K23MjYtgI9QYa8spZV9+qLLNHpeZysAjgYlpJe3CrhooOLyN04fbaeg3sj6EiAP4Ym0cowU2PGVC5EK6FRnIcckqDcUmDPZFdFFqkMxVkAzdWeIAwDb5DIWu8hSesnAIlPG6bakiTLnAN8UuuHK20uBajEGq+MlhtGgAUzZGRV7ILTgAUlflNVG4eSaxm2XULCP9lAZVFjhKiCcM/igA9wqJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GD4iChV8i1eBkRb6dA9fhmlqyI+MJFhCQBl1YC85M6w=;
 b=1W8c6VZKG9ire5g9ujABNJ+uy1mWh2UqniQEvgHhTODX3PEyoHOv2PtlNHvmxsG+Y6d936RFYJElTOpSKfY5R1+ORfc2mpIhF2+h0a7GYg+Aj7bR9K4BiI3Kl5tFnW0xd0732wnFsMbwBYtSk4JaRQ9BMmmRdyOqGMdTRwoFCew=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [for-4.17] automation: Build Xen according to the type of the job
Thread-Topic: [for-4.17] automation: Build Xen according to the type of the
 job
Thread-Index: AQHY5VBH0to+UdgFKUq0Sje61MU0ya4Y3HCQ
Date: Fri, 21 Oct 2022 13:46:56 +0000
Message-ID:
 <AS8PR08MB79918F72BB0A6554A55887DD922D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221021132238.16056-1-michal.orzel@amd.com>
In-Reply-To: <20221021132238.16056-1-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CD67E81D073A4B428E6052E6B3A0EC9D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB8419:EE_|AM7EUR03FT045:EE_|PAVPR08MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: b463419a-bc28-43eb-c48f-08dab36abd55
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ypefU0R6gpIz/We2ph2f1NxvkYA9Fb/mtsR6FxwpHnJqWi86muFUy7gdxjJ7TucDNoAH4/mWMsqidHIQ730e5tiOAMNN5jh+pSrUpFVSGfVU2eIxc28EZ1VoX5TW/XC1cSmIH8A4OwwlCJPd4zw15UlNNgmLepxFALXz4KXNJZMfNQp3LPzFB3vYZhyFuNzEfUKqvJzEyOf9y/r5h8uQa90FmNdlPNKsMEJ+cpkK6YjcABf28mzo/NqDkVRhYAOnl0hB3AH6FKGTeDkl3q3tcpa+v5MAb+zxEpaZ5cYP1UJtF7AMlu7OQMfkhnDyMmyD1B2Hgvez2k9QhNEzvD8imh+vSoMMDRdodBmFviyHM7xeN+Vq7YqiTK/gWbX3IREPNqpfiKJ9FkgQbFwX6lWw82EyR3KO2iZTPvu3ukwsPb+nBtD1aB9XWo/5oi2fejQf9FxLtvAR0rA4sP0u2LIIbkZzFeqzeYSxCh24GuSQQgu7IDv8GxQpzQsGvtEYp/A/eYnsAy6dR2v6Jx/z7I+Rji4ZjJpxbiX10/v3UO8j7uppEK2TxkkcJ7k+ag+xhtTb6ERS02NF8+yLbMusHIrn0Xw+1K6SeYkH61+8UbheV4yh0hHVir7hu5k8L/0MzcDTAgcldvvs9MVBgMeh5SRBIJAnIddaDM1W29/uCiOcsXg65Fs6zna8oaIrGrQgx+7gNz6dR0MP+grJAFpByGHo9RSAxHs8OvlqspzmPSFh2XuqzZsx8oPpx86LTCLLpl8WGvOmMYx1Np8BN3yqeg64BQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199015)(71200400001)(122000001)(38070700005)(478600001)(110136005)(54906003)(66446008)(316002)(41300700001)(76116006)(66946007)(52536014)(8936002)(64756008)(7696005)(9686003)(4326008)(6506007)(8676002)(66476007)(66556008)(26005)(5660300002)(86362001)(2906002)(38100700002)(186003)(83380400001)(33656002)(4744005)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8419
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	96c99b6a-7529-41a1-9f82-08dab36ab875
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ItoEUrjjGqEZUAFGNzlbs1IlrbxF32UQZLWMfrg8U/m7ut1EAgq6tAwazxMcfpIq8kGcmjh5LTyHKJwhWWkCnRHFG1a55m4kpbJC0S6RBuZi6fjvCL89oWFOs17bB2RFxo/p1qWbOSpube7u4f6exNXnRxSiEDPQ9J8XkXrNuphiBHUyJn3tuc0Ds/qN8K+t1NRXdlMG388VAHtkHowiWRuE7GITW4U25+aG/xnaZBRmg+uKnUAYPO8uN5IK0Tumtx8wj//Ie4xbKzlMZrI/4mlBnf0OysJfolQ+YMBXlC51QdFGy75VJEE6Exp9eDOEF8QwrKypNP0tkZR0AEu26d3dL1vKRLeEDFXew/9hR2zgK/naJfzJZTyUQ6EWRqGlMz2+8F6tpMj8IgK9Mx8FgQ6yX53WRZtpp7jzmtlM/ZvLEObqajzQDCTZkIRbijdct1m2PydRlmWlGKU0N+ZsnJIKKYUKcRL7+SRhYG+xKHN3Av1DWngzRcxobalHfm8wvBknhKYcGkek4FjyT5YQWSqeeZMjWUQ2xImSYD9biMjq8BKrPHiSDWMArNLbsrX3/jRvLP2tw1/fKL+nseObZpROtR/XWsoYY5IO80SiasjKYNNeQW2dqUoxIJhj7fpBtmo6NUzMt0Yw4LARcVVI/5WW07ZyhnuvflolS2GNAR8Wz9Z0giDQyKcNpw7XWnwbSwcHNn8+zdtsOt22IjjAJrcoCDEYQADCpwGr6nvzqN/IOV9aAN/LBCp6WVgj0zLqbP/54fcMsH74tiBVpgQhrg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199015)(46966006)(36840700001)(40470700004)(4326008)(110136005)(54906003)(316002)(8676002)(70206006)(70586007)(107886003)(478600001)(86362001)(6506007)(7696005)(82310400005)(55016003)(8936002)(186003)(41300700001)(40480700001)(40460700003)(26005)(9686003)(52536014)(5660300002)(336012)(4744005)(2906002)(36860700001)(33656002)(47076005)(356005)(83380400001)(82740400003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 13:47:05.0141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b463419a-bc28-43eb-c48f-08dab36abd55
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9433

Hi Michal,

> -----Original Message-----
> From: Michal Orzel <michal.orzel@amd.com>
> Subject: [for-4.17] automation: Build Xen according to the type of the jo=
b
>=20
> All the build jobs exist in two flavors: debug and non-debug, where the
> former sets 'debug' variable to 'y' and the latter to 'n'. This variable
> is only being recognized by the toolstack, because Xen requires
> enabling/disabling debug build via e.g. menuconfig/config file.
> As a corollary, we end up building/testing Xen with CONFIG_DEBUG always
> set to a default value ('y' for unstable and 'n' for stable branches),
> regardless of the type of the build job.
>=20
> Fix this behavior by setting CONFIG_DEBUG according to the 'debug' value.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

