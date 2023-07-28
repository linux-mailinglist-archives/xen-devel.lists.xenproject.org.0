Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3153D766B0E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 12:51:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571429.895247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPL3t-0006WT-GW; Fri, 28 Jul 2023 10:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571429.895247; Fri, 28 Jul 2023 10:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPL3t-0006US-Dt; Fri, 28 Jul 2023 10:51:09 +0000
Received: by outflank-mailman (input) for mailman id 571429;
 Fri, 28 Jul 2023 10:51:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B1pf=DO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qPL3s-0006UM-Ak
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 10:51:08 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6ef0621-2d34-11ee-b24d-6b7b168915f2;
 Fri, 28 Jul 2023 12:51:06 +0200 (CEST)
Received: from AS8P189CA0005.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::18)
 by DB9PR08MB7842.eurprd08.prod.outlook.com (2603:10a6:10:39d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 10:51:02 +0000
Received: from AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::2c) by AS8P189CA0005.outlook.office365.com
 (2603:10a6:20b:31f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29 via Frontend
 Transport; Fri, 28 Jul 2023 10:51:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT048.mail.protection.outlook.com (100.127.140.86) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29 via Frontend Transport; Fri, 28 Jul 2023 10:51:01 +0000
Received: ("Tessian outbound ba2f3d95109c:v145");
 Fri, 28 Jul 2023 10:51:01 +0000
Received: from 9e7da7e5c05a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4A2BCC80-1F4E-486B-8D3C-19C2F8990496.1; 
 Fri, 28 Jul 2023 10:50:50 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e7da7e5c05a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Jul 2023 10:50:50 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS1PR08MB7401.eurprd08.prod.outlook.com (2603:10a6:20b:4c7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 10:50:43 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 10:50:43 +0000
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
X-Inumbo-ID: a6ef0621-2d34-11ee-b24d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLvh/399TfxqLw/r1YIcBUvZrJB3hPib2duIufb/5mU=;
 b=jeB1KM5/uzA29allI6KUaibDNq46h7a//JmM0VmiirXjfSiBPG+/C1vyzQKDdtKOocuUBLtgoEYQIeaHi2aJ5o6EwaZePJpb9AwUouNLTMiCKEPT44M/OFDX3jEvavu4mxwBF9xiPu2JCHoNufGgDXVMhaE7aikExMPmjiCo49Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6cb8665b93df29f5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCd656koi/PpHEpyJRTuFQmB1+LgXOYCaS7gkCet8areQe32fLxBg7dN64tdy6V94qzcECCBmo+y+QGieg72Nm5D40e8jeFoec/a7q0RqK1IEW15LLBp1CXD4J47LCZGKz/DcIWH2wY6NmmY0RcERNYhkZo9yxCZKiUFcKaTFyEwhCamp2CvmoFHRVZW4UzmKt6eTU+xA0iEMHGntEaeVslt6V1RGh/NPOoyYB4lmhR6u35n6fohdMBnbkvM+x9V47EsgLIspR7gYmxrIqvOEg7fTQ8vDx2NPSaep8e6Fqm4oDBwpsLhcTA3jScnJie5M92mJfKD5n8EbMxTb1wIFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLvh/399TfxqLw/r1YIcBUvZrJB3hPib2duIufb/5mU=;
 b=QOjXsD+pa853ON7c1NfWi2IWDo0r9FEQaOwfXAbtcd+XSSq9Ib7kHtXTbw3LJPfSjnK/q/HHaT3X7H9LXHF4uZf1Oo1Y2kcAQQlYGoqc+R1WmJ/um0/CHKGkaVBvByM3i3qAvO+TwwA06BmAFahHSmEAgUDy078a+HiAgq27lXSt5Jd+wcLrcZYa5geyvmLULXf7Bgh/dxt9EDAkn+JaT09sO4pwynBps6t2+hSacMV4Yo9JpU5YckiB2NxQ+PUfiyGCC74H4+Jc1ZIkPrwP7obnrLG4ArXBoSkbGGhte75n9h6g0JePvVOofOI5eNqEC8AxtCR6wkANlil5LWa24g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLvh/399TfxqLw/r1YIcBUvZrJB3hPib2duIufb/5mU=;
 b=jeB1KM5/uzA29allI6KUaibDNq46h7a//JmM0VmiirXjfSiBPG+/C1vyzQKDdtKOocuUBLtgoEYQIeaHi2aJ5o6EwaZePJpb9AwUouNLTMiCKEPT44M/OFDX3jEvavu4mxwBF9xiPu2JCHoNufGgDXVMhaE7aikExMPmjiCo49Q=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 0/5] clang-format for Xen
Thread-Topic: [RFC PATCH 0/5] clang-format for Xen
Thread-Index: AQHZwSsi+9CDC2ydc0GfW83JpXFIW6/O9bGAgAAKo4A=
Date: Fri, 28 Jul 2023 10:50:43 +0000
Message-ID: <815F80B1-7D0A-4A1C-B3B5-E1E3D30E327C@arm.com>
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
 <27a9861c-7901-d9f4-37c8-f6895aac64de@suse.com>
In-Reply-To: <27a9861c-7901-d9f4-37c8-f6895aac64de@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS1PR08MB7401:EE_|AM7EUR03FT048:EE_|DB9PR08MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: 791a06db-382e-4e58-0a0e-08db8f5888d3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lp3nYAM0KMy0Uvt9JiAGP8fguLm+zNAFpcOLm+5a1KNP2VRaVfSDJYMNWJ5z+53qXOHHYK26YS9Awj3LDaQ3nWNz2Rign5xTxLLGeDlp2saY3hs7EV1GGk3TG/jRytJFvxSMw1WcKUwalGin1NJeNGshmYrk/CWyBLgxGRRVURgNV8+AnMsNKP0uoq2NNbZb1ens69CmigO3QHt5sx45hiUddmSgLuQUe5QGNxCHSw9BGWg791EuZ+p38ZxEdJ/m5dLCyX6ghLXdsXYw6o2QTdW97OHSyXanY3KtWKbjBrl3M0O+MFAS7jSRvyO0uS5NcsYmX4Px3OnLTuMSBuIZKtvmK1jROryNDC689humG1tCjmq8q5ZfCNOa7DHR2kkWjTcT1UOf2jfwTxm24pa2muH7XsGMPHuwaRaDmjuYFc4U1nbmqnSxfdXnI3+EBBcnBpy66Vp+Sds82qIa13JrmJtvYJL0Ia2wXHXakdyszKL/90E+HXlQyrBFAbPgc+ZXddiaUU5IfqOBcI2pr9J3daNnVlZIjqa65LTSXPOtj4H//C11HnXQIKJsXRPNTrjjPNK3XtetGgicVVvB5kjZDnGl3PDrt1GtfPYuHvSKK6DAU2fWTieR1kcnqsQ/vl6tPOsNAqKxXSiSe3FFEFWu+w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199021)(54906003)(6512007)(6486002)(478600001)(186003)(71200400001)(53546011)(2616005)(66556008)(26005)(6506007)(2906002)(66476007)(316002)(64756008)(41300700001)(5660300002)(8676002)(4326008)(8936002)(76116006)(91956017)(66946007)(6916009)(66446008)(122000001)(38100700002)(86362001)(36756003)(38070700005)(33656002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DCF53F37A73E5E49A8BC921C4450B8A8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7401
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c58f692-4140-4d35-dc81-08db8f587e04
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+0pfNmk5+2LVUNXxSowEojAbZ3GxJIMsbWuhKxHMYUa2Z2jzW3WSwtHic+djsNpnaNP54HewR3kGO7Ul4sx01VgcU3svLnGr4Gvl+Dudoxek6j1CZenTvD7z94ZXmXgwGpzT70w/VkvF6cp/9koKbyerK7o3AxzpdHX6JhKdnNZVMFm0iEUUJnhnT56re0g8tCm/Y5Wo2v0CJFxaD2fo/Skpdk1zUQyCN5Z5wHQitI0uQ/7Oy0cE8A+96tsLz5F+srz0LpZRXCU71ftLbLj0y+/GvewL89VHIsB0tgtu/xpNZvgS3CDw7hwckqs2Mh3ey06y+W++Q1Fx4dydcN2quWXyyHWBrClWQPiPzBG6m3NGUxU7rZLxTrVT4UfUNrLYtD54khTE87+tHGejrBg/uo5W5f8BfS5s+1uJg+oTGOV/EQMm04Pv7FaSEatbstSWJp/9axbikltvadvUeigD73oEkcmm3OXIjDMU96wXEi2XZgq3iqCYzd+AgMxwVdeFNbD20ogb8w00KDexFD6zL2+AFuNkIOauiOZTokw9eK6jCvFoUwV9NXS2ITsBXItAaGZ/Qp5Qhrx5HWPVEk0RLSGFWuA2w5pQLaC+eImJbE9bORMp2bNDQSPnLmjXQF48YoBOxxskXOSOmJTloBLKPhlKOIFwI13eULom/+kjyroxvzEdsvDoqkFzWoQS9SMHzKoe42xPEUM5T2lFdW015DQqk81bfqdbUhBig3iqYFzKG3H+FwfojdsC1vd1lEuc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(86362001)(41300700001)(2906002)(316002)(5660300002)(8936002)(8676002)(6862004)(33656002)(36756003)(40460700003)(40480700001)(6512007)(6506007)(53546011)(26005)(356005)(82740400003)(6486002)(478600001)(47076005)(83380400001)(36860700001)(186003)(336012)(2616005)(4326008)(81166007)(70206006)(54906003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 10:51:01.7858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 791a06db-382e-4e58-0a0e-08db8f5888d3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7842



> On 28 Jul 2023, at 11:12, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 28.07.2023 10:11, Luca Fancellu wrote:
>> I've read the past threads about the brave people who dared to try to in=
troduce
>> clang-format for the xen codebase, some of them from 5 years ago, two po=
ints
>> were clear: 1) goto label needs to be indented and 2) do-while loops hav=
e the
>> braket in the same line.
>> While point 1) was quite a blocker, it seemd to me that point 2) was les=
s
>> controversial to be changed in the Xen codestyle, so the current wrapper=
 script
>> handles only the point 1 (which is easy), the point 2 can be more tricky=
 to
>> handle.
>=20
> I'm afraid I view the do/while part pretty much as a blocker as well.
> While placing the opening brace according to our style elsewhere would
> be okay-ish (just a little wasteful to have two almost empty lines),
> having the closing brace on a separate line is problematic: At least I
> consider a block / scope to end at the line where the closing brace is.
> So the farther do and while are apart, the more
>=20
>    do
>    {
>        ...;
>    }
>    while ( cond );
>    ...;
>=20
> is going to be misleading. While normally we would write potentially
> conflicting constructs this way
>=20
>    while ( cond )
>        ;
>=20
> the alternative spelling still isn't outright wrong in our style (I
> believe):
>=20
>    while ( cond );

Hi Jan,

Thank you for your feedback, I could maybe misunderstood your reply, so ple=
ase
tell me if I am wrong, the Xen coding style mandates this style for do-whil=
e loops:

do {
/* Do stuff. */
} while ( condition );

Currently clang-format is able to do only this:

do
{
/* Do stuff. */
} while ( condition );

So the issue is only in the opening brackets, not the closing one. Is it a =
blocker too?

Cheers,
Luca

>=20
> Jan


