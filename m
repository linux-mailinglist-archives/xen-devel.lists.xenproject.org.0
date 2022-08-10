Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E0B58EBD6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 14:16:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383590.618782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLkdd-0000pt-AG; Wed, 10 Aug 2022 12:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383590.618782; Wed, 10 Aug 2022 12:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLkdd-0000mF-7N; Wed, 10 Aug 2022 12:16:41 +0000
Received: by outflank-mailman (input) for mailman id 383590;
 Wed, 10 Aug 2022 12:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YHWZ=YO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oLkdb-0000m9-VR
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 12:16:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061.outbound.protection.outlook.com [40.107.21.61])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48f8b0b7-18a6-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 14:16:38 +0200 (CEST)
Received: from DU2PR04CA0046.eurprd04.prod.outlook.com (2603:10a6:10:234::21)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 10 Aug
 2022 12:16:28 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::7c) by DU2PR04CA0046.outlook.office365.com
 (2603:10a6:10:234::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21 via Frontend
 Transport; Wed, 10 Aug 2022 12:16:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Wed, 10 Aug 2022 12:16:28 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Wed, 10 Aug 2022 12:16:28 +0000
Received: from 0104d7232ee6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B88EBAD8-7E53-4FFF-886D-32B09D308476.1; 
 Wed, 10 Aug 2022 12:16:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0104d7232ee6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Aug 2022 12:16:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB6PR0801MB2070.eurprd08.prod.outlook.com (2603:10a6:4:77::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Wed, 10 Aug
 2022 12:16:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 12:16:19 +0000
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
X-Inumbo-ID: 48f8b0b7-18a6-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cD9yxeHYs7DtJiVIbuCIOxZm3xRLhIsCWdziBwWMH3azRjAp0Mz+7ZaDy3Fi16gODRFiVPBqvEU/UKe5caP3qqhG4kFHIstJHpz+6tQMNzXKtvK3kYm1zVllcC5qDO9QL5Hn7M3j17b1oTztqbDdmHFLJhxKqr1cxeoTx+ot6saHb3aReE+j7350Ns3w098z1o8MBeYid0nd1ZcgO7vZuw6E9ZVSMUZJv62NHXlZT0J5NiNOsm58t8v2ov4AJpcOG7/Vgk9X/KnA/sohIFJf9MRKnBvcjw/7iOnIfWJAeVG0NdnQR/8dQzxHZUpu31Q2hECFb2JXPRwQBAtyMWyB8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+8nAjrwJpLnxSnU7MxAlYjalExUSHWjKcIYgXlSkmA=;
 b=GaM+KpxO3W+vB5n8/GFUzembNtqc6ujJouysWGHn9qIWcDYBwn3yQXA5ARS4HaZQNNDj41AyCmSLOI5Y4za+X4jQqlqZyBo3WZww6Auyb+9yIF5RY9bBe3iez13Y4NlcK57FwjfDcH7frmdvFsqKyrxIGvJaxpe/I79bySmwNWjb019BzLlv5u6GCac/t3J26GIbEdO6z6p8mC5g512CEkVyd15GvuEPQmxbdNVmtsUIhG3DlttXlkT2/sov4YmsFGuWvqjbLwH8grcvXh9+xj6McRDTbor8a1R8KAW5LIE9vlG/6nbt1m2ayH1u6NzQ/Ke0R9RY2susi9Xw+r8ZZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+8nAjrwJpLnxSnU7MxAlYjalExUSHWjKcIYgXlSkmA=;
 b=C+kCbT9FsnH7NJtJHJ14KMNLpApfQCtAHICq5fdFWY6Oh8pYjEeFGSke6gX7Nxgygswngse67OgGnCQI41nn1z6ZGDnf8VDHIL9B1f6CgM6NxdgN0QpXX7zu5g/5akuMUK4lyc/eIG81aqZ09NWyLLTIM8PtdLI2YDNYE/0IEW4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0fd2afa16710e9df
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmuNnrnpcljIcgqKlw6NjfIeUluIChueJQgUrT/OLCj1d8DgAFtlUnVwrjUbeEUO4E9uDXmulXgiYz5EolTpa1ry6VJfYLBfF0AAdABwSKsSUH5EzwEB+XlkUXD87pGw63DGHQwbaVk207BsTLbjCBQf2agYISAWVF31/3qJLRSrZLh0Xf0tElExMxCxd+3AhmxR01T0c3d/Ke2xQBxy0ffjvWQjr+DruPKdH8m1neJGBmXQU0WUoojLq6djBPrrF3JSAX/XM22nuJCby25DjrPqB5DHc7vDbxvZWVBT5C0pa+3kF7jd/faqpbb/Jawh10tzrvaPCqeRAu/C/WGUvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+8nAjrwJpLnxSnU7MxAlYjalExUSHWjKcIYgXlSkmA=;
 b=Fj4z5j+Tz4F62V9dwil9NEQ/PwIAVAqBkjUMiGnF00sfmH573fNfYJ5XZbE2wP7Qcc9/1nidUEUC6gDzEEyv4t43lgwnLg2AvbZOzL2V5GNUfP4dWKzLwMKJvdE6+/amZWPZeZYV4Cm6DLzWZ5Z3fLYgVlaHutVKeV7YCPfKDIVRPmo85C/4K0n5wYwMBleYt0MhAR7yD2asPQghzprQFoPFS1VYMJRinyrQe2qm9QWwV3uLNJjyQkhs4RTVf0u6qcFpjy+BNw+KahiRiTJ4gWMplY8d+k5JAZhIRK8vONAJNryBlYisErW12WvRDLS+wq88itykPJ1sYeM4KANa/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+8nAjrwJpLnxSnU7MxAlYjalExUSHWjKcIYgXlSkmA=;
 b=C+kCbT9FsnH7NJtJHJ14KMNLpApfQCtAHICq5fdFWY6Oh8pYjEeFGSke6gX7Nxgygswngse67OgGnCQI41nn1z6ZGDnf8VDHIL9B1f6CgM6NxdgN0QpXX7zu5g/5akuMUK4lyc/eIG81aqZ09NWyLLTIM8PtdLI2YDNYE/0IEW4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "stefanos@amd.com" <stefanos@amd.com>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN v1] xen: arm: Check if timer is enabled for timer irq
Thread-Topic: [XEN v1] xen: arm: Check if timer is enabled for timer irq
Thread-Index: AQHYrKg/Alw9YSR5EEKrOxRi8qogf62oDK2A
Date: Wed, 10 Aug 2022 12:16:19 +0000
Message-ID: <1BBF4AC4-6FE0-4CC9-9188-13DE5281275E@arm.com>
References: <20220810105822.18404-1-ayankuma@amd.com>
In-Reply-To: <20220810105822.18404-1-ayankuma@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a05ddde2-ac2e-401f-f978-08da7aca273f
x-ms-traffictypediagnostic:
	DB6PR0801MB2070:EE_|DBAEUR03FT013:EE_|VI1PR0802MB2288:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nSpzUaemG7qih/Wz5whCI8sBxRCKnLrv5UvAIcs1mBGT6XLqTvwa7FBSZPw4HbrSD4kPW2PS1EJoDUacatMMck0D4LZE/1tMiej7i7BjUpMLKetJEMn8VWQJg1IGk2xUX7zQAFja5NIvox5t4VrNbKwaeTbNVCWOeMT/GyTuRxYhTsMMGEn4KY0+W3EmrO74VMuFn27e3xhgZQ71gBvhn9Bq/HUKlBHXv4v13w0zK18i4XEopkOR7nLmWyD8KAFb6WVi6PiYtGMwurdP9GqSGc3ZDzv5msa70N5WgA4eLCnDYCsbVNs9UhWHjTGKZsaPkGk/8z+XiMOsjkP9hTzTbCDMkITNshQJ8pjfQ1vUTHmLOgXKSSt9iX+MPRAImhUg6P3nxKDRRYDrUfDdOHabsR1kGyishjG1lGi20l8v3595eIs7RP85knuRK9phffqaP4EN/+v95OmaTcbJXuKzNHeKXnmNyAHtlz5MPQt40MdUMndXRLruxM+7MVas0lBVaDKOIh5TqmfNZSDc/nh3CqZ7v4a20sUYPLheQPWdAa9gIMeknm7swEoW3RkrmMPJZLxKKNFBsZwBr6Tfof9QjBFr/kYM68BcXXQoBjSa69KGqYBpZ4fiEolx308eLr55osivXEdsLj4FKim+wYcjKJNDL8SIsAjmYpDdQNl/3iU+nXj8MFu+sOYxT+rpSqxgbPQyiJTc+ZCFToA9Om79cs1VGOrwIJRbGBdo+9xK4ld7BYyJsW92hiZfY+SH2qIfWIzDzogbq+RFJfuFVJFBXMJeGXunvMQU6NQ3tK/wRCtadFBuqV30futoCHQTLFd523TGcX5+nzZu3gKB/BHZH+XpxAO2bvQTC/hAb0oKf+P+JXOGKBHHunsJe1YXS6bM
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(66446008)(53546011)(66556008)(64756008)(66476007)(8676002)(66946007)(4326008)(5660300002)(91956017)(316002)(76116006)(6916009)(2906002)(38100700002)(8936002)(122000001)(38070700005)(86362001)(41300700001)(83380400001)(36756003)(33656002)(6486002)(26005)(71200400001)(478600001)(54906003)(186003)(6512007)(6506007)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A45FA3B69CE48A4E9AD296DB96966490@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2070
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bdc20c9d-1307-40b3-d79b-08da7aca21e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WDHZQvV1ob3L6BDvO7mBk89XTDshgThAOW/EZtg3jJvhevv52proPf3Gp5Xpi/5zS8rlBCnog97a22bJf9YFx88VFMUujR+Woonp2dpeiDrxiIGCuvtu0oyZvMYpoGkij3HRJdzpKJ7nGPX0egFItf3C+1VpABuE2OZFnVYvNgzH0Gs1+YrcWs0i1DKFjs0kN7/XXAxDiODWv8GJiqSRaDHOYcLpuro0c8dHLa4YCOmVJc9XheB5MDh5L3lDhXClSBHv+Y00KtAPOMDZRapc4EqLd2M9/lkKWmv9iR3FzHiadiZqwJxFEmCYuwcgmXijwrXOGPS6+Q079BClVHamrwHk4aHxqnyDO6Pr8HVdRQacCnxkwFYQ8cp42a8+bCIqfqKPZvbK3O38Am0NtxYNNQAq1I69E/BoMhRFXjFDcLLTexJwNd3RrZNBLHrw5JNQkjkBG0F6YrMliR+VRGcUmlHXeR28NrljnH8FBnbFn9hCUezOwPtD/Cim34IQ9a959XRlPu39rp3+FPtyw40hABPz7YVMRGFjinn5y0zehu2WMPQIsTDBwNlMtEneR9DdclRdfmhukWF5c2qY3vxsmM9A+G+jp6M+i9HtDUIhmW7MohhIKS+TOmdr7I3cDzir+hhynl7SYrM/ot+tGgvcbuQ3J8pvFz0cjzAgL66LZHfwmdTSUdTjXrcQ88nIJ56FPZ+72muvU2DSeg26Ff1bzH0NmnSRNSBhA1DZ9bIQwEnnL5KKdvw2646tD+v5qpqY3h39818S1u/n1xGjwbaF+Fq+PWupCaSwkioju9t9AXMd8OKwmwT5KpT0mVC/PpGK
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(376002)(136003)(36840700001)(46966006)(40470700004)(40460700003)(54906003)(316002)(36756003)(47076005)(8936002)(478600001)(6486002)(86362001)(5660300002)(81166007)(356005)(6862004)(2906002)(82310400005)(2616005)(83380400001)(6506007)(41300700001)(53546011)(82740400003)(36860700001)(70206006)(70586007)(8676002)(4326008)(40480700001)(107886003)(186003)(336012)(6512007)(26005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 12:16:28.6676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a05ddde2-ac2e-401f-f978-08da7aca273f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288

Hi Ayan,

> On 10 Aug 2022, at 11:58, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
> Refer "Arm Architecture Registers DDI 0595", AArch32 system registers,
> CNTHP_CTL :- "When the value of the ENABLE bit is 1, ISTATUS indicates
> whether the timer condition is met."
>=20
> Also similar description applies to CNTP_CTL as well.
>=20
> One should always check that the timer is enabled and status is set, to
> determine if the timer interrupt has been generated.
>=20
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
> xen/arch/arm/time.c | 12 ++++++++----
> 1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index dec53b5f7d..f220586c52 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -222,8 +222,13 @@ int reprogram_timer(s_time_t timeout)
> /* Handle the firing timer */
> static void timer_interrupt(int irq, void *dev_id, struct cpu_user_regs *=
regs)
> {
> -    if ( irq =3D=3D (timer_irq[TIMER_HYP_PPI]) &&
> -         READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING )
> +    uint8_t timer_en_mask =3D (CNTx_CTL_PENDING | CNTx_CTL_ENABLE);

This should either be a macro or be added directly into the condition.

But here seeing the rest of the code, I would suggest to create a macro for=
 the
whole condition and use it directly into the ifs as I find that this soluti=
on using
boolean variable is making the code unclear.

May I suggest the following:
#define CNTx_CTL_IS_PENDING(reg) (READ_SYSREG(reg) & (CNTx_CTL_PENDING | CN=
Tx_CTL_ENABLE))

Or in fact just adding CNTx_CTL_ENABLE in the if directly.

> +    bool timer_cond_el2 =3D (READ_SYSREG(CNTHP_CTL_EL2) & timer_en_mask)=
 =3D=3D
> +        timer_en_mask ? true : false;

? True:false is redundant here and not needed.

> +    bool timer_cond_el0 =3D (READ_SYSREG(CNTP_CTL_EL0) & timer_en_mask) =
=3D=3D
> +        timer_en_mask ? true : false;

Same here

> +
> +    if ( irq =3D=3D (timer_irq[TIMER_HYP_PPI]) && timer_cond_el2 )
>     {
>         perfc_incr(hyp_timer_irqs);
>         /* Signal the generic timer code to do its work */
> @@ -232,8 +237,7 @@ static void timer_interrupt(int irq, void *dev_id, st=
ruct cpu_user_regs *regs)
>         WRITE_SYSREG(0, CNTHP_CTL_EL2);
>     }
>=20
> -    if ( irq =3D=3D (timer_irq[TIMER_PHYS_NONSECURE_PPI]) &&
> -         READ_SYSREG(CNTP_CTL_EL0) & CNTx_CTL_PENDING )
> +    if ( irq =3D=3D (timer_irq[TIMER_PHYS_NONSECURE_PPI]) && timer_cond_=
el0 )
>     {
>         perfc_incr(phys_timer_irqs);
>         /* Signal the generic timer code to do its work */
> --=20
> 2.17.1
>=20

Cheers
Bertrand=

