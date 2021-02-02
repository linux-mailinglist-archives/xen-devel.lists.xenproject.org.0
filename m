Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2721B30C4F9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 17:10:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80628.147593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yFl-0007mD-Ej; Tue, 02 Feb 2021 16:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80628.147593; Tue, 02 Feb 2021 16:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yFl-0007ln-9t; Tue, 02 Feb 2021 16:10:09 +0000
Received: by outflank-mailman (input) for mailman id 80628;
 Tue, 02 Feb 2021 16:10:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g09W=HE=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l6yFj-0007lY-0k
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 16:10:07 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::622])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d80793a4-1e17-4493-93e4-0a231e701cd4;
 Tue, 02 Feb 2021 16:10:04 +0000 (UTC)
Received: from DBBPR09CA0009.eurprd09.prod.outlook.com (2603:10a6:10:c0::21)
 by DB8PR08MB4059.eurprd08.prod.outlook.com (2603:10a6:10:a9::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.23; Tue, 2 Feb
 2021 16:09:29 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::c7) by DBBPR09CA0009.outlook.office365.com
 (2603:10a6:10:c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend
 Transport; Tue, 2 Feb 2021 16:09:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 2 Feb 2021 16:09:28 +0000
Received: ("Tessian outbound 587c3d093005:v71");
 Tue, 02 Feb 2021 16:09:28 +0000
Received: from 8cc60e791e57.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9E5ABAE0-7DDA-48E5-A17C-E22C62C056D7.1; 
 Tue, 02 Feb 2021 16:09:22 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8cc60e791e57.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 02 Feb 2021 16:09:22 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3881.eurprd08.prod.outlook.com (2603:10a6:10:77::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Tue, 2 Feb
 2021 16:09:14 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3805.027; Tue, 2 Feb 2021
 16:09:14 +0000
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
X-Inumbo-ID: d80793a4-1e17-4493-93e4-0a231e701cd4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chfXEkVNIDp0GgWIUFBj6dfTAutsmq0UA7H8E2F9h+c=;
 b=8RoQ5augsiHLWaZxq+bKcSEQZt3GafJsFh1trUwTnvgdRuxkB+96Rqg7L8/d2/C7dVZTRznQ+dwfAgV+4tB7z9atX3tg08v8gPQRPPy9iBrwe+HpT8m3opoCBHynfMb3hqY0uPM7oxZEFzzZpsCpQH8MHKYWw2p826FcrFAhAzI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4eb05e2f95b08285
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gol0c7zjWQ+Cqp6b9zpMlaW4IxvUWyjR4AADNNMMYZfo9IsCJl+PIdZUF37P2nTeCxv3m0CYEXnOGQwXijxkO+jWR+f7OOpGQKAEBcOQTGcGFU7ErV4wvAQxLXRhYuW9MN7oQF+7735nTuB1v16TV0Odn8a6LeKP1Ya4j6tEe6MhQKyJFH4lfq9uuRxrO8cTOFzqGUsOspiONH0vYl6jlnT5bkTc6mxP4NCtpTMjZ+sjVQUZuwcKO32QW0ABfimPYlkKnOJfi/Gp6RsBw3giCP86aDnOP2bcA9dGaEGbvS4NLLWpy2Ef/wKvxRLPHYWNHgYf7EBW3hj/kaknkwu3lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chfXEkVNIDp0GgWIUFBj6dfTAutsmq0UA7H8E2F9h+c=;
 b=UXYUfLUh/cm8asgpk2yP/OorSyXYD7fTQHAeWEVId4WjRcHK7hBsTxLpa4s9DlJ+rOBOBb9OS/YhmQWXRqdqYwnyztQoiTY6q8OH/GzYQ4O9kbA9Ym2u2fy9YN1Q6cwWBnl41d6srcs6jjHFxjPW7+LVnErWqOi4RtbIUsNyeeNfDtBxDhw9fog4/IhZHFvLSx84QqebNoIkdNO1eWSb2QIugKGpB5UT6BIz77atKAgE8Stbi8sPklyfcGjgYydwIApTPNg6Y0IrpqXob6wdFiepwSCs9OPrb1JgE7UA1YD1Rtl5wcDuxTQinOxZ3hjikWCKg4TiS0qU+8ocVfh2Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chfXEkVNIDp0GgWIUFBj6dfTAutsmq0UA7H8E2F9h+c=;
 b=8RoQ5augsiHLWaZxq+bKcSEQZt3GafJsFh1trUwTnvgdRuxkB+96Rqg7L8/d2/C7dVZTRznQ+dwfAgV+4tB7z9atX3tg08v8gPQRPPy9iBrwe+HpT8m3opoCBHynfMb3hqY0uPM7oxZEFzzZpsCpQH8MHKYWw2p826FcrFAhAzI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "brian.woods@xilinx.com"
	<brian.woods@xilinx.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v3 2/3] arm,smmu: restructure code in preparation to new
 bindings support
Thread-Topic: [PATCH v3 2/3] arm,smmu: restructure code in preparation to new
 bindings support
Thread-Index: AQHW9DbzkpN/GsglfUeaXlWwDlkioapFExCA
Date: Tue, 2 Feb 2021 16:09:14 +0000
Message-ID: <36D1F0B5-C811-4A21-97F5-7C233649FEBF@arm.com>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>
 <20210126225836.6017-2-sstabellini@kernel.org>
In-Reply-To: <20210126225836.6017-2-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 034f3d7c-4cb6-4f11-6a0a-08d8c794eb1f
x-ms-traffictypediagnostic: DB7PR08MB3881:|DB8PR08MB4059:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB4059945217E2ABB05B3885CBFCB59@DB8PR08MB4059.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:483;OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Zyacs0LKF2zxe5HBqRtTK8VVmKTGvBWxmkxB/QLTF5zzaFwq/5WHd2pi1UOsNihzmx//y3x1Q9W0uroEVNEDHoa57pzosyJhNOUlzMFTF/RoXYv7zGDLDGmhOg013FzbXd+kYGoIkkmphAT95VMjeoZG3yYi27Ppcv9Z5m+LSHCSP4gas3JxromxxwoKhkYXyJUnZKjtQ2UjefZb3qekmf3BRa3qjeG/0eaynzYcNlfd2wxKxlyrfcNy2XnFRm2MwU6TbWfFZCx5azopPXV/5wdttTLki0EsDFelPUZCM/bZq7gCsmJDgFrevpGtPX07RhjhYjYTEhaLDsZ23ASGRw/fmzzv02RlyRDQkhK+AyBpAW15ePSXOTX+zO7ol6OpUeIgFOj/Tszo9iLBOn9txyWJwkrrTWL2zjoXqaws/4nZxoMT3hfViNfeKAqFDu+h/55wnfMImZeSV902hVAmibF+1Fk/UH1cQSi6lUJltWZ+WiST1qDOHH2md5M5gvjo+HbVGNxeYf7g/YFqrKctWd1BI2XjnRdHQYet9F8JnBlT8nt3MZ0uRatMpKHSMpb0awZ0qFvZaotxyqWcaHetng==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(6486002)(54906003)(6512007)(86362001)(316002)(83380400001)(8936002)(2616005)(4326008)(66446008)(8676002)(36756003)(478600001)(64756008)(76116006)(66556008)(66476007)(66946007)(33656002)(91956017)(186003)(53546011)(5660300002)(6506007)(71200400001)(26005)(2906002)(6916009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?8t/MwcNU7k1Cjm3H0XLHlc6tjfb3UoqgZ5DsYGZi7wOS8EFDE1Kl6mON5c3q?=
 =?us-ascii?Q?rcKFpXOjLCsIM7igMVuCySTrdw9qHnPdv5Nf12tbJ4oNhN8V88d1TNsDsEFO?=
 =?us-ascii?Q?ey/3DUlv6kWh8kqZLCLkect2XyTcf2ACFdEZKNJ7qdKuZqDOonjRfmyOlXRK?=
 =?us-ascii?Q?19yY40CFzgXAAtjGAJCqrul8e51GXIIv9S3HU7YvkFdXGvdZJOAZyz2hIB7G?=
 =?us-ascii?Q?/UYBU/HIzmbRFIfKQZWZnXlf8ljdYjBmYI7b+cSCFRLc/i9A2V5XTPNJQiFZ?=
 =?us-ascii?Q?7LJ2S6sJnB6zLVWDPRPuD6uYwgntgTGOBXqo5ezcFf75748nfjEURA7SS7gM?=
 =?us-ascii?Q?gPP6BQtsa4+9+iTEcHq8IpW2YAjhaMgdXNwdwV3Dps+xyq5PIyDK1hy0OhgJ?=
 =?us-ascii?Q?1GJF7LaQXJxgB5mbEsHN7fnzbkYoHeJTDBsEttr7/SQdFoZpSXec71IIXzvN?=
 =?us-ascii?Q?FLi/mS84D11RJXutNqkaf8AdP+YudOUdFOaFHy42k1dL3opNrHuIbloRdQ6B?=
 =?us-ascii?Q?mNbhwoW8K4PxgmF/jr7cl8WWFEUHddkUSRYnFD2APU3D0N5NZk4A0/WpNWrm?=
 =?us-ascii?Q?J6SKnmHgbOCNz5BS5HSGbdfMQh7vvRzG3w08X3F3X7oJXPnN75sgHUunN6tg?=
 =?us-ascii?Q?+sSRXb+OoHngk/Rdp1Cv9FKCtpNkE14oWlf4B3XlQWkKstkVAzluwYXT8hpx?=
 =?us-ascii?Q?nNT5oL7XhfiRp8uXxUYXxDz/k6v4Aqx6od8HnGbA1ZT++27fixjQ3h2dAk4o?=
 =?us-ascii?Q?iVEg1WeoqBfTcpxOWhiCod228nwva5p/7TjZsz4G2O3DmxSXRurYVTUIxFUP?=
 =?us-ascii?Q?lT3xFbJpLOcZFKwrP7fUJyO0BEXG8sGbcMf6BHJoL6CIdfIOXTpb+aidl5gM?=
 =?us-ascii?Q?E/cT7KB2muMJdKGUSFe0tQ4gbgxJ3RkWRznyzm/HjvPRJpHK3rFHqIc92ir+?=
 =?us-ascii?Q?KVS8s7DD1x3xTN552rNkafZikkHHiE4N2vPdjZm67ctc+hkg3dAdofYN7Z1R?=
 =?us-ascii?Q?KaXY228C0RREem+MyDFXJC+60NjfMWIjk6ivCvt+wL3ReBYwFVFQvSfrFdGv?=
 =?us-ascii?Q?zEp1Nljn?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5118782BC34D1E48A467F807902D895A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3881
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4e019348-6511-488a-b949-08d8c794e293
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b1cQkL85klBuFlQrgEl3jTbCZ83GeRDQ3x7R/CTKYG4nvw30Fl4NpRjP46yrRnGGD7l7CBK4mvOYcTUFYAXH4eblgFfdS/FOCSdYuWWapTwiBYeLUUxVp6ekjQS0uMk3Ck7/Zwtjgh7gxd9vFRynq8/UAWDlEzO2cP86Rb3tJX2C2u4mlUcG0O+bCa/wB1Z1EU35SYzEqT4tmETpfATvfO30/104XPq+kNvdP8W/sDy/YMen4W6/e2EGlyVZ18YtlvRHfeinWoKLf19ARb4oFlZpeNkYo0d6MP9TzukH1VD0Iem01Odsh/3CLMEtCKwSE4t/kgJldzlcgaTpVagTVTQUUXMOnsqt4wN2JbXaNjcNHGJaAwmpdRrHbpcP0vYrV0ot8UXsODU+AB5j3vx3rdzBWKvXINRNGWlm0z5Fb3Vz2NzZgBLl/rDUnHwZAnfNjjqVqQJO0YwgXdnFWw/kIz91MbRGO4Qchu3BZsFeYkHrdvjWBkgGsnz9N1ZWpomvxF3znq+f1SAtCR21SsNiC65YuafEfmoID3Lx8GDDzZvn9kM+APrwELNrvb85cTVFH+TV1UOi21SabtgHXmcdBDAPkHdyMpXRKRmhO89PA/9o4N/e8GTqrkY28UPG5pduw9j9/T9RiCRNQ8RzgTu4xvKVWZ5IA1yIEZHSD6zR1h8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966006)(36840700001)(36756003)(2906002)(82310400003)(6862004)(36860700001)(82740400003)(33656002)(5660300002)(107886003)(86362001)(336012)(83380400001)(8936002)(356005)(26005)(186003)(70206006)(8676002)(478600001)(4326008)(70586007)(47076005)(316002)(6512007)(81166007)(6486002)(54906003)(6506007)(53546011)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 16:09:28.6652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 034f3d7c-4cb6-4f11-6a0a-08d8c794eb1f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4059

