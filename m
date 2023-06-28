Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5224E740BEC
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 10:55:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556380.868860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEQxQ-0005nw-7U; Wed, 28 Jun 2023 08:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556380.868860; Wed, 28 Jun 2023 08:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEQxQ-0005m2-4V; Wed, 28 Jun 2023 08:55:24 +0000
Received: by outflank-mailman (input) for mailman id 556380;
 Wed, 28 Jun 2023 08:55:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ay3k=CQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qEQxO-0005lw-D1
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 08:55:22 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 829d372a-1591-11ee-b237-6b7b168915f2;
 Wed, 28 Jun 2023 10:55:20 +0200 (CEST)
Received: from AS9PR05CA0279.eurprd05.prod.outlook.com (2603:10a6:20b:492::11)
 by PAXPR08MB6415.eurprd08.prod.outlook.com (2603:10a6:102:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 08:55:18 +0000
Received: from AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:492:cafe::22) by AS9PR05CA0279.outlook.office365.com
 (2603:10a6:20b:492::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19 via Frontend
 Transport; Wed, 28 Jun 2023 08:55:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT019.mail.protection.outlook.com (100.127.140.245) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.20 via Frontend Transport; Wed, 28 Jun 2023 08:55:17 +0000
Received: ("Tessian outbound 7c913606c6e6:v142");
 Wed, 28 Jun 2023 08:55:17 +0000
Received: from c02235538a2a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 58C4809E-F1C3-4937-8CBE-FFAC97946FA6.1; 
 Wed, 28 Jun 2023 08:55:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c02235538a2a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jun 2023 08:55:10 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GVXPR08MB7847.eurprd08.prod.outlook.com (2603:10a6:150:17::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 08:55:03 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 08:55:03 +0000
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
X-Inumbo-ID: 829d372a-1591-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQMPeHCQEzdChE4PGAl3hjPNfnVenvvJ2WYu4sj4Jkg=;
 b=AOws0X3SKXUPIMOl0E6aZNAYGNEPWGTrT7Ku48aDylIE8P3gpTkDTMwE04+dbGGc5B2DoALDdF3bMaRp+0jqYJgH9cS8qbGFrdTKrq3MfURnvJtqte2leZfztvc0q/yzzjAHkYbnaVoDGTaL4vicbyf6fVQOyxBoaDywTg64Y+4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2cf2b6354553d9d1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFN+xN3BRDl4Zof4B8/8JvnxId3rl2A6S4a0aOwO0GNq2eaEIVZaIAcDn58nW5FTd04DpkAhVbg6qianZFOM1ZyEiilWw/ClhRhyEIHYNCBxl7E/+XqghwRIcErgekMbnZm9B77GL0VHLmJo9leCDc5X80aNSOrJMDkUonQf74xpqz6QPgz57PRdGdy34KYibAQNllA7UAv0G2g/0268hG7r5ZVGrna152eTLrjRvyRJ0Pgw9dR+OgD2W5nk5MO5ceL/aLJbN7vG9p7RIFK94p9FL7Bge1txmFtwxagWZTpUyaurz04ZqA8Q5NRey52iCc0Kj4LTSmQXUbNAY2lnUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQMPeHCQEzdChE4PGAl3hjPNfnVenvvJ2WYu4sj4Jkg=;
 b=cZ88MkIxLw1IrFgrK14CKSsuen+qRldfnfDylU4E+6qVpn5eAlflUTeExPB0uX1LfDNkMyauvk+4+ygnny/ZI0Wf4hkfbtxSh7a8QRAhF2u/69Sl8qYiyqK8YqaF9qMsqB0QiyWemVlDDtda3jkjrHIeaDqhK9xOItzcaOLG5A1Ojz2Bb7YSw/l4zdrUCvWIucsaSAkX5bqdX/zMENJ2L684+6wWYIkxnV6WRq5cyRrLgzVZl54l/ujiz1hfxY9y4c2aX8/+lufB2B/F5yv8xlrPbWXcpr+pOe6+V5H/IyRw8aW+H5XpVgYUP617RSlwpMMGuRivk1Y3AYPvVDQCiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQMPeHCQEzdChE4PGAl3hjPNfnVenvvJ2WYu4sj4Jkg=;
 b=AOws0X3SKXUPIMOl0E6aZNAYGNEPWGTrT7Ku48aDylIE8P3gpTkDTMwE04+dbGGc5B2DoALDdF3bMaRp+0jqYJgH9cS8qbGFrdTKrq3MfURnvJtqte2leZfztvc0q/yzzjAHkYbnaVoDGTaL4vicbyf6fVQOyxBoaDywTg64Y+4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] docs/misra: rules: Remove incorrect deviation guidance
Thread-Topic: [PATCH] docs/misra: rules: Remove incorrect deviation guidance
Thread-Index: AQHZqZv9OVNjtLVRFU+PYttzx4+TS6+f6S8A
Date: Wed, 28 Jun 2023 08:55:03 +0000
Message-ID: <5B96F3AA-804C-4245-83B9-D3DABE02A942@arm.com>
References: <20230628083701.5489-1-michal.orzel@amd.com>
In-Reply-To: <20230628083701.5489-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GVXPR08MB7847:EE_|AM7EUR03FT019:EE_|PAXPR08MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d8e6b6-1b83-4bda-ba98-08db77b5655f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eUWz0CFleTzKBTIfPOPUetn2G+nyxM92yNBxIvkD3sMikY1ID2GduC7zOI+EZJUHqbyJJnqYDgL4N+HV44ZK2+Y5rh9nFi4occUbQ8DiJlSMFCKHdU0dDsOy+H2coE8ElIB2jKlYHn39FJljsOQXgKk1W6OnAgQ5a+yacystK7MEXrsg336IphvoluANI47d7xYTRl+uXBPiB6dlVHfebhzGhcdFLIxbtA20IqKibI+h6Upio2xOc92q9t6cMCa4SwXFQ45ub0QgSTdlbj3OhILe1czHbkZlMwHfHcX9yk/sQpKsIjqt03nIk3nTrj8CmXBBUH89EMoIuF6mZXoX42A0jRvdND+QiewQPXPAT0xjmXZNLWdukecw3jCR1xYZoq6VZl1RjE5Qsp8dn9wYd+Mrdimnsl5E7anXxbJgDWF9pwNzlfe4ne97vlBYbvOs89FoT9ky9LeuXqXsbV8OKF0Nr0c6eR3nYLRMZniZ4B4TilkJcMh2GIFUkav5yYiXYYKnfxO79Pj+tbxXsd8Ld2fGvoBRlm/6yveVTxUJwPyF4sgewLrmWvzwMv6Hu8MUWDr8u+69cCJVXWi0oafF/HkPWEmp6y4z1biGKxyXIrLHyUAfLQaqMWfCj7zTomU4yYdPueoCabG2AyNO4NeVeQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(6506007)(5660300002)(66446008)(33656002)(66556008)(316002)(64756008)(66946007)(36756003)(478600001)(4326008)(6916009)(91956017)(66476007)(76116006)(8676002)(8936002)(86362001)(2906002)(6512007)(26005)(54906003)(41300700001)(6486002)(186003)(38070700005)(122000001)(38100700002)(53546011)(71200400001)(2616005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <221FA021E0F05A4A9B972E0139ECC312@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7847
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b2868dbb-0566-4e3f-8cdd-08db77b55cd6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pwq7h4q8dOq+NRmOSYpRclsSC5pl8uOuRChADqt6nDBA9YvASejFGgMdds6pSET7tQZdZ0vznlCnBWgA6e1Pi/Vg1sFz5ypfzIrHmy2Ck3rvlN2q9WBVh1mTDWDXD3hfofAigPTGe/Jfmz0d5eck1HCPsDW4RcvHC50v4uOEhKQ6NmfPoy9TFM8c8CJjhBxF+hPbf8+4ANolC1CdWGzKD5/zo1UmFOtSfCN+QET1qVM2oyQ35sS/kjyv/dfKwjggXXSs9rqJ9djirlHx8H/SVnxXjO1huYRrR2mYv2VThXF0FyIOcAWzcROd3yGimB0S954+tAYPTH+3idoiMqfx8gxd5CtTkdjsEzYBGWlBqPK8wsGhVXeBAbvgPlfhfM1wh16CUmVUkZwn7iiBXzOox4R/ewEbroS2mEvSgE0hfVsjqpWdV62/PG71YipKyO3khrxDL9HYQsXr5j7S4kJGo601UNq8KLt/q/fWlOXmnYiTuVQIFsCq5BgsnV5uLcCHMO82PMldBpSbY0f7q0KgCkKihsx8jIcIW2HTDe3eTrJwT7iA3Z13qwxH/jjHe1InW2k/QocrDXjSUeZxKMHpmNZ+376PpMpiov3qy7xM4mkFBzutupaCkrRVcnGQ3M2Ek176b/5xC9g11SbDE2vPKH2dweNdxssgDCDG6qdnoif6Dct9YxoYRrLJ85tAsqHeWxMIjfzdo6aqqfLytMrqRtfduagjQtGXE1mZfQZ9pik=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(82310400005)(2906002)(36860700001)(26005)(36756003)(40460700003)(70206006)(356005)(6862004)(33656002)(4326008)(8936002)(8676002)(86362001)(316002)(81166007)(82740400003)(5660300002)(70586007)(40480700001)(41300700001)(6486002)(47076005)(6512007)(186003)(53546011)(6506007)(54906003)(336012)(478600001)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 08:55:17.5990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d8e6b6-1b83-4bda-ba98-08db77b5655f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6415



> On 28 Jun 2023, at 09:37, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> It creates confusion since the new format of documenting violations can
> be found in: docs/misra/documenting-violations.rst.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Wow we missed that! Thanks!

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> docs/misra/rules.rst | 9 ++-------
> 1 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 11b9c42b70e6..6244598665e2 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -17,13 +17,8 @@ hypervisor.
> It is possible that in specific circumstances it is best not to follow a
> rule because it is not possible or because the alternative leads to
> better code quality. Those cases are called "deviations". They are
> -permissible as long as they are documented as an in-code comment using
> -the following format::
> -
> -    /*
> -     * MISRA_DEV: Rule ID
> -     * Justification text.
> -     */
> +permissible as long as they are documented. For details, please refer to
> +docs/misra/documenting-violations.rst
>=20
> Other documentation mechanisms are work-in-progress.
>=20


