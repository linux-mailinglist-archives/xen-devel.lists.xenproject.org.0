Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BC74E750D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 15:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294794.501424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkvo-0003zS-37; Fri, 25 Mar 2022 14:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294794.501424; Fri, 25 Mar 2022 14:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkvn-0003xa-V7; Fri, 25 Mar 2022 14:28:47 +0000
Received: by outflank-mailman (input) for mailman id 294794;
 Fri, 25 Mar 2022 14:28:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wXB3=UE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nXkvl-0003xU-VW
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 14:28:45 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe09::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e04fa3cb-ac47-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 15:28:45 +0100 (CET)
Received: from AS8PR07CA0055.eurprd07.prod.outlook.com (2603:10a6:20b:459::26)
 by AM5PR0802MB2514.eurprd08.prod.outlook.com (2603:10a6:203:9e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 25 Mar
 2022 14:28:32 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::7b) by AS8PR07CA0055.outlook.office365.com
 (2603:10a6:20b:459::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Fri, 25 Mar 2022 14:28:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Fri, 25 Mar 2022 14:28:32 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Fri, 25 Mar 2022 14:28:31 +0000
Received: from 42cdc9c10649.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D073EF6E-2DC5-4227-AC94-DBB3A4FA126E.1; 
 Fri, 25 Mar 2022 14:28:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 42cdc9c10649.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 25 Mar 2022 14:28:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6801.eurprd08.prod.outlook.com (2603:10a6:20b:30a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Fri, 25 Mar
 2022 14:28:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 14:28:18 +0000
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
X-Inumbo-ID: e04fa3cb-ac47-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcxYJgUoyj02MY9XCWeYicz3tx5jsdz6bEKKHLk2/yM=;
 b=9J07zlo3Y/lv/CyTSpJmsSOQvOzAGDJMcDB6vFjwDkuvf8nrOJU8JvbHVtOazWFn3joKF6jnRIbFoGnBCJw2bGWR71xlKwIFngdUQk+KSZjxavAJSmB0cgp9g/YT6EMXOjpaiWxA5FNGajf2aq8evuQuseoA9YFkRNVmqjHE1ow=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 564da1f0703bc30c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ce7/xGcn5ca+ekEzkJvJgaF/KQmrWrvGjhLtDvAuA4qbtF6aB1WcVQGMnWgVb2HL7aAJd4kCo/rNgmb8HO96Gk1u3RaO43XvtyoF+zld/bIrwBW2G14c3JKI1ksfx6XFli+U6t9xBTbFBk3fOOneldVmTzOgumMJVWFfcs5K7UwCNLkcXH09wPB11g/URhlJn4trmZpMhGLjpDN26CNiaoJvnUGSOmOsSQSSQhNrMM9xGXfqFwr+hzrq+d5BMpv9crsD2WIJXYsxJdz1GaiXRKW7T2kCBiNAZSt3WmfeoYrPOJMrzwaObm2S/+ejVeXd5mMlfFsjfV6li0GeFD/ouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcxYJgUoyj02MY9XCWeYicz3tx5jsdz6bEKKHLk2/yM=;
 b=V/jJzZ0gmDOi+qxaVkN3gvnewn7h18x4pUsnERl8wUUBqtpS/Wa36iVyTatY39iB9R0Ve1vO91lkBimyp0X7dQRp/U/B20gfNcSk5vYgY6iStcfQ2Gqb4d1LAh2klRL27ODe4Kg8ZO5E6mXQoWvM45XhxoyuSXshTCXecHx8iMVH/Z9WBvcXFj+MsqawUqRxI2zc5lCYSIMvNdyrt9ujwx9kFcoQsvicTQ8P0z+LyrYxegUMzh7Zert7b+8Kd0AM8ThexD07/7ZO2Qzj95N6YLKMPMWDNy03YfNXZgrHcYFW4hoQS6JNbIc3zZI+ubPALoVEj8SKQrj9/ho/xo+0UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcxYJgUoyj02MY9XCWeYicz3tx5jsdz6bEKKHLk2/yM=;
 b=9J07zlo3Y/lv/CyTSpJmsSOQvOzAGDJMcDB6vFjwDkuvf8nrOJU8JvbHVtOazWFn3joKF6jnRIbFoGnBCJw2bGWR71xlKwIFngdUQk+KSZjxavAJSmB0cgp9g/YT6EMXOjpaiWxA5FNGajf2aq8evuQuseoA9YFkRNVmqjHE1ow=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <Michal.Orzel@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] xen/build: Add cppcheck and cppcheck-html make rules
Thread-Topic: [RFC PATCH] xen/build: Add cppcheck and cppcheck-html make rules
Thread-Index: AQHYP279DnP7J8Edsk+NG7Po4Qnn9azP/EyAgAAUmoCAABRhgIAABP6A
Date: Fri, 25 Mar 2022 14:28:18 +0000
Message-ID: <052D20CA-ED64-452C-86A6-0B33343A7AC6@arm.com>
References:
 <77c79e86050eef2b706ee11e64183d57a0f5bcee.1648119732.git.bertrand.marquis@arm.com>
 <d797474e-97c0-7545-c68f-1378a3b2fbd9@suse.com>
 <E6DE6BBA-EBA6-4279-A79D-22942D6F5840@arm.com>
 <d9378506-1686-169a-0eb0-0076910e98bb@suse.com>
In-Reply-To: <d9378506-1686-169a-0eb0-0076910e98bb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 64dad83a-e23e-482b-9d6e-08da0e6bbd1a
x-ms-traffictypediagnostic:
	AM9PR08MB6801:EE_|VE1EUR03FT004:EE_|AM5PR0802MB2514:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB25146DE74685B9668D5FE6609D1A9@AM5PR0802MB2514.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YMfoXu2pIcfPugEQKhuqAhw3WHdsOli+eWC6FEL1gYhjP+W3/7cI8+1RkUohtjcuzX4jwRUXG3zJfPzobloqeik0NL2aeJxVUjVBgReeB91dJWSPgjjF6Pv+u4RVxS2BtXHY12O3QrJFLg4CetbTYJ9xFdLckXx6WGWD7Z3+zF2+KdMyMqyo/pYJ/pAhmB5KhT7X84g/YMiu9IrOwB+csPL1MpVjP1NMYiG4V1cTsfvxKiKgw1Hv4/9CDzYowYCdv8xxFt6wtmTtn42aCaOtMkJgLYNestGiLkK3jeEjPXr5Wa6Y3Q0w0PL8xtFjAQ/OPZp8g54vn7vwCK/2H8azx5C/DyEiK/9hvM7y/EK73eQPCLM3NS6CFo153Zmn6IB8j3h2zXBPvoyCDdUayflkLMY4FrO1tyO06E2Dn/FjZf2sbs3Xvkaxfvr+VSiY62sMgqf1wDGHnT2tC87HtB/eiZq8U8rXN5rdzLQXORWVQo+QgNFhOkYdd6l8PZy8X9LjVFt+rtAjmBh1fp63edQtnoFII6vbF9gwnq+4fVeL1E378SLrGIEUlBJtux6Domgsm0HyMY5XNY41aI/U3utvF/VCpa3exN9KqjI91q8dsHLeRFxvltsqlr+QpFPmSGm9uzQ2o361zLgHs3fufPr9kyXGkrsE775Sb+GDovUqY+IQjj1yaYq8GxMliLXHBXl4U5cRiY7iXmPVqRa0nMtEPdXHd3lbnk180ria04dVgpR6Rq4SF7nS9coEw2VeasOz
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(6486002)(26005)(186003)(53546011)(33656002)(2616005)(54906003)(71200400001)(2906002)(6916009)(508600001)(6512007)(64756008)(66556008)(66946007)(316002)(8936002)(66476007)(66446008)(76116006)(91956017)(5660300002)(4326008)(86362001)(8676002)(38070700005)(36756003)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <00E3B731B91F1A459DF891CC64C8E617@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6801
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ccc1dc85-e9eb-4dfc-4895-08da0e6bb508
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	892f7d6Tu8EW6A03Jxo3XyAxajGzYNqqo1xL4ae/bHm08t8l8816ffdwQ9U7G3dA713xP9xLoqHfwR0V+UuVLTc7DcqJqaZQcx+csJAkvvo3ntHCgCbRLJ1M3RUOrupWYOLCYVl2PGoj38W6ZI+vpNazVM+GJPFRwaPM5BiB/1kc6sT22yuLS6IIDLEP6ADg5hVmARFB8gnfTucAdiMdA9XMSfuta18eS194fq5PTwYDXloVotRaxCHvJnsdxn+CAx6Y8ZhcC4z9BDk6CB1p4WBzGluUmGk0bMVU5D/az95zAM7CiV3Fnjcxjk14eoRl995ji6g2D/5+qoNQhMOxk/JyFqdVZllkapPjXDH+eosKozEazcS7nHyZ1cYbvhJU/ROe16XOzxPYDRwu/5KZ4KatFYw4bKfy2o/ReeDQGI2hCTUuViCDecT4chRJ4uSS+v+rY3C0Ubo5EhjY3BVeL3HqYCihj8uMeTPDTeJWAuBLbinGWpjMyJsBBdP6zsjGFvul/YXaPUOR8Zb6CVQG4qsqR+eQ6gp/gg6dcpaz0vGyafMr2lyuW+nEvjLnNo7IIAXU+5/d9JnRtPux7nVyTS4306dQlu+rlubUY20MIfwrz+QUNHGzL9SG9osVPa5k3NyigtY8nl03oKRLs4nICTo605fZuw0izyxivfw6BNaYGmuSUV3hr8uTSSzr4MsP
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(70206006)(36756003)(70586007)(5660300002)(82310400004)(4326008)(508600001)(53546011)(81166007)(356005)(6506007)(8676002)(6512007)(33656002)(6486002)(316002)(6862004)(2616005)(8936002)(2906002)(47076005)(336012)(36860700001)(186003)(86362001)(26005)(40460700003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 14:28:32.2200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64dad83a-e23e-482b-9d6e-08da0e6bbd1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2514

Hi Jan,

> On 25 Mar 2022, at 15:10, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 25.03.2022 13:57, Bertrand Marquis wrote:
>>> On 25 Mar 2022, at 12:43, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 24.03.2022 12:04, Bertrand Marquis wrote:
>>>> --- a/xen/include/xen/kconfig.h
>>>> +++ b/xen/include/xen/kconfig.h
>>>> @@ -8,6 +8,10 @@
>>>> * these only work with boolean option.
>>>> */
>>>>=20
>>>> +/* cppcheck is failing to parse the macro so use a dummy one */
>>>> +#ifdef CPPCHECK
>>>> +#define IS_ENABLED(option) option
>>>> +#else
>>>> /*
>>>> * Getting something that works in C and CPP for an arg that may or may
>>>> * not be defined is tricky.  Here, if we have "#define CONFIG_BOOGER 1=
"
>>>> @@ -27,5 +31,6 @@
>>>> * otherwise.
>>>> */
>>>> #define IS_ENABLED(option) config_enabled(option)
>>>> +#endif
>>>=20
>>> What are the consequences of this workaround on the code actually
>>> being checked? Does this perhaps lead to certain portions of code
>>> being skipped while checking?
>>=20
>> Cppcheck is not optimising the code but looking at the syntax so the
>> consequence here is that cppcheck is checking some code which might
>> be optimised out by the compiler. This is not optimal but still it shoul=
d
>> analyse properly the code.
>=20
> Aren't you saying so merely because all uses of IS_ENABLED() in our
> sources so far are in if()? It would seem to me that when used in #if
> (as can be found in Linux, which hence means could be the case in our
> tree as well sooner or later) sections of code might either be skipped
> or syntax errors may result. Or wait - IS_ENABLED() does itself kind
> of rely on the respective CONFIG_* to expand to a numeric value; when
> expanding to a string, I guess the compiler would also warn about the
> resulting construct when used in if() (and reject any uses with #if).

I am not quite sure I am following what you are saying (or asking).

I say that most use cases are if (IS_ENABLED(x)) so from the syntax point
of view it is ok to not do exactly as IS_ENABLED really does. And
cppcheck is checking the code not the result.
Now it would be better to do it right but the point of the patch is to enab=
le
cppcheck not make it perfect on the first shot.

Cheers
Bertrand

>=20
> Jan
>=20


