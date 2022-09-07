Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D179F5B064B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 16:20:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401866.643829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvuV-0000Rz-Es; Wed, 07 Sep 2022 14:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401866.643829; Wed, 07 Sep 2022 14:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvuV-0000Oh-BI; Wed, 07 Sep 2022 14:20:11 +0000
Received: by outflank-mailman (input) for mailman id 401866;
 Wed, 07 Sep 2022 14:20:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/dp=ZK=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oVvuT-0007uj-Pi
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 14:20:10 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2071.outbound.protection.outlook.com [40.107.105.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d2405b5-2eb8-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 16:20:08 +0200 (CEST)
Received: from AS9PR06CA0638.eurprd06.prod.outlook.com (2603:10a6:20b:46f::32)
 by GVXPR08MB7845.eurprd08.prod.outlook.com (2603:10a6:150:1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 14:20:02 +0000
Received: from AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46f:cafe::c7) by AS9PR06CA0638.outlook.office365.com
 (2603:10a6:20b:46f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 14:20:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT033.mail.protection.outlook.com (100.127.140.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 14:20:01 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Wed, 07 Sep 2022 14:20:01 +0000
Received: from 1881cc794703.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7322573F-9E3D-4831-83C6-E4EB0F506368.1; 
 Wed, 07 Sep 2022 14:19:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1881cc794703.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 14:19:55 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DU0PR08MB9677.eurprd08.prod.outlook.com (2603:10a6:10:447::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 14:19:53 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 14:19:53 +0000
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
X-Inumbo-ID: 2d2405b5-2eb8-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=M8DSte33ztEPXLgGDNS7YUyHTdwFex1Zx0maPW/TqweIjPVP6r874+wnBTXtfpDBdDk+3sMV9BNoa9b41HegGDtpew6iqsLA0Nk6dt3XPMRubYvDIeqocV9xN5yX5/FhFJGO5hDBGkqxszHF+fz3GU9UB8pgvjshdEXyVA9DSsDtb7FP8s6afscNSJEePJazpuyFbMkCIfSNf5EJJxiS+7fefVkuRsD67Hg2T8Tdyin0D5Ray00WiuwvyOcO4Kk9fR4+BFQn0LJZqTs7Rf6vbVwl4PtyS9MiXKa+kMCrdSJMEcapIMIypzNZxGs71wO3SW65ttvf/y6MjBHvqnvPUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/xmVarc3mVjKi/yTFB1/8kMWsZEvWKR3MJPbRbJ9pM=;
 b=UC1N41EUudk3+U46JIL7No6KKnBaCYpQgyLqzmjf7osbKxpqicvQKWsjoGR7BcpYPDwrcgFk9oFHVqzSHOfEd0zr2+scn3S5hieCo8+9QJ0sI+iO7sBCQLuLqWYXrASqee2DfzixChC/41mducfGxRtCyzphUuUVFeqZlcTA1RY1k2Jpe6pwZaXO+dVo1wdFrXpVgXw0yEs2bSctyPbTley1LqO3ej9UG/2aDQCJ/xUXJxM0WVWrOC+EZgnbMI9a+9Zji72cYAEUq/W64UDK/ci4rlrfQOyKzzEfCwpAHdJHesi2wUiYCNXKsxd/NEZmttqF3wB000l/d9vYawz6Qg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/xmVarc3mVjKi/yTFB1/8kMWsZEvWKR3MJPbRbJ9pM=;
 b=fxnrUs7lIvrMsUINBqU/Y6iz+Dsyt0bhJ4ehPuty35jq19rViLxIrV4tT1rEdBjAT/+cVp4EfTWhFVZ9EbBXbBeuI0MRf/lQul8ZfHwFns63Riyzs3Q8wJ7C8AliIAkn6/APxgJ48m71a79+jka+wbfM8VAKEQ1IrNC5ynTKXFg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6da7f19e400647cd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUoxaTRT1LFmW4OlYWLqqpbMD66Mld69Lu5u6AMXOZzRcRcIE3DWVHkbH9uuvk9MpAOTkZ5mqX9jxnlISlyo6nsUCAdimottRq5hG8+OctZqHBlTH+unvMUxuG+mCp5GK9wxGK6v+FgfGPnoORGgIlbAZ9oc4LpHOSmnKPm9sB6M5TAbky6Ze26Miyd6F2agw0oHjG7J7Flwe/+wKZ5fp+8TeR91NIPtM8YSAPPoi8z6V4pfBpyInsbsDYzSYajKTvKgNJJbTqReAmIbWFjVpk1SwE7VsuSu2CmlUUC/jAQ6rb2Uzh4vmEpQmWddJwveUsxbDLtTBHPzdsILEXnvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/xmVarc3mVjKi/yTFB1/8kMWsZEvWKR3MJPbRbJ9pM=;
 b=XZH2cDqqtrM4phXohfDVXUO4Hc5QF9AkkDQS6PtICNvz2ZHOFJlSCq5I/ZvkygQMq7Xa4AIr2v+sAwzlKtObfEOZ1+1IcBV6htsdlb2ZhJMYlpAqpYlHH1LNmOw+NWtMzQNrFv9QV4oixf4PeeT5CC+W2ROm+TmU013goYSPaxlz7fFX1iGVnzj29Ec8BgeCTXS2El1Gay+wa2QRnqbMeucAPz25puWZIU71Q1OxnnUCjm27eqy+QgHxxR1B043PtEg79/+0z3SUYU/PlI4dwSQbvCIK9tFZUDbbesNDvFQnnWWTdXMI+mT0pA176B0l2p7Ia35Y+uQ4R2QcahsZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/xmVarc3mVjKi/yTFB1/8kMWsZEvWKR3MJPbRbJ9pM=;
 b=fxnrUs7lIvrMsUINBqU/Y6iz+Dsyt0bhJ4ehPuty35jq19rViLxIrV4tT1rEdBjAT/+cVp4EfTWhFVZ9EbBXbBeuI0MRf/lQul8ZfHwFns63Riyzs3Q8wJ7C8AliIAkn6/APxgJ48m71a79+jka+wbfM8VAKEQ1IrNC5ynTKXFg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v4 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Thread-Topic: [PATCH v4 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Thread-Index: AQHYwfZ0FAeUK0FPYE2nPRBk38a8ya3T7+AAgAAV/QA=
Date: Wed, 7 Sep 2022 14:19:53 +0000
Message-ID: <0C5BAC50-B288-47CC-93FB-31B03BEBBFFC@arm.com>
References: <cover.1662462034.git.rahul.singh@arm.com>
 <a631af9b5499eb3fab76cae372d623021431347c.1662462034.git.rahul.singh@arm.com>
 <b04c4abf-9c7e-9b39-aafd-ece061a07197@xen.org>
In-Reply-To: <b04c4abf-9c7e-9b39-aafd-ece061a07197@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 80ee0eb5-e6fc-4a87-f2fa-08da90dc0d2f
x-ms-traffictypediagnostic:
	DU0PR08MB9677:EE_|AM7EUR03FT033:EE_|GVXPR08MB7845:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QmkJbSaFr0btTA2ZYUtsFbJDTRbYqRTtBJPcbMreJcFxkZodP6tMYvinvtHzpsXaiOKTGmWJhVUEUsTT51F9Bh2okEtO1SygycKXYSviJVr+kjz+T+KMOjyL0Bq24Vz8zvu53O27wAvGhc0ci+gBcBSMv1w0ax7HjPl+pyLVU3EPYELjm2HJ9CT+KXpH78VXhEi91SJgY/KbZEzOcyeuph886pugXVlv6uLNmo/gjjyxyG8Qb104T4x0q6SKoU/SMrsNzEo6K2mDMQ3TaCXcoGnMk6sd8AgxQDVNlkdrPTwgSQiz0wcnDt+nV7d4s3MdH0jb8b1X74OulkFXJB+8UPDCAYo+c17KTrVrUdI7s9kGWla1R43y1K1EPS2w13nm/0tztZvBG71OnmHUQ15Aila14a+OH36NTdnUyoEYmsTA1YBsriqXEqW1orUy942y40ASIP8rz2ogUXfJqBcBWX6iLMuvoXaSLnxsgoz45sE2RSUiYUadw3zd6I0l6WYMoJkDI+c2x+Vva21rYaSGJSkoqI3MZNJ+EXsGrplAUwXyxgyI5eumaagf8JZ55TaeFqHRcOohuktDIXs/c+/53XljQvZLHGEEJAbilRH24Xc4WJcPc9WbBr7sGrL+c2lV5rzlLqUJOHGE3qJRJr9DA4LhUykD4c15q5u1znyLDlfeRa80BiwV1mnngDZlZCwMQ+7hCiydbp8JTzzmt5nVhaBhK8Yz2OlXRUc9I8APADk5OteBXPjLKpjc8bD5BFurfYrQr3sfncFEpjTSAUO0u8RNHE9c/crJr7Q9oEHRiH4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(38100700002)(478600001)(2616005)(6506007)(2906002)(122000001)(71200400001)(186003)(36756003)(5660300002)(33656002)(6486002)(8936002)(8676002)(6512007)(76116006)(54906003)(86362001)(66446008)(316002)(66476007)(38070700005)(66946007)(91956017)(64756008)(66556008)(4326008)(83380400001)(26005)(6916009)(41300700001)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6D66ACF5B0592246ABCB5218CC544DDF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9677
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6533db66-2aaf-4a8b-ccbe-08da90dc0847
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kW2CLgr5TVg41TYcmyeO3NJeqRy6nvvcTOQndCMeLNvwguGbPbc+ZlLMYqKFZI4eB7Mo+nO5npXQn33Hc6l49RIXs8wz4dG732YdI/uQ7b2J1MRZ7a+e5hb/VjnfTqHWNAWAPwHSogV8ME6mAZTgt574fogM6t14Jvuaa6N5q1GlaIWKg+Mgy2XzCgOlJIkJdiX12p1118cKCDMiTpmFdAAPeg3yNCq2Z7DAWm/wVPtf5z0T3ND+xESWdTKgNQZCU7IsfjX76Nk7jlQrCpHKffVMXa+7rKBZN3h3nBOJz2eDn5QDHzqfpapK0ZRPBnOWpsWH/tqF3VAtwnpjZal+lq1kCu1wVlc7DtNkiK6Elmbd4zNZ1aRiSQQmbOAT1LgAj4lst8laV5KEU1VnkCOrMRD+IRXsjIw74umt4+c351r4wGJVVae3aSeGtO0c183Cm3+g+rFywf+EqBeph5NleO8TJriw3cYMbOF9Ey4SxgEDkfU7iuNH4tx1YbcaeDobSxfIk9IDzARKMOrh6C61rK8eyK+c032XaS7hAr4bKOQrba7LuWXztR5/2nK+QGbYpqgIsKv9xBkllbScn07bZ5Ur1ltMxPGD2LeyaLOqh0uCiUD+oLZbO+KYHkaF0SOSB06kC+t4tXxbr8oi5bBABzssfZl/k3Ddul60yuxjv5wbatbPxZ2IJ+8TaC+Jf3UuBWnCYlsCnMhS+HBSBpz+bSIgEYum/jWIHtTG/99Q28R+9m6/odi3rOT0CRMR8+YvsE2WatcFNmfgWszwNoWmWQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(376002)(396003)(36840700001)(40470700004)(46966006)(6862004)(70586007)(2906002)(4326008)(8676002)(5660300002)(8936002)(33656002)(40480700001)(54906003)(316002)(82310400005)(6486002)(70206006)(36756003)(478600001)(356005)(336012)(26005)(6512007)(6506007)(83380400001)(47076005)(2616005)(81166007)(40460700003)(86362001)(53546011)(186003)(82740400003)(36860700001)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 14:20:01.4172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ee0eb5-e6fc-4a87-f2fa-08da90dc0d2f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7845

Hi Julien,

> On 7 Sep 2022, at 2:01 pm, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 06/09/2022 14:40, Rahul Singh wrote:
>> Restrict the maximum number of evtchn supported for domUs to avoid
>> allocating a large amount of memory in Xen.
>> Set the default value of max_evtchn_port to 1023. The value of 1023
>> should be sufficient for domUs guests because on ARM we don't bind
>=20
> To me, domUs and guests mean the same. So s/guests//

Ack.=20
>=20
>> physical interrupts to event channels. The only use of the evtchn port
>> is inter-domain communications. Another reason why we choose the value
>> of 1023 to follow the default behavior of libxl.
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Changes in v4:
>>  - fix minor comments in commit msg
>>  - Added Michal Reviewed-by
>> Changes in v3:
>>  - added in commit msg why we set the max_evtchn_port value to 1023.
>>  - added the comment in code also why we set the max_evtchn_port to 1023
>>  - remove the define and set the value to 1023 in code directly.
>> Changes in v2:
>>  - new patch in the version
>> ---
>>  xen/arch/arm/domain_build.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 3fd1186b53..fde133cd94 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -3277,7 +3277,13 @@ void __init create_domUs(void)
>>          struct xen_domctl_createdomain d_cfg =3D {
>>              .arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE,
>>              .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>> -            .max_evtchn_port =3D -1,
>> +            /*
>> +             * The default of 1023 should be sufficient for domUs guest=
s
>=20
> To me, domUs and guests mean the same. So s/guests//
>=20
> Same here. With that:
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
>=20
> Cheers,

Ack.=20

Regards,
Rahul

