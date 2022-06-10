Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B01546189
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346067.571790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzanw-0003e0-U6; Fri, 10 Jun 2022 09:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346067.571790; Fri, 10 Jun 2022 09:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzanw-0003bI-QV; Fri, 10 Jun 2022 09:19:44 +0000
Received: by outflank-mailman (input) for mailman id 346067;
 Fri, 10 Jun 2022 09:19:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LeXp=WR=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nzanv-0003bC-2H
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:19:43 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe07::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7575bca2-e89e-11ec-8179-c7c2a468b362;
 Fri, 10 Jun 2022 11:19:42 +0200 (CEST)
Received: from DB6PR0801CA0061.eurprd08.prod.outlook.com (2603:10a6:4:2b::29)
 by AM6PR08MB4835.eurprd08.prod.outlook.com (2603:10a6:20b:c3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 09:19:30 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::7d) by DB6PR0801CA0061.outlook.office365.com
 (2603:10a6:4:2b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12 via Frontend
 Transport; Fri, 10 Jun 2022 09:19:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 09:19:29 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Fri, 10 Jun 2022 09:19:29 +0000
Received: from a94b9373e714.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1E282DEC-438A-4BCD-AA82-97477A2DD2C6.1; 
 Fri, 10 Jun 2022 09:19:22 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a94b9373e714.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Jun 2022 09:19:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB5963.eurprd08.prod.outlook.com (2603:10a6:10:205::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 09:19:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5314.019; Fri, 10 Jun 2022
 09:19:14 +0000
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
X-Inumbo-ID: 7575bca2-e89e-11ec-8179-c7c2a468b362
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bEkRXo94z2elnlTPg17GpQkYYGVoMKPB3HEU87mFC1BHwMfoHftOMFq1QZw45mutlIfslRBisqovkCBvRYRFAsCQTjJsyRQBq6fOVGsgBSqV6KRdEl7hkPKXpAtchv3K65sL7uhW9J1XOIh95e06jM9YrHFLK0apIXa/g6AKCgPRoGQA22z22DxrBZ6xskcv3oiN+/J62EE4H+cqwqWHcei2LudgpSM6oIS04OqtLYgIHdSYhmZOb6iVlelhPEk7uDA81A2HBt6qlv5o9lqoHyXdlaHGhw/GWQ46EKnQXbqpUoaAunNn80Ti0WpSrR1wtN6Yfhlue/hxdEVSkl6hog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yk/DcCv2eqW0SI4rL19b4iBDp92382m05OE5/TZHT58=;
 b=JIxwugowT0Ocz+3TKSBslMWA3twubMa6NoKgkdr0wqUZXq4xAtjQN7LZeMg7PYtMmV7HvtQYNkTcYPzJqbyRzdUMZLithJ8GO39yjtJUl863L03Kte/WDy8asws2wgEpztV6ekbg3wItq2T1VN2YDnuFnvZSKmXkwqff5J3imH6hGofjyJrU/DHlilYUIluqSO4qw+IOf5D2tDZp/1K3EU56QRAcnySWIpTVuAKKPy6OWW41DPM4PFO4dcYSWAqzRDn2pKY81npP45ad2R6T78hqlup0tRorp2Z9qN5faGbza68lonVZvPqiy56o3eBVi6U4oS9y2Hn3rDVquxpq5w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yk/DcCv2eqW0SI4rL19b4iBDp92382m05OE5/TZHT58=;
 b=kKQWRWoYIw30Nk16dmzjZ/Hv9cPU1Wb4lzKr1qPtJ+6R+ztFAxCECvuX/6/cup4ddFRLidRVuD0FgkV0e0uuRtm5qzsQCMlqPZWLzTaniy5PKBMXm8uhJTYRgcufPXQmzTD96KOnFMbyCCGSPosr/iBEG6P/8fCULPDyz16M3u0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c33fd2db30905f59
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Flqk4pwkMGMEeODWAO8COuVjONfIJlwHSv14r5bqwE7ciaAKlp2nu7Rtoe/RWz2hNCyPHghctd8ljOYrntvWRjVVKYql0nM0dNKmEAxOKvm8p3zkD1fHYrgNBIDoEakst0K9qogksWvwDlPfut2SNwb8hBhs7XAamCy5N7hYYDAguT3awVVVpuDos18VqFNsmX1q02yltnWZeNantvABF4jLkICjwmpYAieIg2gQhtMvSnDkLNMH9vJSp0tS+rtTX9J/Ouf5eYcPbPOeAJEzA8MQVc+t3emmNXv68SPYWOIXqG7LYlnBaB+w5NfRG3RGZ21IVrHl5umOAO7Et1wInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yk/DcCv2eqW0SI4rL19b4iBDp92382m05OE5/TZHT58=;
 b=lKWg44i/XZ8Z1JXoKEBvgtPp9yMkHw0icCzg3tZ0YsJyHmiYm315cUojHIgeDoj9MB4Or3dSdHoFawyrwrcEuwvtfesBZYl9CHBWsc2K40c+FhjC7lGEcL6Ulyt0edNK9TL49yeEbcud83mfn8mzzjzK1Zs6mb+IAHXB2Kmv+fjv661cBo2x4iv4IYiw2q9xJogbFTR5iaDOfkSzlGRna9dxpWCnh33Y9BBYXgga9dugkrBFZmcd0qLdMBVk1r4I8xARhAWiuW7F0a4vJByCMPKvfZCQjwSGrrZa1NssxfUf2skgqedt2I5QsBUCxG6dbrPgx8TdYEdPocWG+NRavA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yk/DcCv2eqW0SI4rL19b4iBDp92382m05OE5/TZHT58=;
 b=kKQWRWoYIw30Nk16dmzjZ/Hv9cPU1Wb4lzKr1qPtJ+6R+ztFAxCECvuX/6/cup4ddFRLidRVuD0FgkV0e0uuRtm5qzsQCMlqPZWLzTaniy5PKBMXm8uhJTYRgcufPXQmzTD96KOnFMbyCCGSPosr/iBEG6P/8fCULPDyz16M3u0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "Artem_Mygaiev@epam.com"
	<Artem_Mygaiev@epam.com>, "Andrew.Cooper3@citrix.com"
	<Andrew.Cooper3@citrix.com>, "julien@xen.org" <julien@xen.org>
Subject: Re: [PATCH] add more MISRA C rules to docs/misra/rules.rst
Thread-Topic: [PATCH] add more MISRA C rules to docs/misra/rules.rst
Thread-Index: AQHYfGPcMFsu69NoY0eiE0tgRprVc61IXYSA
Date: Fri, 10 Jun 2022 09:19:13 +0000
Message-ID: <451CA8F9-EBE9-43AA-8121-D1B4775D6EDB@arm.com>
References:
 <alpine.DEB.2.22.394.2206091748210.756493@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2206091748210.756493@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d66da8f9-8f3a-44d2-52b2-08da4ac252ba
x-ms-traffictypediagnostic:
	DBBPR08MB5963:EE_|DBAEUR03FT026:EE_|AM6PR08MB4835:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB48353FE97BA6E041A01CC7CF9DA69@AM6PR08MB4835.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FOL/lQmSfyddwDgr5ov6ZWB5nAGgdN0EktIBqbj63XREoaUNaBkW6mBmY+GP+hhY2LDybORou/I0Q5VpyIMUOHwcOieWGfMfIty1dNnTUbhEO2Po4RSZykpM0Jnj0/rYggGImIsBLw4XTWFbmfWkemyz6M/N+6PgvTvdn/LBkK3x/kSbI8ZqpaGP3RuznVWTg9PRAZcL9leqa7FCaQkl4qla0aUL/5Iy9ugDOFnPi6JKGmHLSkhEtIc6u3qSREIQ9lETjKA4iJWQQOkzZd36Y5LHS1POeVfBnbcuJiRtOCCoKQ11uXnL21+c5KqZNZ6KNFfIU1oFMpOlgBxeh6uZmbXRSUW5Aidh5FPfffhEOTB6J2r8v8HEfJCS33VePR40NAcJNXIoDmqasVeQO1KniijKhGtt/jnNiO1rfUnHu1MaNou5IV/41sjdpti1Y9Dykt31grV+TQNDd7YDGjasRBcqbcYdx81V2dDvB5CMBSzRdcoE2vkuXk7Ax2f3LHK44iOVZc8WPDsEu6iHXjuzgXfvHL/318Lnv4JulqIoHPjp3ivsejws2pg34IZRdztJnox9FwsWh2HyxrLemZKO6PaJfpVryZ6dfHQUXPH5X5Q+aZRU1/Ak+xh/ZyLIfJ3aD19+fPp7+43ud2hoUREWw2aWFwVJegkSnt4PRBhgs6Ktr2QYFbJw9M1I5plDrsP1idLYAJ95qDMIvPctqacZD24J3c6ZtsOyQE8WYHCMsSjwcJVQ7D4hN8Aym8iyz6gW
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(508600001)(33656002)(6512007)(8676002)(4326008)(186003)(6506007)(2906002)(38100700002)(26005)(38070700005)(5660300002)(316002)(122000001)(36756003)(8936002)(71200400001)(86362001)(6486002)(66556008)(64756008)(91956017)(76116006)(66476007)(66946007)(66446008)(6916009)(54906003)(2616005)(4744005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DE5D2E9AAFD0DC4CAEA861ABB12C37E4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5963
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9d3001fe-bced-4e5c-8f9e-08da4ac2494c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tj/yFjxxWhxMPr4BprL2YAhgCkDc5ll2Sd1eoQx53FiY4iPYohM2BNZp1/FCe8Z3dfhccHf4RLuLG9X0PF4DdNIABkNqbBXw4FVniFwxUBGrfKpBNbDWqVgdZPS9qS8tuW7TL5C3cgO5zRBT/QoJrNahumiZ1fG4PkdeDcyms/88EFWDGmb04LcIIm+4IKRZMEAq570W+hPXaEZOFhvonW0M/QPFLTi44vkwL79BaP+ErulikOOPzkz5FDeZHi0oDixvEtFWGpg3/EeV0S1pXYC8aeCroK6AlW2fCjuUcAQz+iuA1nLDzLDfDyTmkQsoWlEJ7SJ5BNFvkF0RIzRGgoMLXVzJE+y/N2pDrAiNLNbikiVvgrUyEHmXOg8ju8nuWUbsnf5PBa36E0p5c6YlAdy0QXta+WymyKDMORMuTT4uS1cvToE6W/XLoOunsjQG98CHAMNbn5loTYBbFtQ9f6UwNKgQsX0MoyWRN3xr1sUGL0wOiW00PWnu1eSkcLkAgBdBnE8j6wk65+3dUW5qYvRDc8DJeogOBzGI/as4baNBWoFJZONdHec2+a6c/xaE2lBXRwcfrZdeLRTt2FcfxysoiFAKHvM8ggzBRdyjjhmqfo8KfsrOF93gOJqKo327WRDkR3pXcj2faLOZKkaoCZJeZTZaNtIZHTUFGt16jFSTOMwUN4AuG3XBhdDNNyRK
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(316002)(33656002)(70206006)(2906002)(8676002)(6486002)(81166007)(5660300002)(70586007)(4326008)(4744005)(36756003)(26005)(53546011)(6512007)(356005)(86362001)(6506007)(82310400005)(336012)(47076005)(508600001)(2616005)(40460700003)(186003)(8936002)(54906003)(36860700001)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 09:19:29.8399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d66da8f9-8f3a-44d2-52b2-08da4ac252ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4835

Hi Stefano,

> On 10 Jun 2022, at 01:48, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> Add the new MISRA C rules agreed by the MISRA C working group to
> docs/misra/rules.rst.

The notes are now used to give more explanations or document deviations.
We might need a proper entry in the table at some point but I think this
should be part of something bigger to handle deviations so ..

>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>=20

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


