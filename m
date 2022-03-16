Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD1E4DB7CD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 19:12:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291244.494206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUY8T-0006jb-T4; Wed, 16 Mar 2022 18:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291244.494206; Wed, 16 Mar 2022 18:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUY8T-0006g6-PX; Wed, 16 Mar 2022 18:12:37 +0000
Received: by outflank-mailman (input) for mailman id 291244;
 Wed, 16 Mar 2022 18:12:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GRoA=T3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nUY8S-0005bg-Ap
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 18:12:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a79a01f7-a554-11ec-853c-5f4723681683;
 Wed, 16 Mar 2022 19:12:35 +0100 (CET)
Received: from DB6PR0301CA0099.eurprd03.prod.outlook.com (2603:10a6:6:30::46)
 by AM4PR08MB2659.eurprd08.prod.outlook.com (2603:10a6:205:e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 18:12:32 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::d2) by DB6PR0301CA0099.outlook.office365.com
 (2603:10a6:6:30::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28 via Frontend
 Transport; Wed, 16 Mar 2022 18:12:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Wed, 16 Mar 2022 18:12:32 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Wed, 16 Mar 2022 18:12:32 +0000
Received: from 618860f71bae.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C27574B7-B79F-4E1D-9AE0-45DF6520CA0D.1; 
 Wed, 16 Mar 2022 18:12:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 618860f71bae.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Mar 2022 18:12:25 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM6PR08MB3398.eurprd08.prod.outlook.com (2603:10a6:20b:4e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Wed, 16 Mar
 2022 18:12:20 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5061.029; Wed, 16 Mar 2022
 18:12:20 +0000
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
X-Inumbo-ID: a79a01f7-a554-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHZialGADjbLJ70K07850pUREdwwBrKyAsJHH4pFviY=;
 b=Q0kDgk5bS6Egrkv4IJolsNA/bRvgAbLW8ivJe6dBjdxx7AcA04TJmyi+VOKt+z76i91VSK+7HrhfHoXRZ+kY134Xn0e9ho9iHend1DF/h12tWpXO9wciTKyKSTLf6sWxJ0oWbAvQCvUGFf8oLI7u9wI3LaP8WCiGz3ugMaHLWmw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0aadb15de7744754
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rfg/5zBVEfblMzgacXYYmVLqs4E519mhX7OA4awK5ndru3IXA5mg7ihq1l/eO10M8HgzZOx31Y3s5LW1TOYWMkwNh6mVti2ZgbJZZZuXOq8YD7Ejd3XHbEcZae+DjSCyn3rNhowfu3tm6catSvmHDYWUt/H1Ez9QsEsz6IMYgz6O0pqaUHGmphN72zgcZNklezvLdIZqByCD7VLJKyPSgTlyhWxepsuPIkj5K2gmbWvbJRcE09evxA1eimYI+D+WrVJ18lC0Tn0mgshhxHsAsHrZwiShg4rT1uSjJGOhyUmk1k2T3eBF9Eb36bobqT0T6xdm+G0DSB69zCfB7pk6Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHZialGADjbLJ70K07850pUREdwwBrKyAsJHH4pFviY=;
 b=Qb0ZWB7YDUsEBPXTOswd0/klo0jGJoSPsmZ+Kad+5z566sxkD0z9EyCxyjWlLvnGx6LFaK6Ps4nJE7tjB1kfK6BOzyyxr0kg5POMPM2uY2JZ040DDibDgqlx8sYEbcJFcErZAiWAFhBD8B6JzP2DTKDC8coxigfTXzAnA7JOrUcwxPG3GEYIYrCpiFNFWkPhOrzvwjq7G1vroj1Il7KaTS3Srt8qxxMqNJHdHQsnOEC+9kwu7kvbnRj0z4IOs8Z+GpnIN8dLW5H1zF7Ky1WHa05juV0nhvGgwbKGTKR+rZAoGlahefL3CmslqgC1ZzIY3Oe3yKVCPEayR8m3e0PUzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHZialGADjbLJ70K07850pUREdwwBrKyAsJHH4pFviY=;
 b=Q0kDgk5bS6Egrkv4IJolsNA/bRvgAbLW8ivJe6dBjdxx7AcA04TJmyi+VOKt+z76i91VSK+7HrhfHoXRZ+kY134Xn0e9ho9iHend1DF/h12tWpXO9wciTKyKSTLf6sWxJ0oWbAvQCvUGFf8oLI7u9wI3LaP8WCiGz3ugMaHLWmw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] tools/xenstore: add documentation for new
 set/get-quota commands
Thread-Topic: [PATCH 2/3] tools/xenstore: add documentation for new
 set/get-quota commands
Thread-Index: AQHYOVBw8wvXKdegjkeLoNnCEyRo9KzCUB6A
Date: Wed, 16 Mar 2022 18:12:20 +0000
Message-ID: <8DFD23A1-8445-4187-8F95-A543C27CB07B@arm.com>
References: <20220316161017.3579-1-jgross@suse.com>
 <20220316161017.3579-3-jgross@suse.com>
In-Reply-To: <20220316161017.3579-3-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 26a7796b-62ae-4dd7-102d-08da07788a53
x-ms-traffictypediagnostic:
	AM6PR08MB3398:EE_|DB5EUR03FT019:EE_|AM4PR08MB2659:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB26598A0DDEAFE13626ACDB4EE4119@AM4PR08MB2659.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nN2i51mIb5FWmc6LaT6WDy15R3rDmiCVzElLXiBD39XtPfuk7XCgRhKuj32795PkwhL84L/G1pMbDmachJcB4RW8YI+SVox+3WpeWtLWAK2kqX5lTINgYgBHZtUFue88ogaaPxkXqqoklql1yU2UDUWTT3Hfx18eC08P7hPelrozFi7b9xZNkI6jF+IZ/SU9SjJclmSEipOSXS3dgt2kWKBu1Lz+jKnlCwWb+hHq0AnS2zQD6GM5UE2qa3dZXOuGfRiuq98bGBy2bIuNk65jmv8nj6NgL6fGt/aCGABQJ1wmT64PCB4QxvY2ZODHj44KGjKvq7biMlzpeLcUCvdLqas2+B9T2VjjyIpmvha3CgPo7z1lF6hEsIxtqygqgLZUW0g/rf5eG4pMiqKnDQ36/3cTEpLfcRtxbLThw1v+dUvLVsQuvc8ycSiqwLKs1PIoc8cIQUiuyQvBR+XXcqkzv1niVOKxHvW6jD8uPlxgC8OCvl3+67DvsXZ3OjPmW/MWOjdcULTqnac78fc+FW3r7RlUZxXnzAFeAxLbpcLVlixObFk6LtZKF0kfr29QC8E/TDXv8tW2K62qcEnERBI65fSVfDJAvCQPaCxwr1hhP3/fmdNsJnwLVqwmSg/sC2CDsmEYcFeOZLErfVzAdCbHburldsZgkp+M442lxWpmeu5/nVQ2eRaOjm8otHyupiXiWXnqMgOphH0nEK3hf6aIgFU9nrXTw98ovP40oUrROvFHqPTIZCzDAXST1MCm3sdy
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(15650500001)(4326008)(8936002)(71200400001)(5660300002)(6916009)(54906003)(66446008)(8676002)(64756008)(6486002)(508600001)(316002)(66946007)(66476007)(66556008)(76116006)(26005)(38100700002)(91956017)(38070700005)(83380400001)(33656002)(86362001)(2906002)(6512007)(6506007)(36756003)(53546011)(186003)(122000001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A3678B76DF88AD4F8EA3EA846EBCE8D4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3398
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0e9d85b8-5980-4ce0-cd5b-08da07788317
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/YFjBhcb28GGBcbC0dIqq8n2fYNnzQ2V+kJnHxk1FhKDjGxjI5FCcr+N4St6BLCDBZrEoA/Eu962zpP/DEE4e4x6+kuyn4bAPXwwpFPbGVultXdzoArK7qnPhajQ4TSG7gxVd4hJTswcs1go4zfq2MOJljzmvgmlpY4Ae/7HjVQwPpw2l7RHiqKSCzNoEwLETuAc6/qiTQbbnhCADlubYsSasUq5qZwwHOvTwI2x113LMX90eTwS27GvHZk7nIga8XcmnFndqZswQGwj+OztiS55sLZZxF1bf3UQ3JoLDSiD2YP8yzdThyaHSHej0xMvFm4ID/uSS+/3Z4zAaVemqhWnVAAhMLHB6naCRdQA/u1JEiiWoQ4T201+VM8j6lsVStGRxsxyTblgBIztUWZap1auUrV0SajSRkv9R3bAXB3TPWkoMD2U8B+EmUCSFjAw/6i9O1qWJ/BkJq1S9IXkM5ZKsYV78dWtlyC4t1ii+9+a7C98rLq/FDl+IJ+13sR8Xgj8mWL2sgDa6qaphwDFoCwIxuiLh1clVkofMchEvMaJ/SWaAlru7ncxODgIq1ORDUzwH5TYL6tNX90lK4T5lQ41kpMd+wI1UITYv+TuPZCC/SNwoQZIPAQCTtKpL3FG88JlhB7rCQan7qQUWFf0jzTnCxODf+aF09cFGi58nHL7uMURnLIlEZsjaKaA4hbK
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(86362001)(33656002)(8936002)(2906002)(82310400004)(356005)(81166007)(186003)(40460700003)(54906003)(6512007)(316002)(2616005)(26005)(336012)(508600001)(53546011)(6486002)(6506007)(70206006)(70586007)(6862004)(8676002)(4326008)(83380400001)(47076005)(5660300002)(36860700001)(36756003)(15650500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 18:12:32.4515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a7796b-62ae-4dd7-102d-08da07788a53
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2659



> On 16 Mar 2022, at 16:10, Juergen Gross <jgross@suse.com> wrote:
>=20
> Add documentation for two new Xenstore wire commands SET_QUOTA and
> GET_QUOTA used to set or query the Xenstore quota of a given domain.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca

> ---
> docs/misc/xenstore-ring.txt |  1 +
> docs/misc/xenstore.txt      | 12 ++++++++++++
> 2 files changed, 13 insertions(+)
>=20
> diff --git a/docs/misc/xenstore-ring.txt b/docs/misc/xenstore-ring.txt
> index bd000f694e..0cb72a3e35 100644
> --- a/docs/misc/xenstore-ring.txt
> +++ b/docs/misc/xenstore-ring.txt
> @@ -69,6 +69,7 @@ Mask    Description
> 1       Ring reconnection (see the ring reconnection feature below)
> 2       Connection error indicator (see connection error feature below)
> 4       GET_FEATURE and SET_FEATURE Xenstore wire commands are available
> +8       GET_QUOTA and SET_QUOTA Xenstore wire commands are available
>=20
> The "Connection state" field is used to request a ring close and reconnec=
t.
> The "Connection state" field only contains valid data if the server has
> diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
> index 31e3d53c52..dd75a81328 100644
> --- a/docs/misc/xenstore.txt
> +++ b/docs/misc/xenstore.txt
> @@ -344,6 +344,18 @@ SET_FEATURE		<domid>|<value>|
> 	xenstored prevents the use of GET_FEATURE and SET_FEATURE other
> 	than by dom0.
>=20
> +GET_QUOTA		<domid>|<quota>|	<value>|
> +SET_QUOTA		<domid>|<quota>|<value>|
> +	Returns or sets a quota value for the domain being specified by
> +	<domid>. <quota> is one of "nodes", "watches", "transactions",
> +	"node-size" or "permissions". <value> is a decimal number
> +	specifying the quota value, with "0" having the special meaning
> +	of quota checks being disabled. The initial quota settings for
> +	a domain are the global ones of Xenstore.
> +
> +	xenstored prevents the use of GET_QUOTA and SET_QUOTA other
> +	than by dom0.
> +
> ---------- Miscellaneous ----------
>=20
> CONTROL			<command>|[<parameters>|]
> --=20
> 2.34.1
>=20
>=20


