Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B47D56B3B3
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 09:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363255.593713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9ibq-00046q-MF; Fri, 08 Jul 2022 07:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363255.593713; Fri, 08 Jul 2022 07:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9ibq-000443-I6; Fri, 08 Jul 2022 07:41:06 +0000
Received: by outflank-mailman (input) for mailman id 363255;
 Fri, 08 Jul 2022 07:41:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ITNJ=XN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o9ibp-00043x-3x
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 07:41:05 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130087.outbound.protection.outlook.com [40.107.13.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51be8336-fe91-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 09:41:04 +0200 (CEST)
Received: from DU2PR04CA0263.eurprd04.prod.outlook.com (2603:10a6:10:28e::28)
 by AM6PR08MB4150.eurprd08.prod.outlook.com (2603:10a6:20b:ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Fri, 8 Jul
 2022 07:40:49 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::8f) by DU2PR04CA0263.outlook.office365.com
 (2603:10a6:10:28e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Fri, 8 Jul 2022 07:40:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 07:40:49 +0000
Received: ("Tessian outbound f9f15f9daab2:v122");
 Fri, 08 Jul 2022 07:40:49 +0000
Received: from 6f50755b52d6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 17C2420E-80C8-4F8C-8716-96B49290F4B7.1; 
 Fri, 08 Jul 2022 07:40:44 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6f50755b52d6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 07:40:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB7196.eurprd08.prod.outlook.com (2603:10a6:10:2cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 07:40:42 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Fri, 8 Jul 2022
 07:40:42 +0000
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
X-Inumbo-ID: 51be8336-fe91-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mWegoal3VtOB0JQjwJjOM/kBY9z51L4WtV6PxKOf44Ualg1p5jINTKvh5I2inmNaHvdcx32KPsXXcaSRtCrC935hX4tDVu/xfkhhjNHP2PzpxKKQhPLn2ZtkFDUOhsxZLtUC43ApLQnrgwENoxUsc4Hk8yv3k/es43PA2YOsYKsIIW/ribFsMfY29oRfsy37OQVb8Hd+Hwj4OQTpzaWe1BlIV7Q5ubUh4QYnbUKZZ0dSO35DJpETulAka1WzEmeHTy34z7vbq90TTOHLawW8XkN2dEgGDfzkP+1p4n3IHMA7c9VxLh8icy8rIE4ViIPXHuSQcd02tF/2UsxLRCPUYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5LvHjbpKbK4+MIQBatnJtmWrxqbXbvqYHq1uBYvzA0=;
 b=baG1Znsb6JKDiW6oD/9QmzH2aBz0H06TitKNhnoSCM2Qsy960lupIOxlm3kYo64+mFjNkydnHCKb55IMSy77vNp3zDLdiH+7Ab3goBJHEZxh2xgLHLVgS50sR5+QV2t8xDFE70jpOila975GlzsUyOv2v5qqFiw0ULAP8bE461wmcuWvOU72RAmum9SBOOnXcBRxLBPdUMQZHIgmmbUcO0cK9mZfXXwrWMv/w5vY3vGnN/FcLvy6WhlwljhbFZsAKfoH/c62Yd21/Kq65wVJUzoFUTWfsSc1mWo7AW8+DZUOYl4lxf0Sslc+r3g/22ILYkjfXVVlm6CsutBg3RnSSQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5LvHjbpKbK4+MIQBatnJtmWrxqbXbvqYHq1uBYvzA0=;
 b=PKL69cmyTv/SL3oQAPTmEUc/is0iHCv/qv8dv8+xi4CKmJ832jBAV9rzmHQjz0im/h8wXKnQ8L8egeLTusELfy/jn1vgk/2i0tpjgRQpxLq4H5e7C1fg/dIvuZv76npd0vzSlDrWLN2j5LByC+BlbVCH2ftP275Jsca+qwjO1Cw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkqLZlVJqbRgnRbSCnZVgFDHyTLJacbpR4wLR21xfFNjCOz/S+PPZ2GE/EFSmpPIm4o2x5MVNYJtYibxsgfPfaADFVr5kvzBPhcJKZe+ZRBsNtk/V9igKK7bof93zfDChfEO+Fq7//spUPkRkdUYMHv/32znf59D7iMnwoZJ21EMa0Xna4mmhBQnmdj6eniec3snThnslONTkjI9xjHWnO6LZ5yqZN8cUyq2hCkoSHleafo/aq+JJuasn9tQt/69u4l4lFOljK0HJQ72F5GPHryiBUZbr4iChOujP0R6sE3EfAUqqr/H4x+H5tuRBvCz2nX0u/GXte0PY9Isrp/6+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5LvHjbpKbK4+MIQBatnJtmWrxqbXbvqYHq1uBYvzA0=;
 b=Q8zJM8hiTUxriKJIaZ07PQaWObsQRT1vZUZj+ZvOsSWtBwCZBbG9KVB1xIlyp0PjDCmFzqnnB5D9eqVsUYCibNgnjg2KSzK1BiCa81s40EWteeeIPDiMl9Lm9rJ9uWB+knppNq+6qx3Deu669DvnnjWjLIdcQz2c5PGfJTe4dMkqTkph88TIvVMNZ0VDPQ5VoACrAlYmdAznGdY7Y2uCqLLW5DFztOB6kdLWZ9X0Yu7A0jd2SR+nyrvwBCWmWcd6VxKsjCF5hF66jlvGcx79ckCmptTnj6WcirLCaidXzWdVrrx3yG+6X6Bd8R+ecxAPYcmQXzOO4g+KY5QRZlumTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5LvHjbpKbK4+MIQBatnJtmWrxqbXbvqYHq1uBYvzA0=;
 b=PKL69cmyTv/SL3oQAPTmEUc/is0iHCv/qv8dv8+xi4CKmJ832jBAV9rzmHQjz0im/h8wXKnQ8L8egeLTusELfy/jn1vgk/2i0tpjgRQpxLq4H5e7C1fg/dIvuZv76npd0vzSlDrWLN2j5LByC+BlbVCH2ftP275Jsca+qwjO1Cw=
From: Henry Wang <Henry.Wang@arm.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: RE: [PATCH] docs: add reference to release cycle discussion
Thread-Topic: [PATCH] docs: add reference to release cycle discussion
Thread-Index: AQHYkoEIOS7CuvPhdEyG1tvW/wWt5610FaPw
Date: Fri, 8 Jul 2022 07:40:42 +0000
Message-ID:
 <AS8PR08MB79914FCF057B2DF89A855B4392829@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220708041258.10349-1-jgross@suse.com>
In-Reply-To: <20220708041258.10349-1-jgross@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 87E54EDBFF3D4C40B2407414B6DBC951.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e992dcdc-ea2b-40c1-d3a8-08da60b52d87
x-ms-traffictypediagnostic:
	DB9PR08MB7196:EE_|DBAEUR03FT049:EE_|AM6PR08MB4150:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 htPJhBScpMdpkk6EVye9S+lPfc/Ds3aO/Ogv7A3QS9HPvJP6lFlK6rprbDMcqWp0Sz6h87+2Q2lImg2imKDennDjTMaiMIYDBqdpd+1uR9V0mFgxWnTW/BwOx9ALp922DIom1vkWQ/xX054U2lS5ke3G1a4VEIF1ZnB891c///2vH6LggaEa5kaPQWPZho/wQuvIk8+dLkMPtv9IhqI5T5MJYGy6crMumMOhKcTTOK/VCMkq0QqgL8DFZ2sX7YMmuCXkaFZzCVMmEjuB6zSBLm9lt4SMnKkqz8piLcDfqU2sEu6IH4AUorPWizZT/jQagJTa5ikx/+LD4Dxs1y6buFgvByqolFvkkOjBUpMU0D98PYEqnyq54nO3GaBgw20DSUnqUMdH5Q8Qmv2pQVwiNPC6m1w3x05OI9GssNMOZBk/fIOnW028lzZbCYmFUEPxcoSWwiOxQ7cYA0SBlBskVvolAkPRJsfZz4bXd+Yd8m0j/FoXC2zm/p+TrfczwRIZ8KOTHKRaDmUMoKMqjrwJowLR9GTWXLmnfOep3VrVxbQIUjTE398x8FPCCKye1M0oedFjPKktFuvDPoWJe/hDwfa+KT7orTRKlyQnmYnoA4ebADlD8KwzkY+KPyGS9KWBDDaDOVzD+CFLm8zKJGZ1eczgBY6w0G9cyAcRW9O4B3z18LZZmJUgab8n00ZO9P7yPZkVPJ0OzVsAcCalfDTVueJCo4yht022rH1ww+kup6cu6mOXZcI0F/zuPV8y/Rvt6NwmZkK/VDPExVjfu07+Z9hBNr1fwjdFFtuGX1Ad7ZAp6DkJrw2BRN65n/ila/5HDhyFtnjoY1/xzgv1mUNQ9TkKvrt9K0mR3PKiZ+Eq32Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(38070700005)(8936002)(5660300002)(4744005)(38100700002)(52536014)(45080400002)(316002)(122000001)(110136005)(54906003)(9686003)(26005)(478600001)(186003)(71200400001)(966005)(7696005)(6506007)(41300700001)(33656002)(66446008)(4326008)(66556008)(66476007)(83380400001)(76116006)(8676002)(2906002)(86362001)(55016003)(64756008)(66946007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7196
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	09bd9a99-2a8c-40ca-2ffc-08da60b52963
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xB1Bz9kZOcSvGzy/yDCpg1f4TgjcrHk8ne0vc6dbN+xSYrNG2x96W2tK8/08K/TNn8tf8vdIIHFjeVLTr3L9mXSown9ryEA9ACHVuTIAaUl/U35U92bBiOGR5ZkQAS70Y3djnh/rIeFFfzcMgqpfhDpw26fCXojUbIe46oGLXqEO6bOHHDTLu9a73LGYBNZZzb6jY8Zc2GZLOoVtjAitbamZkWdDNOlRdRjnnJknWHuiWuME8zNE9ltQNPsLSVG6t/dHJojGhgJnRQuS8SliKsD9VEsRQuXyz03NgSkfyBVUNhyGlFep/bBU3h/NT35CI7xrxxaVz9KnX+aZ1jC4xwIRbz/wvmrA4fs8JbZ7j2EAW2+hbvNTPV5nfm0GE12/0Nz5uHujnJwNRUPothpxupTX2bm7eQF1wtZz+L+VaXIlGYpnyXeCZu2MF5g8+KkyK+Fcy++gL2KnW6rkTxdSUhdMg8OgRPNVEinA6l2YBNGA8DO6E4I24LfONMGd4lWZzfzXyMn3G4RPmHHk5XCW7o7I30vcd7M/4SVWioLq9mN6ugrRfDDrNZOIfoJMDkZ3X8IntctRol5JmmMIsiRrEhp/dTW/VZ8TqKxJgxslue0Y2A8kG9SbYzSLxS3lRL0LFvA1jgSxUcXfFqOWo56zyzFm7lVda9xHhvxC+EuGKz9DpxUF0JZiCu8NXG4NeNgyuhBD+clF10yyTnqsshpYvzenSgJcx8tIfUKWo7sHPgtWC2w5Nh1lmWw8oD9T6VZTwAKVws1I9S9kQbvs0yRvtciOI9jdNHQNBy05dkqznd6ks2/rj25670TYMVqSKWHVkRfLMVi3bG1jDrJSCxUURutnbouXylolv+RLlhOg/Rw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(346002)(136003)(46966006)(40470700004)(36840700001)(478600001)(55016003)(7696005)(81166007)(36860700001)(33656002)(70206006)(8936002)(6506007)(83380400001)(2906002)(8676002)(5660300002)(82740400003)(4744005)(40480700001)(4326008)(70586007)(356005)(316002)(26005)(41300700001)(186003)(110136005)(40460700003)(47076005)(82310400005)(966005)(9686003)(52536014)(336012)(54906003)(86362001)(45080400002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 07:40:49.5569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e992dcdc-ea2b-40c1-d3a8-08da60b52d87
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4150

Hi Juergen,

> -----Original Message-----
> Subject: [PATCH] docs: add reference to release cycle discussion
>=20
> As it is coming up basically every release cycle of Xen, add a
> reference to the discussion why the current release scheme has been
> selected in the release management documentation.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>

Thanks very much for this information and the change.

Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Acked-by: Henry Wang <Henry.Wang@arm.com>

Also btw, I have posted a proposal for the Xen 4.17 release [1],
we can start the discussion there.

[1] https://lore.kernel.org/xen-devel/AS8PR08MB7991145C8063D6939AFFED8F9282=
9@AS8PR08MB7991.eurprd08.prod.outlook.com/

Kind regards,
Henry