Hello Stefano,

> On 26 Jan 2021, at 10:58 pm, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> From: Brian Woods <brian.woods@xilinx.com>
>=20
> Restructure some of the code and add supporting functions for adding
> generic device tree (DT) binding support.  This will allow for using
> current Linux device trees with just modifying the chosen field to
> enable Xen.
>=20
> Signed-off-by: Brian Woods <brian.woods@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> Changes in v3:
> - split patch
> ---
> xen/drivers/passthrough/arm/smmu.c | 60 +++++++++++++++++-------------
> 1 file changed, 35 insertions(+), 25 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough=
/arm/smmu.c
> index 3898d1d737..9687762283 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -782,50 +782,36 @@ static int insert_smmu_master(struct arm_smmu_devic=
e *smmu,
> 	return 0;
> }
>=20
> -static int register_smmu_master(struct arm_smmu_device *smmu,
> -				struct device *dev,
> -				struct of_phandle_args *masterspec)
> +static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
> +					 struct device *dev,
> +					 struct iommu_fwspec *fwspec)
> {
> -	int i, ret =3D 0;
> +	int i;
> 	struct arm_smmu_master *master;
> -	struct iommu_fwspec *fwspec;
> +	struct device_node *dev_node =3D dev_get_dev_node(dev);
>=20
> -	master =3D find_smmu_master(smmu, masterspec->np);
> +	master =3D find_smmu_master(smmu, dev_node);
> 	if (master) {
> 		dev_err(dev,
> 			"rejecting multiple registrations for master device %s\n",
> -			masterspec->np->name);
> +			dev_node->name);
> 		return -EBUSY;
> 	}
>=20
> 	master =3D devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
> 	if (!master)
> 		return -ENOMEM;
> -	master->of_node =3D masterspec->np;
> -
> -	ret =3D iommu_fwspec_init(&master->of_node->dev, smmu->dev);
> -	if (ret) {
> -		kfree(master);
> -		return ret;
> -	}
> -	fwspec =3D dev_iommu_fwspec_get(dev);
> -
> -	/* adding the ids here */
> -	ret =3D iommu_fwspec_add_ids(&masterspec->np->dev,
> -				   masterspec->args,
> -				   masterspec->args_count);
> -	if (ret)
> -		return ret;
> +	master->of_node =3D dev_node;
>=20
> 	/* Xen: Let Xen know that the device is protected by an SMMU */
> -	dt_device_set_protected(masterspec->np);
> +	dt_device_set_protected(dev_node);
>=20
> 	if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH)) {
> 		for (i =3D 0; i < fwspec->num_ids; ++i) {
> -			if (masterspec->args[i] >=3D smmu->num_mapping_groups) {
> +			if (fwspec->ids[i] >=3D smmu->num_mapping_groups) {
> 				dev_err(dev,
> 					"stream ID for master device %s greater than maximum allowed (%d)\n"=
,
> -					masterspec->np->name, smmu->num_mapping_groups);
> +					dev_node->name, smmu->num_mapping_groups);
> 				return -ERANGE;
> 			}
> 		}
> @@ -833,6 +819,30 @@ static int register_smmu_master(struct arm_smmu_devi=
ce *smmu,
> 	return insert_smmu_master(smmu, master);
> }
>=20
> +static int register_smmu_master(struct arm_smmu_device *smmu,
> +				struct device *dev,
> +				struct of_phandle_args *masterspec)
> +{
> +	int ret =3D 0;
> +	struct iommu_fwspec *fwspec;
> +
> +	ret =3D iommu_fwspec_init(&masterspec->np->dev, smmu->dev);
> +	if (ret)
> +		return ret;
> +
> +	fwspec =3D dev_iommu_fwspec_get(&masterspec->np->dev);
> +
> +	ret =3D iommu_fwspec_add_ids(&masterspec->np->dev,
> +				   masterspec->args,
> +				   masterspec->args_count);
> +	if (ret)
> +		return ret;
> +
> +	return arm_smmu_dt_add_device_legacy(smmu,
> +					     &masterspec->np->dev,
> +					     fwspec);
> +}
> +
> static struct arm_smmu_device *find_smmu_for_device(struct device *dev)
> {
> 	struct arm_smmu_device *smmu;
> --=20
> 2.17.1
>=20
>=20


