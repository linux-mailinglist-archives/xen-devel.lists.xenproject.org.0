Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C0B70F05E
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 10:14:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538830.839108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jcq-0006sN-87; Wed, 24 May 2023 08:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538830.839108; Wed, 24 May 2023 08:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jcq-0006pk-5Q; Wed, 24 May 2023 08:13:40 +0000
Received: by outflank-mailman (input) for mailman id 538830;
 Wed, 24 May 2023 08:13:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5KZ=BN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1jco-0006p3-Lt
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 08:13:38 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e177a745-fa0a-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 10:13:36 +0200 (CEST)
Received: from DUZPR01CA0346.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::29) by GV1PR08MB7940.eurprd08.prod.outlook.com
 (2603:10a6:150:9f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 08:13:33 +0000
Received: from DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b8:cafe::d7) by DUZPR01CA0346.outlook.office365.com
 (2603:10a6:10:4b8::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 08:13:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT004.mail.protection.outlook.com (100.127.142.103) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 08:13:32 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Wed, 24 May 2023 08:13:32 +0000
Received: from 4e06a1b77e5f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 154FE8B2-93BD-4539-91DF-229DA2FCD565.1; 
 Wed, 24 May 2023 08:13:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4e06a1b77e5f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 08:13:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB9708.eurprd08.prod.outlook.com (2603:10a6:10:460::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 08:13:23 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 08:13:23 +0000
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
X-Inumbo-ID: e177a745-fa0a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jE+3IFOIGu7z7+DJWr7+RUgt8xxDUyDgAXMrkJnU1XY=;
 b=C16jrQb2yBw2Z++0wNTS464W1svppxjmmVhBszWShYhqrSIw45nx7IgWGoDKsVT4fzrxDZaIZO18pZNyaAIk27/uGUQucXRRER0RlryUT5TPXlB1d+vLIF4BRcZwv1opiAxbYhs8JwB0raXPaxWOU3X/Xq0PAnAhT4qrooMPYI8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0bdcf7060ca90c2d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4GiBu3HkUu6m//6PZfP7FXbMp3HJkvMa29DW1tJv2rsemKu/Jq4U3N0bX3AE7PPFMj1bK5XMZrsCwzViJixGTf8qePhAZ8a1BLGO7+wi5o7iZOQnjCIYX3jGYoVGlJZvGLCdoJLopFiUTwhoqJ2zm5H5fxvQUwyemKMmS0mOejpmGm4kiUZ2oHarnNmfT4FDqwJsGCDdkX51bWQFMDcmC9fe51AIMgL/Ke5+CLZACUaArZ9F6Bv2mWmd3VBw330to1/m+fV1/6379mjVomsjc/99WKRsc6WDbcDtzlcQmVdMonTqZuJF/ltttRj/cd4GkvUvh1tLnLssZJjaCb0pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jE+3IFOIGu7z7+DJWr7+RUgt8xxDUyDgAXMrkJnU1XY=;
 b=jLyvrHLYIZxRlsGxE3ho5bqmktF5EgUe3nxICX0bzYAL8b/lpqWV+Lydv4aIL5klwpMEMUcd3oOLDF4yo98AHD+hwdrjRkVi3gisQQXQppez0JPczNe6r16KCIWAz591/pR3x95RjncsYSe+9iJAxCS5ndHYnyn+prco8hzUhqhhDpBikmARSvr5naxUk+l8w0p/HM8qYR0DtHMmsVu1g6FV99JtX31Q3kiUg4+U5yMWG6AS+bGXOXWLOPbRWM9sobSU/T+R8vvyJpjJ3RlFOZrztiUt+Fw/RdEMZFocE4FCtjf93e2iyxvJOaZdKJYhJyyo0EQSt5Rz+oPnvnq39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jE+3IFOIGu7z7+DJWr7+RUgt8xxDUyDgAXMrkJnU1XY=;
 b=C16jrQb2yBw2Z++0wNTS464W1svppxjmmVhBszWShYhqrSIw45nx7IgWGoDKsVT4fzrxDZaIZO18pZNyaAIk27/uGUQucXRRER0RlryUT5TPXlB1d+vLIF4BRcZwv1opiAxbYhs8JwB0raXPaxWOU3X/Xq0PAnAhT4qrooMPYI8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 08/15] build: use $(filechk, ) for all
 compat/.xlat/%.lst
Thread-Topic: [XEN PATCH 08/15] build: use $(filechk, ) for all
 compat/.xlat/%.lst
Thread-Index: AQHZjZUbjxSqGdWpCESp84pzrS3Y8a9pE/8A
Date: Wed, 24 May 2023 08:13:23 +0000
Message-ID: <375E8DDB-2B3B-40DF-9BA4-17FAA90EEE8A@arm.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-9-anthony.perard@citrix.com>
In-Reply-To: <20230523163811.30792-9-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB9708:EE_|DBAEUR03FT004:EE_|GV1PR08MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f04230-e682-4cd2-c065-08db5c2ec3e5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XP0GFFZIVivI22sEpxzQbvX95D9xiEiMHqpdZN2a1aVlgkmSDL3W8u1FhE02W/b6Di+FtlvhoQ8OGxVMYXlNmLvaonwoAhjy5+HHToRuGCibnkcAuOULs8Ike/y5yTjQ/ZADhNf/Njgo44fS81yvPL18ELadetarxQfYKuD2nOv4KLwbK8ZnSH2Qa3wilXKVqpJ+PEOhwzkm5CaNziJmcMHrN5Pb2Z51QhdCw0SODSR3Bhc2qsliFaw+6nTnsHPqpjjT1WuDzFTWxcjPEE6trgip04kbdAa+xpg3g/f3bbqkDstmUpuZkPwaXxwQQUT0ZbmtQvOY/at7nhwbd9oAbAEezaJxmz2p4ADhkjUDH44g/gMj2P8O4qmGiF8/n+KfrzLHPZAz8tmkXGKiDA8G/d0alBFocotNDYsv8pbM8L/+mlRTG1RiGDr+ikfYdMhvcQDu9zct7EhoTktKyC71aM7vTDXFvsGnWmNtbejq+ecGwBHopdPV6QIlkE8FAbwYszoA4UnudLPUBzL3BYgUygmN1kysFT+TTWagnpbvX2K5l8ukeBBvAsQ5wGu22Tv4/soQn1IpvKU9l1JNKtcFzsfpsJNkqR8DD9G7na5wvX/xTiKwtLC4OLSYp5Xa/MHZfM1ZmVtCA3V3Ze+lU2tbKQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199021)(91956017)(76116006)(478600001)(38070700005)(6916009)(66556008)(66946007)(66446008)(66476007)(64756008)(4326008)(38100700002)(122000001)(54906003)(71200400001)(316002)(2616005)(41300700001)(6486002)(86362001)(5660300002)(4744005)(2906002)(8676002)(8936002)(26005)(6512007)(6506007)(53546011)(36756003)(186003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <46B6CA87FFEFBF4BB7D8DFA49187EBE5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9708
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0ee1c729-e917-4d58-2f73-08db5c2ebe30
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wh1L27HK23WwKIAnggXHmupcwCmt3utPK5/dm2b/FdguzwIJ6yQhUOW2IKwbeYmH/7+CpXSyvRE41QHpcJGsQv8uVZK1THRkjahFM5fgYcQzZK9ytikBmGBzhd7o72Stjh2YEt7yvX2iObk8VmZ6Eh32zjJxiv8eX3l38DVIVh9ai3SSUxQvTUY5bmIqYWXmLljIbdRZdzpEVNV2y86vWfqC2L27G2gv3lfwvJzp5by83XTSMFTeHU1pX/cXtuwZQ795A2HfUcP21tK3yUbSIinF53/EKnZbPnd6ZbXti+5mqFRJhVYoqmPpI7Z6qVURc/CEWgmE3KMhQQI/XSpB0LsIl8Xm53XW//chs/eIT+6T2lZl+DqBwj6Hrxe8VmgzPJWIWk9dZT4YxdPCf1uus+y4iSNOUwO/q+0qQHorK8aD+wB/4SnW0mXo/v9ZHzAfyEUuJ28YOwk98sR2bSyVH0DsjwIdxDuw8/OkXcB9B2mZKgygWAEcUjXJ3qM38ui3qaplrqDSCojDx3NtzLRvvjA3ZAPn1gBNRtk9CZPEUSJM8Lxz1yNlcqwAXodage1zVHmtk6voX8DSIz8y94ceyqOg9T2stVnTMZ40DcZvVdGWolBYY37zFNt5sIlartBkjl7q7SjtIGeUrCRjWCmTKli3HCjsZyMrrRPLCNmHfJCYnp3KRKXMGYJ5ZEaJ2qbEfS447DpGsPHCGDK7+DhQ/6yIPVwhzSjLd1kqRtWyV13SF1/B1xw3CAYMUO6FLO7+
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(54906003)(86362001)(6486002)(41300700001)(478600001)(82310400005)(316002)(4326008)(70586007)(70206006)(5660300002)(8936002)(6862004)(8676002)(81166007)(40460700003)(356005)(33656002)(26005)(82740400003)(186003)(6512007)(6506007)(53546011)(336012)(40480700001)(4744005)(2906002)(2616005)(36756003)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 08:13:32.7922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f04230-e682-4cd2-c065-08db5c2ec3e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7940



> On 23 May 2023, at 17:38, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> Make use of filechk mean that we don't have to use
> $(move-if-changed,). It also mean that will have sometime "UPD .." in
> the build output when the target changed, rather than having "GEN ..."
> all the time when "xlat.lst" happen to have a more recent modification
> timestamp.
>=20
> While there, replace `grep -v` by `sed '//d'` to avoid an extra
> fork and pipe when building.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---


Seems good to me!

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>




