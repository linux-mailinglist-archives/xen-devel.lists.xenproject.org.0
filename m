Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C58227AE2C9
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 02:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608218.946576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkvbl-0006l9-BC; Tue, 26 Sep 2023 00:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608218.946576; Tue, 26 Sep 2023 00:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkvbl-0006hw-8J; Tue, 26 Sep 2023 00:07:21 +0000
Received: by outflank-mailman (input) for mailman id 608218;
 Tue, 26 Sep 2023 00:07:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQH+=FK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qkvbk-0006cr-0c
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 00:07:20 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2078.outbound.protection.outlook.com [40.107.13.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a75983b1-5c00-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 02:07:17 +0200 (CEST)
Received: from AS4P192CA0023.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::9)
 by PAWPR08MB9589.eurprd08.prod.outlook.com (2603:10a6:102:2e4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 00:06:45 +0000
Received: from AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5e1:cafe::cb) by AS4P192CA0023.outlook.office365.com
 (2603:10a6:20b:5e1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Tue, 26 Sep 2023 00:06:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT061.mail.protection.outlook.com (100.127.140.72) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.17 via Frontend Transport; Tue, 26 Sep 2023 00:06:44 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Tue, 26 Sep 2023 00:06:44 +0000
Received: from a57abcc16e4e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 42DBAA73-7CE0-44CD-86C5-320D3C43CDE2.1; 
 Tue, 26 Sep 2023 00:06:39 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a57abcc16e4e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Sep 2023 00:06:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB5952.eurprd08.prod.outlook.com (2603:10a6:102:e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 00:06:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 00:06:37 +0000
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
X-Inumbo-ID: a75983b1-5c00-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CvPs8vClVwnyo1YF7qGgDOLlYOvNqERXAgAVll3sxI=;
 b=YkfOlSIBNd+nK3prgqBKAk1+juICSUwcAJXLSHw9sujBaYlJXnddbj54K0b7OvBMVs1mzYu1h+K2Dj9qS1v1QCjauVFO04oFa1IM3w/gVlQoPC1BjZ06SPXqFz87QRpwfpfFIS3Fbdz3ezg7W3CL5yK6JQA4DUhqNhOTxhFJIek=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3844103fb39f5ad1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUBezNCUR4mc8nrRsx+vfAVDG3JC3nh0cWYtyu4f9eE0NvMUZbdv1mL3lCtuohV+WpDW7iLeeI1rnpoLrWNQfag9ImPSSTVnVAXnm6g2X8HNVpS/x/bDV4snEYww9mMgH7anFmXpM851E0UlnB7WfVoBqKgjkljuxWqLIQGJMlRL4rErKWOkYYAfmpoSKf3k6PLYusmsqMmf5GhE6YNtZJwHDPbUy0BUVsCp+Z3AAcVU+msJO4ZzO/SQ/GKYxsucYRzGWcOv8nyGMi9lvA9Cikz0efv4CvDzzwrSegtwk656TqVS6pTivO9fFQ9IqgEWEpYhiN8M1o2xv7xKW+bQYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CvPs8vClVwnyo1YF7qGgDOLlYOvNqERXAgAVll3sxI=;
 b=cFT5vT3IMN6mzXSZZhvlSk7VT7yfpilqrUQsZ8b1Xehm1Qzw1W/x3V+Nb8Uhxq+xt4R3+wwsrX3gHpPaZvof/v3ivPo6cqxxYA4YUBRJEQxnP9FslFNN5PbrsA5McLoDBYsKWINqeDw3ny/lThmCLxeUEgscwu7RSzlErcz9ja9ZMbNXzdgBqEuISusgW3eZSfuL8TPyhJO8aB0pSQuwjqhKYWdzdrOWb/HmRX4hcmXo88qVUXeVmo6kpY+/ZV21bIpa20smv1WexZUiqXmT6vEVvoVhE9hf+F9uzqYxnSyv/wRSUHCRurRihoN+6LkwDF4zSe/r9ye/R5JjQBHPGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CvPs8vClVwnyo1YF7qGgDOLlYOvNqERXAgAVll3sxI=;
 b=YkfOlSIBNd+nK3prgqBKAk1+juICSUwcAJXLSHw9sujBaYlJXnddbj54K0b7OvBMVs1mzYu1h+K2Dj9qS1v1QCjauVFO04oFa1IM3w/gVlQoPC1BjZ06SPXqFz87QRpwfpfFIS3Fbdz3ezg7W3CL5yK6JQA4DUhqNhOTxhFJIek=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Timothy Pearson
	<tpearson@raptorengineering.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] xen/common: Add NUMA node id bounds check to
 page_alloc.c/node_to_scrub
Thread-Topic: [PATCH 3/3] xen/common: Add NUMA node id bounds check to
 page_alloc.c/node_to_scrub
Thread-Index: AQHZ8AGkc54vz/eFtkqxZbyiTL5NFLAsKWSAgAARLIA=
Date: Tue, 26 Sep 2023 00:06:36 +0000
Message-ID: <0C796FFE-6FD5-4772-A524-DA059AAD778D@arm.com>
References: <cover.1695681330.git.sanastasio@raptorengineering.com>
 <a47962a573eab38991a8aa3e09ca6b8bd3193b6c.1695681330.git.sanastasio@raptorengineering.com>
 <alpine.DEB.2.22.394.2309251601140.1403502@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2309251601140.1403502@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB5952:EE_|AM7EUR03FT061:EE_|PAWPR08MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f4c0de-8adf-4f2f-abbd-08dbbe247851
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 l4GyPqU6hICo842vOltx/J3iBT9bwEXKswAMrCX6Xl3X8Unx9s8BlcAgdtt7w0jZjAE98PVOyYDFU2jbRELTEW3y5wrwjaYCo7yHHesF5LXjpC6YFtn2F4Ox01CTIssOHN9Lr870jwR+wmKoEWJ7LED9Zj6H+dtlgjg7+4X8BkS3NklztvFlvDPEG4FdXl8b6Jt8aExivdXWSUcGm39HSVPsbhZU8SvwgnKCcZamCo/G8ffg3mB7mMZ/iK2hVagDwhMYWnczB4x9IXPYh1CAUcaRFCvr+Nf3HqbyPQzwjhlBEmiXBRCIyar/C/lQO8qDBM+KKoAu7jJHZJhITnId/ZdA9am2+yHYxvayAW/BrrjxNmsVzGVmCnHndZIh+1zad81oHT9J51HkiFdCukb+adHEyl2PBr2+q88yPKe3aOhWGkIoDbmah473H9dLUEXnEvGzkBaucscoryzMNHbkWBe1rHQa7tPfkcb5oAzc+FJQ+Gd1aKxocw/RDJPvz38AMPLm7YU4cxsaplRzwx4VZEQV5nvBO3sXrzHcpLCv5bJfi5xs7L2E7njTIznf35wKffKoHpSUzFZ3r6r22BzzyAihLTo04D2wUC6yoymqUWP7Yt0uxhorGy1pCnfq8S6UQy8DcED9DDluvm9YFHVGPg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(136003)(366004)(346002)(230922051799003)(1800799009)(451199024)(186009)(41300700001)(2616005)(8936002)(4326008)(8676002)(54906003)(66476007)(66446008)(66946007)(64756008)(66556008)(6916009)(316002)(26005)(76116006)(91956017)(86362001)(2906002)(6486002)(122000001)(478600001)(33656002)(38070700005)(53546011)(71200400001)(83380400001)(36756003)(6512007)(5660300002)(38100700002)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0A1A314CCCE2DE46AF6BFE111C90B620@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5952
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	34fd4b47-b9f6-49fa-4fa0-08dbbe247337
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1TehPg151M6pEK6Z5vVsy0en9j4CDxuj1iwZgjqM8zNhqae1Mtdg+cT6qk2tiJE3C15INShl7adrOx0v9X/jJZH0sIovrePPpaH5pctDh5fKvHH/iCIC3tX+MOccnsKuUrFivGYu4WkobJ/nHHBqTS/z7SHyrn6PySHTXDc5Ttt9TQEcSIYKQ8tCidk2PziNAiYvMtZw5Y1N5gPCcMVaOsYJXMPiYrcxE37UcQimQK0rT3quUnVjLviHBLvEn4e5oBXNeCJY3l9UCwjr/i1pYlTkCVDsw30YjJwZg+1V/uq9yezJHM+xjBn4cST2ESwPt2qg/dIKTUF2Z7z4x38yVxLgDzZ5rAGgGafmUvrMyPqrMaXmTUNyGiyLPWOu6X0zvuVCfsVMoZsxv9/AHoFCKqauCJMOipqLyaSKRvzZZqMwEOgnUsvsUX90Nspzaif3H2YrqDsDCvwzlQY2MLP23pQCiGwr6+KkJwX/COiL1L6354xAtzHJ6IecLl2DOWm99Eknba2AqC5PTmMws58C+3ycogWd2lwKlzzb9+SPPpHYEPb8P6IyM0+LFboEDazTCc7GWRUl3cjA6HZfWabUQE6/5/x1KmJqj81xQw6Sx+aMJoh01cQ+pC1vtRIn2oALgYfhKcTZYLEsfHPaxdPPApFHoJMlSgOZI+Kte0vVOTrUhvKIsbqxb/fl+uoqGfY2Mjzwvm9eIY1nVX0EMv2LjVfZtuRoT/8LOteOm/V9VxER23p5X3EEXobCFkHlQT83
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(186009)(1800799009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(6512007)(40460700003)(53546011)(6486002)(6506007)(83380400001)(356005)(82740400003)(81166007)(86362001)(33656002)(36860700001)(47076005)(36756003)(2616005)(26005)(336012)(40480700001)(2906002)(316002)(41300700001)(70206006)(54906003)(70586007)(478600001)(8936002)(4326008)(6862004)(8676002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 00:06:44.9150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f4c0de-8adf-4f2f-abbd-08dbbe247851
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9589

Hi Stefano,

> On Sep 26, 2023, at 07:04, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> Adding Henry as this issue is currently causing gitlab-ci failures. I
> think we should fix it as soon as possible to get clearer results for
> the 4.18 release. (This comment applies to the rest of the series as
> well).

Thanks, the CI should indeed be fixed asap.

>=20
>=20
> On Mon, 25 Sep 2023, Shawn Anastasio wrote:
>> When building for Power with CONFIG_DEBUG unset, a compiler error gets
>> raised inside page_alloc.c's node_to_scrub function, likely due to the
>> increased optimization level:
>>=20
>> common/page_alloc.c: In function 'node_to_scrub.part.0':
>> common/page_alloc.c:1217:29: error: array subscript 1 is above array
>>            bounds of 'long unsigned int[1]' [-Werror=3Darray-bounds]
>> 1217 |         if ( node_need_scrub[node] )
>>=20
>> It appears that this is a false positive, given that in practice
>> cycle_node should never return a node ID >=3D MAX_NUMNODES as long as th=
e
>> architecture's node_online_map is properly defined and initialized, so
>> this additional bounds check is only to satisfy GCC.
>>=20
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>=20
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
>=20
>> ---
>> xen/common/page_alloc.c | 3 +++
>> 1 file changed, 3 insertions(+)
>>=20
>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>> index 35d9a26fa6..6df2a223e1 100644
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -1211,6 +1211,9 @@ static unsigned int node_to_scrub(bool get_node)
>>         } while ( !cpumask_empty(&node_to_cpumask(node)) &&
>>                   (node !=3D local_node) );
>>=20
>> +        if ( node >=3D MAX_NUMNODES )
>> +            break;
>> +
>>         if ( node =3D=3D local_node )
>>             break;
>>=20
>> --
>> 2.30.2
>>=20


