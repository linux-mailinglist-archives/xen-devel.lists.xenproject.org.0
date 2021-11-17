Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37656454624
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 13:07:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226821.392104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJj6-00060R-DV; Wed, 17 Nov 2021 12:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226821.392104; Wed, 17 Nov 2021 12:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJj6-0005xc-9H; Wed, 17 Nov 2021 12:07:44 +0000
Received: by outflank-mailman (input) for mailman id 226821;
 Wed, 17 Nov 2021 12:07:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5X4Q=QE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mnJj4-0005xQ-OX
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 12:07:42 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6bc9d1d-479e-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 13:07:42 +0100 (CET)
Received: from AM8P251CA0006.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::11)
 by PAXPR08MB6494.eurprd08.prod.outlook.com (2603:10a6:102:154::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 17 Nov
 2021 12:07:38 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21b:cafe::ef) by AM8P251CA0006.outlook.office365.com
 (2603:10a6:20b:21b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Wed, 17 Nov 2021 12:07:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Wed, 17 Nov 2021 12:07:37 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Wed, 17 Nov 2021 12:07:37 +0000
Received: from 433a273be1fe.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D36C23F0-F97B-455F-A83A-0E60D4AC7CED.1; 
 Wed, 17 Nov 2021 12:07:26 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 433a273be1fe.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Nov 2021 12:07:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM5PR0801MB2017.eurprd08.prod.outlook.com (2603:10a6:203:42::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.18; Wed, 17 Nov
 2021 12:07:23 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 12:07:22 +0000
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
X-Inumbo-ID: f6bc9d1d-479e-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CspX5/HLzX3A7h9VuLLEr57x1ohmWzgwzH5nJmCNnE=;
 b=b59BWLcn+Pf6UV7AVTrh72mWUMUQfBjj41lnWox75ChQvdeqhIzF9shfGu8vl+7ElejVbnL5jvMPcqpdjbSeHbioAR20ZuiicFoUu9iKVKn1JtqCijzhRzkPOipC46KIm2J5TADh75jpmxuWdgdiuNt7vcYZlkMXYq40+GVhA54=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1dcbc8689deb30ec
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWTtYeXZJENnDXDvelMebshPJv7BCOPd87Z+eBAie577mB8RqZ6DjU5/AtwBpx6RW1+xpp8feDzRTOMNQ4an2KlK6OWUXsBdqVmK2OearJvTt8NZB9mtXV9czA9u59WNYm8rAJlR0Jq/EKvx8xwirDQ0F74wJmVeuIO2CXEwL3GQuFqFkH4Ae2kBPZkEFqXIvyPbIwG09i0CDs1jMdlstoLywfPJbj4Ppi1KCJi/6uAAaopFhaMxWo67QKu2SRKwBEeDZ8FzExTMrI+nVP75uG4zd1isHgZRfyqSTo51RopR3vq/bgqftlYsQ4rxxDFYIfFDskCe+EkxAOhlhUPTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CspX5/HLzX3A7h9VuLLEr57x1ohmWzgwzH5nJmCNnE=;
 b=oAWAssQP8cPz3PIrngX8nikldSqyOlhajkR6DoGIkdsW2tPFyk97lK0LTPtSh0GbO9HPBdNnTCGObSMFafXs82vlvWd6yscuLpWK9r3FgtFiXYaq3fzWiKaZnOF5/cbkHJXKVdlguXBOFaVxOODnHBsOWTyW4mL/uneF6SJtCInR9SMpJ6/3n6YcM2dE3D6qp6w/CAHub2WVKvdZ7iMSk+YlRJ0AV9PheeKkQy5G+zdxsSQ8rBhBDBiyRmi5adBNh++A3AvCX1EF1OcalVmyONr4oORcbrcXSwm9pCfqAA0YFMQobNOoWJjXSi+FO/efQHM/kcxifm3MpExQgHVr8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CspX5/HLzX3A7h9VuLLEr57x1ohmWzgwzH5nJmCNnE=;
 b=b59BWLcn+Pf6UV7AVTrh72mWUMUQfBjj41lnWox75ChQvdeqhIzF9shfGu8vl+7ElejVbnL5jvMPcqpdjbSeHbioAR20ZuiicFoUu9iKVKn1JtqCijzhRzkPOipC46KIm2J5TADh75jpmxuWdgdiuNt7vcYZlkMXYq40+GVhA54=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
Thread-Topic: [RFC PATCH 0/2] Boot time cpupools
Thread-Index: AQHX25mOHH0z58pAdkqC6AziO7R1GqwHg+AAgAAN94CAAAkVgIAABTgA
Date: Wed, 17 Nov 2021 12:07:21 +0000
Message-ID: <1941B2BF-6451-4665-8591-DB14739121A9@arm.com>
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org>
 <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com>
 <d42781c4-b01b-9064-4c90-ff99d960958b@xen.org>
In-Reply-To: <d42781c4-b01b-9064-4c90-ff99d960958b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5b5d7846-f515-44ae-cbcf-08d9a9c2d8f1
x-ms-traffictypediagnostic: AM5PR0801MB2017:|PAXPR08MB6494:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6494837F0AF0DAEC5741246D9D9A9@PAXPR08MB6494.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZdgWgF4hI/EIzc3F4Q+0YlUrM5KE5SNBlxlMVPaurHMFFjGUUFyBQXV5OGaeZNu3p8mTKu32BJToO7+Oi49QhDvGWJp+vmFzlPac0TN9of1s3Ub6TNQ9h4rvxC+BQOy6OA3gHd3I7zLnlRKE1rwtVpBjtb5PO66Jq7USBuIxyET+6tsH/oki2q4Q+k2x8I0X3M3Q6/QlqBGUrjOqNWyex6ouDs9Gj5i45yexDFxf4guS5xZK3Xvtw/FtnfL4R6AGCeIL2c3l7iisavhfxw5FdTb+MkXgx1kRgLklz7woIzjZH8plIt6Vxt5gKE+mbgFmHY5alLU32fHWw9aKRqmxF6yaAQ/W/LDWe/2042qcjV+FBInbjG/vwqky/CUHwXg/5LpMDiFRoJFGUE5QRjUb8FMK2vSkgmayLm3A1hlIeUu+ryTlgzTUDL5+4jDHFkaZIEfw4cRNayZzULlFBc9bAiaL25RORF2CAmuLKLi+dj8/7mPEDY2y3rfRQQuvk4lb/9UwHJBsGwxsrIULmE55JKESvu+e8Dbj3WC+C6QT4eCKfzL5J/HXHcUDNhLCWAObcL3HWnPr6AHvESH0YcTk5Qczjpin5/sb4+1i2/4z1s2EQPLjsIU7T66AOxtNGLrzdfVSGcApHkC218OEQskCmpd/puc3hX1WXTnug14RUAamPF26P7BMsH/4FnAtvAAQgdwFYHQ3gxPABUCHAouNigWFIApAXiZrv9XUw6oSot5PDKbCwO7N1Y6oAXMj29rJ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(316002)(38070700005)(7416002)(6506007)(36756003)(6916009)(91956017)(5660300002)(83380400001)(508600001)(71200400001)(66446008)(66556008)(8936002)(66946007)(6486002)(2616005)(64756008)(66476007)(76116006)(4326008)(8676002)(6512007)(86362001)(54906003)(186003)(26005)(33656002)(38100700002)(122000001)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <729FC93025B2A94AB9730BFDD97B2956@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2017
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c4d6f02-e60e-4e26-5f48-08d9a9c2d008
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OvTXomoax1/ThRemMLwDgjik13Gk5A/x3R3p10Q9QkJ7ItNxkqUXr5HZbi62OKBXpXLxphEyPDidjuldPpXRSddvV6FzMsSwpMQ2znqI62ch2xfBrG+SRRj5NrBWfW1f9ucKg7LB7TmIlsI2dF00Znof2qkfFB0gmgHi7KhlDUX7sN28l5s9nqRXYGb+PHolhlapoLEP/DaHhaLl8wUCIGlYkkfR2KOjDSSdfpZN38N9yz66EACf7kH3BZ4cSjBnO1m5Sg10YyMrYK9a/i8rf9IqHGnkqWww9u5BhC75pPL6xmqsf7zZj8sQ+KTuY4cYpe7vhTvlcDf6ia7SzbEa8X6zUjIuduEMHKplQD7+DP/a7gRQJ+U6Qmi0hBtNtb36h6L0NCDVcML0+lCsdzAeoPj9kJYf/gPpeQzGGQ5TR1Mlp/z/BF0VpFrdbYWVyDbHU3+w3k3rBf2hudZT0yF4Tv5JNsmblrblKTKSaxy6TBdwzeFc6AJ4vaiGrVAKUyB8RY0CZRIhbd1u8KIRJjos3UVNEBjlzHkt82r9ziCCyCejaTR9ED0vVusDSQD/6NvLU9+sbFbEOm4a27ZQUiKcVmGgKH7cYGYDEXp0vceYERsfhgVxFtoEZv71HzXscWLq+Dny6yYQOANo16Ho/fhM9XLUuFUg/J1Rumx7NKAracYcqU3mgPt5+jH+avMqZIsWjlsms6/UQKhLRseC/02TuQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(33656002)(70586007)(336012)(8676002)(508600001)(81166007)(54906003)(53546011)(356005)(316002)(83380400001)(6506007)(2616005)(36860700001)(6512007)(6486002)(8936002)(107886003)(186003)(82310400003)(5660300002)(2906002)(4326008)(6862004)(26005)(47076005)(36756003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 12:07:37.6990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5d7846-f515-44ae-cbcf-08d9a9c2d8f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6494

Hi Julien,

> On 17 Nov 2021, at 11:48, Julien Grall <julien@xen.org> wrote:
>=20
> On 17/11/2021 11:16, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi,
>=20
>>> On 17 Nov 2021, at 10:26, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Luca,
>>>=20
>>> On 17/11/2021 09:57, Luca Fancellu wrote:
>>>> Currently Xen creates a default cpupool0 that contains all the cpu bro=
ught up
>>>> during boot and it assumes that the platform has only one kind of CPU.
>>>> This assumption does not hold on big.LITTLE platform, but putting diff=
erent
>>>> type of CPU in the same cpupool can result in instability and security=
 issues
>>>> for the domains running on the pool.
>>>=20
>>> I agree that you can't move a LITTLE vCPU to a big pCPU. However...
>>>=20
>>>> For this reason this serie introduces an architecture specific way to =
create
>>>> different cpupool at boot time, this is particularly useful on ARM big=
.LITTLE
>>>> platform where there might be the need to have different cpupools for =
each type
>>>> of core, but also systems using NUMA can have different cpu pool for e=
ach node.
>>>=20
>>> ... from my understanding, all the vCPUs of a domain have to be in the =
same cpupool. So with this approach it is not possible:
>>>   1) to have a mix of LITTLE and big vCPUs in the domain
>>>   2) to create a domain spanning across two NUMA nodes
>>>=20
>>> So I think we need to make sure that any solutions we go through will n=
ot prevent us to implement those setups.
>> The point of this patch is to make all cores available without breaking =
the current behaviour of existing system.
>=20
> I might be missing some context here. By breaking current behavior, do yo=
u mean user that may want to add "hmp-unsafe" on the command line?

Right, with hmp-unsafe the behaviour is now the same as without, only extra=
 cores are parked in other cpupools.

So you have a point in fact that behaviour is changed for someone who was u=
sing hmp-unsafe before if this is activated.
The command line argument suggested by Jurgen definitely makes sense here.

We could instead do the following:
- when this is activated in the configuration, boot all cores and park them=
 in different pools (depending on command line argument). Current behaviour=
 not change if other pools are not used (but more cores will be on in xen)
- when hmp-unsafe is on, this feature will be turned of (if activated in co=
nfiguration) and all cores would be added in the same pool.

What do you think ?

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


