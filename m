Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B33CD602692
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 10:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424771.672448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okhjp-00020b-5O; Tue, 18 Oct 2022 08:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424771.672448; Tue, 18 Oct 2022 08:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okhjp-0001xA-2b; Tue, 18 Oct 2022 08:14:13 +0000
Received: by outflank-mailman (input) for mailman id 424771;
 Tue, 18 Oct 2022 08:14:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RnJu=2T=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1okhjn-0001x4-B5
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 08:14:11 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140042.outbound.protection.outlook.com [40.107.14.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d71406be-4ebc-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 10:14:09 +0200 (CEST)
Received: from DB6PR0402CA0013.eurprd04.prod.outlook.com (2603:10a6:4:91::23)
 by DU0PR08MB9204.eurprd08.prod.outlook.com (2603:10a6:10:418::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Tue, 18 Oct
 2022 08:14:07 +0000
Received: from DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::91) by DB6PR0402CA0013.outlook.office365.com
 (2603:10a6:4:91::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Tue, 18 Oct 2022 08:14:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT003.mail.protection.outlook.com (100.127.142.89) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Tue, 18 Oct 2022 08:14:06 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Tue, 18 Oct 2022 08:14:06 +0000
Received: from 7dbef5e3c54f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0DDC3585-96B1-4EEA-8E50-B4213E02837A.1; 
 Tue, 18 Oct 2022 08:13:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7dbef5e3c54f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Oct 2022 08:13:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV2PR08MB8270.eurprd08.prod.outlook.com (2603:10a6:150:c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Tue, 18 Oct
 2022 08:13:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 08:13:57 +0000
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
X-Inumbo-ID: d71406be-4ebc-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Qrt77yaKtojvjMmOB1oT9TQw/l3vG8UTWEJvlpLPb5RsDLacimCne/+H8leg8xKo0xSjccHPX3ZiZUXl+ZK29fU0nBAld6Q2VxFt8G8KEl/OI+6ONE20EW3f690+26qycTMkfup2bwX3xdT1bcGoi5XltwcBvfCFBK+fm6ha5qeUITDDtk3cxWO3ExgjFCFzlzqcn0d6L+X+9esANIOxa9GNr5TYL4BzZt7DnGSprAqmDsBFJDfN31ZS0CZTYDJN2Lq4wgWNXNZWEz/WksPZQ5HEhtzMRq0kUtD8updjIS+2DvPvdQUzdWzMWK558q05hAnb7vXu/1j+MYecJPt9tQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foh0/NlodilCKf9ZTJs38GGwrVWCeYoIbT1SNFQNe2w=;
 b=VUG1SMpxXe5Fjg4OnYLWeG7pfxLx76ZowdwmN7U4tru5EUAZk/bMu4q/0v3AhOpm8tk8xksgvYQF3p/rbBolQDjgTjvcIC9mCXP8qI0pzbHQ5Be9ZhmXxM89yznGUI92uOG+5mvTf6+v7Gmls1ZRQ8KTWelnPApArnzr6RduDENnVR4aWU13jp5Ht8B3Mef2sLS+sn+kR2G+qW+pO82ihVapJoA1ZuaXDlvG5BpOcna9xoIw98bazTuTCTMuJAPPkDwXl48qsSc4F7RuSKcxTi4JCCb0OY1yGVCh8qQ6NYOiIjZJEZ0rnKdP+1PPA9c5722zBVG+hFdqbf1mMuyoYg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foh0/NlodilCKf9ZTJs38GGwrVWCeYoIbT1SNFQNe2w=;
 b=7hWSKsiPkjZxjP/vF1YbOWA2TKc+UWAjHCfj2LSsip4JcDE67ogiusPISv4sMD0SalotrPLigB9T+0hFYm90/9hLyotcBdEFWnS+p2hTZ5uw+I/QERKUbMTbJQc4EnX5HDqymsTOCxOGLUQhpJ3tImIA30pRF8JOiGdcTgLnLOc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a8e7c8a0e75cfbd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNw4LVSI6hNFpV8Rt7grgMKJowQdff2VugKAO+aqlqma32wMpEYseL6hH9h8WQQIKtSHBF3AUr9dg/gNWWFYNwANyDgLSak2acpFENYw4rHEEByIeITdOoK+F2eAWB+i0C0Uc01m1CBrCZKn/W9A+Ca8VACNDIvUE/6wRkRCuYpwfvOkBTLTUzFdVxmo6C7n6EvphJYxRiDx5xSeG+rIz7i5o3HpTl2UYo59P8AngbyWnSN2E7sQJi5kjhkmEXI8Y9k0Sy9iOo5PjvIK2magRll0OC4jtLu2eYmB9vjS9R3pMqt4fVmFvvXh6IKPdhli0XeDOdhrSMs3Qn2kLhgWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foh0/NlodilCKf9ZTJs38GGwrVWCeYoIbT1SNFQNe2w=;
 b=G+yJrmofyuIiR421v+vrCZoMXl/D6lh3/zJ5g/itN/8JVMN5EKBkJEoTkTLE7Giu19hz3zuCPmfmnTigNRLII7BYJDbWSn24nfSYGiYr0ic9C2a9LnNJnK5+iIyWjfzc4tNpfQPyTGuwXpvJtEE7oJGEyEXCrGoulCjQsmuxtEk+SXpP0cFVnNEZglwI6pv52PfzXlk86q5ihDHpDtHH7rDN7W3IY0DKeYgf3HiHyL4H5rceuAsoJbK9XXXeDQKVBtNs/A4uHvfwU6JxVz9ej/wsAQqbwj/i/6yVHRgaAmTpMqL21cg+bhvjnjO1S+qHNTCZmXWD6snqa++DxsYvog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foh0/NlodilCKf9ZTJs38GGwrVWCeYoIbT1SNFQNe2w=;
 b=7hWSKsiPkjZxjP/vF1YbOWA2TKc+UWAjHCfj2LSsip4JcDE67ogiusPISv4sMD0SalotrPLigB9T+0hFYm90/9hLyotcBdEFWnS+p2hTZ5uw+I/QERKUbMTbJQc4EnX5HDqymsTOCxOGLUQhpJ3tImIA30pRF8JOiGdcTgLnLOc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Peter Hoyes <Peter.Hoyes@arm.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Diego Sueiro
	<Diego.Sueiro@arm.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [PATCH] tools/xendomains: Restrict domid pattern in LIST_GREP
Thread-Topic: [PATCH] tools/xendomains: Restrict domid pattern in LIST_GREP
Thread-Index: AQHY1zZSy8ha9+hxm0C1gDMvI07yO64T5LUA
Date: Tue, 18 Oct 2022 08:13:57 +0000
Message-ID: <E63CD72F-9C98-4EB2-840C-56C46BFD7BA1@arm.com>
References: <20221003144216.2297632-1-peter.hoyes@arm.com>
In-Reply-To: <20221003144216.2297632-1-peter.hoyes@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV2PR08MB8270:EE_|DBAEUR03FT003:EE_|DU0PR08MB9204:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f10aa83-20ad-4a3c-b150-08dab0e0ba0c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8hTJHIykIIWKSSpetfaXdPJ5IwRNQpgmZqQmfJDC0TMwl73K86sNONTBIMOxg88/6I6neRFSNI0j2WN/pvjmiIpbXaMUsHQM837OC6DtgVKAEfxPkJQ/iUUWYjZ+4azLSNf+LWkhw2QfXCQQStHtCAZQEumdffVc84S1JId8oq/vqqvWsrV2F9bfQZ2ubsewIQxeEBAWi5sqUN2jrDpo+9wfhlBMxyC0/sn+qYYTcPEIEYFXYgHbcIwL0DW6tHN1YFD+vXlJUbol6O+rAwJTB7ZfYFvLbiY6+6+gH7aD7hTpjiIVbkU0MGHzFM0s5RbUDHpbj3c2h714oocsEM+mZuRtl4Ii6C1IMnVcCZFbY7AMeeswypkJoUEFAu2wVWqhAUyK5ZhmQN2loyo3OSIr3Ze6SwRrfnLdumwrzamwzOEc5xjmfgxAqst+B+fMkr0lLqdwZbiNVqW9SoliMwM3mhagVuR5GU1QauQuQZMzWpuYgZSkkrm13sN2tSvKp/YSWTRWYqAKITTTcbZnnAfPmQgU6pTZTF/WKqm9BnGPmRnYbq9tXH5UUOYXQiNBFqCnpcu6WBz4tgMzeyQcYznkcreED70aKvMA5ajcRnLguaSPC01wChb88GvsEOqropq3hYdEqAt3i/HB/4sTsPtzbJhTpkduUOp6WJAAWnIyvqshpLR1tAEv2yfhd8r33qTxgQRrAZ8+R3JR152h5Y8WUQWX9qJ3dafIyVqK9sOYMskJPnezYiMgYt4TQY4wMUAUuqyXdwBc/bi+W1QKp89FThWWnr9cO9pYQIkjHo2trUE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199015)(186003)(2616005)(6512007)(6506007)(83380400001)(26005)(2906002)(53546011)(5660300002)(6862004)(54906003)(37006003)(8936002)(6636002)(66476007)(478600001)(6486002)(64756008)(41300700001)(66446008)(71200400001)(8676002)(4326008)(91956017)(66556008)(66946007)(76116006)(316002)(36756003)(86362001)(33656002)(38100700002)(122000001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DB9197A14062184EB950CA7A5D7794FA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8270
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4d34dc48-8634-4be7-5844-08dab0e0b45e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gB2kRfk09XooO5Jxir7jMvpyWtd5QBFuIdUE0bXmDxmm6y/D048Mq0JhmKdb8zcDaHYjKOYXs0+rvpkuFFvHWti5YGVYOg//ONspfVVcSjRuysYrOvhxEvLv4a+Rx+ssuwSW0y4elymdSKIJozkMr0o/qNMGJ6GSmAZPpVklWoWNRfr0WGDeMYmgTslwNg7SyIrHsHaaIYUboQx5tOXHMkDsxPkOtyN3KyUoTTnCGVMkEwCSLrtFoNq01HAG+fNTsHW7gRA4q5s5k/Pa3YBHwatQTxtv/Q/D4ollrExZfjeZN3zCwaKiGbzXzVTkkk6ctr/Ctxf8cqyju1SpMIATN/Wl2pfUZ9omeV/Ij7TWUlzkR2Cyf+erC1edcBcBs/+HzkP+aW4wwIna6yr/5OTX3/P25JZptRStE25F5j+8sh+47dF7+BhDQ4nuL5WBp5m6ud8D+ubMgucfTPOZstOFQMCAgG7vFk5SksEMnZhKxjEjXJpBH6l0npXixZ3Cpb/mL3aWD8TU4o9JuUXQrUI3cT2lRujefJCJjIyusP6F1IaW4cCbc+G0FAF6PbWAoC4HIW9YFnLozl5B+dbXgAnf/mi7YS8Tkbvcq3JZqisD6JgzavTZS6nTK1inVQGU9tkaqsaO3AeWmuibnpg6a6TK1tgZnOjMShiRFhMQ3tOUd+jv3GXYez1Qventar6PihNseYlpIUaz0xsZyIh6vlSeTMm55J6uhWt11DYGRRdx3OI037QQnf7i0l7qCM43u/uN3xSAffbdE68shaC6U4v4lA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(6862004)(5660300002)(8936002)(83380400001)(41300700001)(4326008)(70586007)(8676002)(2906002)(70206006)(86362001)(82740400003)(36756003)(356005)(81166007)(33656002)(40460700003)(2616005)(186003)(47076005)(6506007)(478600001)(26005)(6512007)(6486002)(316002)(36860700001)(54906003)(6636002)(82310400005)(53546011)(336012)(40480700001)(37006003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 08:14:06.6903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f10aa83-20ad-4a3c-b150-08dab0e0ba0c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9204

Hi,

Gentil ping on this one as it might be a suitable one for 4.17

Cheers
Bertrand

> On 3 Oct 2022, at 15:42, Peter Hoyes <Peter.Hoyes@arm.com> wrote:
>=20
> From: Peter Hoyes <Peter.Hoyes@arm.com>
>=20
> The xendomains script uses the output of `xl list -l` to collect the
> id and name of each domain, which is used in the shutdown logic, amongst
> other purposes.
>=20
> The linked commit added a "domid" field to libxl_domain_create_info.
> This causes the output of `xl list -l` to contain two "domid"s per
> domain, which may not be equal. This in turn causes `xendomains stop` to
> issue two shutdown commands per domain, one of which is to a duplicate
> and/or invalid domid.
>=20
> To work around this, make the LIST_GREP pattern more restrictive for
> domid, so it only detects the domid at the top level and not the domid
> inside c_info.
>=20
> Fixes: 4a3a25678d92 ("libxl: allow creation of domains with a specified
> or random domid")
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> ---
> tools/hotplug/Linux/xendomains.in | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/hotplug/Linux/xendomains.in b/tools/hotplug/Linux/xend=
omains.in
> index 334d244882..70f4129ef4 100644
> --- a/tools/hotplug/Linux/xendomains.in
> +++ b/tools/hotplug/Linux/xendomains.in
> @@ -211,7 +211,7 @@ get_xsdomid()
>     fi
> }
>=20
> -LIST_GREP=3D'(domain\|(domid\|(name\|^    {$\|"name":\|"domid":'
> +LIST_GREP=3D'(domain\|(domid\|(name\|^    {$\|"name":\|^        "domid":=
'
> parseln()
> {
>     if [[ "$1" =3D~ '(domain' ]] || [[ "$1" =3D "{" ]]; then
> --=20
> 2.25.1
>=20


