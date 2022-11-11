Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A6462595F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 12:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442476.696665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otSDR-0003yh-Sn; Fri, 11 Nov 2022 11:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442476.696665; Fri, 11 Nov 2022 11:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otSDR-0003vx-PU; Fri, 11 Nov 2022 11:28:57 +0000
Received: by outflank-mailman (input) for mailman id 442476;
 Fri, 11 Nov 2022 11:28:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FoG2=3L=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1otSDQ-0003vr-DC
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 11:28:56 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80089.outbound.protection.outlook.com [40.107.8.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06b21635-61b4-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 12:28:55 +0100 (CET)
Received: from DB6P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::29) by
 PR3PR08MB5578.eurprd08.prod.outlook.com (2603:10a6:102:83::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.13; Fri, 11 Nov 2022 11:28:42 +0000
Received: from DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::b0) by DB6P195CA0019.outlook.office365.com
 (2603:10a6:4:cb::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 11:28:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT031.mail.protection.outlook.com (100.127.142.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 11:28:41 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Fri, 11 Nov 2022 11:28:41 +0000
Received: from fa6c0fb95f04.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A2E4F9C5-4AA7-4791-9A7A-FCFA4B679DBD.1; 
 Fri, 11 Nov 2022 11:28:35 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fa6c0fb95f04.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Nov 2022 11:28:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB7574.eurprd08.prod.outlook.com (2603:10a6:102:23c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 11:28:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Fri, 11 Nov 2022
 11:28:33 +0000
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
X-Inumbo-ID: 06b21635-61b4-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=g63rZzxltL78Cok08vvTWLL8c56SIV0zc4CMwdOMcvxDV1Z/ftfc0lID1NouBoFoXmvehj/NrZl8OpJj1Gekn33h5P70lKlWqsa0UslgzRyqysJ5jmRLTyOyvlMI+nGD9Zc046g8p/zTkUP5hjkY4xh99GRpQri0Uqy2ilnvbb9LI+el1d3JOIvv+2u2zZZBPtjKcyi20XdFys+HWKPIUVrJHNBdpQ5bJbbeuMa9HIg0s5YMlusOH09ppfElbOumMsxoB2cicwbBd3/YWC3Jr2Sve7XO9s9zMBIZEe2FXsSIgyDxOt1hSRgwqQf5VL8jn/12fV0AE6GC1CBRiY7htA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5DU4q2sjXsgqUvemwSEiZekAWd8/hzjJT7DFNzLHgg=;
 b=eRNYUHNOGeDEF2dmNt2SHL9revha5cAt22zlzNxznmDV0rQRolTOnkTdFs0YqSR1GK6vH0WOaPcvPrVcecEw6yIY522pVoqQK6bxsi5KeMpOKyLv6HPp4NZCcj+vB4ne3/KpLIOsEYlezWjCjTc8sCV9wdTjHf4MycF86tRpj1OnMlQRdAAgi45WanZiuO0qm+bgO2Lg54gXX1hCaXkNfBMSBFl25RH7ABy2Znu2/VH6F3gCy6diPV86KCx83u84jtbVNSORVgHJ+ItHRd0dfFj//3qvzI0zQ7Soe2uNGZhTWWFy3143pgjmhgsHSusvC3Li+iQgdPaN2Ynx9SUgZg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5DU4q2sjXsgqUvemwSEiZekAWd8/hzjJT7DFNzLHgg=;
 b=pLr7Mkg4A/lWL+A//lRe31mPn6MY2BkkPBV+q1ALbfA5M2T2/tNZUCL/bfYcFnziNsK0+2TP/foK+STEV3IOZAjFjR6fmgqV2z7ACwEjpo6lLutPSsq9jFjlMurqYKkaS9GKpfOvll778eTkhZCZi/hliR0gq0r88D7ynRbARfo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5mcJVIcuMcWCZ3X8ReB6WNvqc6UUNsUZhra9Eg1gIsNmguQLHI5JuR8x7sFMkK/Vfjhz16nuw6qa39ziBRjwS/+Dj/rWWWjI/rAm8X2NTxyGne1tVo1rHgaYrbLOjCAel93M5PC66EN77Hnm7PSfR3AUjDAu4W874us8ZctFzZcs1R6bahbzgoJgXqeyUXS2hEx8XWlil4TZEbON3tOvKdzCu5AuADf0MQIQkWbvKsNAj4Tw5gy4mM3eAiCMN86FUIIzKH+EC8XVEV7PB5KkwnB053i4T4FH+XzRZNG+rHhAwOPPd4+BPosbTs3I+x6t0jf1F0CdLb/FotBjCCxTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5DU4q2sjXsgqUvemwSEiZekAWd8/hzjJT7DFNzLHgg=;
 b=kT2iV9gp3JhXH1PrNZAhCYwgEAkKxH8Y7wFxyoCu2la2l7ETHOr/qF/USJP4LxsPne97bpQdFmVa5HivolJL+KNKlq4U10GRnOVu03EQggp+JgBMfsgqGWhuN0G7km2ogrCVV146zqzgJTQ1KyTenBoNCciLWtcPuUMQ4HKx/YLCviEIsb3Gt50TixusnIddHzC7XvyyBqKSEpGoUaSOA97sP+rHzm4xgDLXvTKK8U/oPC6WI3jvusDn0od7zDXXpD0VsJ01ejmXb3JC6V399I2+P+DTWtH/9pehaY2CXL7jsJydgDl4c/VFQnjzs66tf5f9O3I6MlvJkxF0JDZRfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5DU4q2sjXsgqUvemwSEiZekAWd8/hzjJT7DFNzLHgg=;
 b=pLr7Mkg4A/lWL+A//lRe31mPn6MY2BkkPBV+q1ALbfA5M2T2/tNZUCL/bfYcFnziNsK0+2TP/foK+STEV3IOZAjFjR6fmgqV2z7ACwEjpo6lLutPSsq9jFjlMurqYKkaS9GKpfOvll778eTkhZCZi/hliR0gq0r88D7ynRbARfo=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>, Alexandru Isaila
	<aisaila@bitdefender.com>, Tamas K Lengyel <tamas@tklengyel.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, Paul Durrant
	<paul@xen.org>, Christopher Clark <christopher.w.clark@gmail.com>
Subject: RE: [XEN PATCH for-4.17 v2 0/6] Fixing some licences issue in public
 headers
Thread-Topic: [XEN PATCH for-4.17 v2 0/6] Fixing some licences issue in public
 headers
Thread-Index: AQHY73rCghjYe94nkUWe9AEw9k4cv6441jqAgADLbvA=
Date: Fri, 11 Nov 2022 11:28:33 +0000
Message-ID:
 <AS8PR08MB79910B53B2AF37B02C2C766C92009@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221103115204.49610-1-anthony.perard@citrix.com>
 <alpine.DEB.2.22.394.2211101513070.50442@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2211101513070.50442@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F60953AF969FDB4C9768217585D981E9.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAXPR08MB7574:EE_|DBAEUR03FT031:EE_|PR3PR08MB5578:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d0cabf3-0045-4ba1-6818-08dac3d7e2e7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OSDVp4kRPzhbQQu4fi8OJQllALBug+vXkgHH336paH63QlFWoXHthihyu6F1aLu+k0WybVKMuBS1EIOnQnXx+lurxbQ6/W3apugpWOWl9awXWynCyIug6lG7W00gSbU3vdNkStyyQo5wuN+KjMMQJKn8skdFwCcD688YQWfmyPRzjriqfj9or/GHifY+xwoMSE4twiabjHAlJRHlT6svAGQS4bUXPFsnq6uikm6PkXzlN/sIKJbGHuflsUDmVjP0m5e2JFhmgA8duPvMf7mKWBdWwvorNPJp9rSTBzt4YqVa9UE7eLrqa9QMh06rSIvoXlqDHx8CT4NM2fXbbJECKZOXRBB0F45Is/UIC86+5LNJ8WmLhumfUopA8rxbYJWXAs5CtR6yJXOLb/QwFfg46U0to/nAvKsUMQay/7l42oj/DkRkIHH9idXp1aVmrzV0YFZcv1v3kn5RfqlwDNyOOPa0TOjYLc88sKlYC8gnJkJ9MO/y5yUuwppExV+2O+O0dXJ5YqjfD94l/ezRo2Z0aPeEDkP0eHNBMZQA2t7DdAoWB4PKZRLkUdKPBW+/1+QdLl1O0LX+eMlevjlS0j1U7NqrmWPoynCofqExiA1PDTSUYxIkQbgdWQK+DTnq+xhHIIlhoQwqfQWcOQY/YB3KoGFQx8KquvMkH4zTBQdLGhwWLUufE/b9BzkOlw3LDCFe0ZQLJIeP1ewv2wj2zRKOqEXbKchBiv7uFbfRfVHzIrAtYKdPfiEk5xDGaOjqE0dK1M6M4gDH5lk7GqMY7lya+WMtXDikNGW493s1xYKM0Kk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199015)(2906002)(8936002)(4326008)(66946007)(8676002)(66556008)(64756008)(66476007)(76116006)(66446008)(7416002)(5660300002)(4744005)(52536014)(41300700001)(316002)(122000001)(33656002)(55016003)(71200400001)(478600001)(9686003)(966005)(26005)(7696005)(6506007)(54906003)(110136005)(186003)(38100700002)(86362001)(38070700005)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7574
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	16b61a06-402a-4dc1-a69e-08dac3d7de0f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SheMhFnfGr3feptSMrm7Q7QjGs0pqYzOZ7WbgYBhgYNFofx++z15gMZBYGDS+IQXIfGE7rsqWceP3gCWY1cHULOpIQay593qJzvr4WPMw1tkDXSHFiPwJx0+v6QJVoU13X7W5F/0oe8BwoTgezeDnd+f7MYVodE8A6uycM4PyKlpt3lL2B9kKMbCRHZVGjUNpvqRllPV91zw/v218BY20K15GNdet8atMcVkLs9rWog/5hMnkKYiv1ZznJpLDk1yu67a2e9fybSSWQaNl+e1Rc1Ml+0YGmV4sx6IKo6n37asx1ep8LSpmrYZjbCaOjV+6l26tvhcKWpsXt+OMZRdlHPtSd9VWgQUNU4Gmgv6Y5ruUis5bPzDQZ3DCnY+yCAdK9gXINIE/SNZiN1TaRs7aeUjfIA//n6REM9Ax/KKa1ZhLkt/BayQPBohSaL5o+KTmwIpnDOUKVV5KDx69DeW4v6RplcyzU5dtBmsievutTX9Pk5DTg0T/AAVzZgn6sJirR3GWRCL4UJdx2X9nonG5TO8USfQpSNuJd46oGVOPnzDYnXJRrvA3jk69AEhdmkq2ALNd2V7KqDCh0+atIyeWtbfYRQ18N3KuD1gwQkbb3toX5PfOFjXaCjUUF8miHrGYRn+PFeHYHehNzAj6yV/fJyp0HT7EYWWVBsFVeYxdMNu0A3pG6mVjixuJg3CFLxgfqcIvtv6oC9CGSFv9YwG9ddm6H4n5XS9hrz141IgKEtjowm05Z7tz4+oV43I+YFcrpfOiDmuidGg/FPK4I2F7Bsv/5lQ6e01xyJzoIxl2fw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(40470700004)(36840700001)(46966006)(70206006)(110136005)(4326008)(8676002)(70586007)(54906003)(316002)(41300700001)(2906002)(478600001)(966005)(4744005)(8936002)(5660300002)(52536014)(26005)(40460700003)(107886003)(9686003)(7696005)(6506007)(33656002)(55016003)(186003)(86362001)(47076005)(40480700001)(336012)(83380400001)(82310400005)(82740400003)(81166007)(36860700001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 11:28:41.8391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0cabf3-0045-4ba1-6818-08dac3d7e2e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5578

Hi Stefano,

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Hi all,
>=20
> I think if we are going to commit this series for 4.17 then I would
> suggest to also commit patches 1-3 of my "introduce SPDX" series:
>=20
> https://marc.info/?l=3Dxen-devel&m=3D166562222522996
>=20
> They are already acked/reviewed and are zero risk as they don't actually
> change any of the headers.

After some thinking and discussion I would like to follow your suggestion i=
n
here. So for the first 3 patches from your "introduce SPDX" series:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

I will need some more time to figure out some uncertain part from Anthony's
series about the relicensing of device_tree_defs.h [1] before providing my
release ack there.

[1] https://lore.kernel.org/xen-devel/fad0265d-a736-5135-b5ea-3735a8bc72da@=
xen.org/

Kind regards,
Henry


