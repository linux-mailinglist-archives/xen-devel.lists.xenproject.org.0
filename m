Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E714B9B9C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 10:00:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274512.470006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKceG-0001vS-Va; Thu, 17 Feb 2022 09:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274512.470006; Thu, 17 Feb 2022 09:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKceG-0001rt-Rl; Thu, 17 Feb 2022 09:00:24 +0000
Received: by outflank-mailman (input) for mailman id 274512;
 Thu, 17 Feb 2022 09:00:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+F2=TA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nKceE-0001nC-MM
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 09:00:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0826b690-8fd0-11ec-b215-9bbe72dcb22c;
 Thu, 17 Feb 2022 10:00:20 +0100 (CET)
Received: from DB8PR09CA0001.eurprd09.prod.outlook.com (2603:10a6:10:a0::14)
 by PA4PR08MB6093.eurprd08.prod.outlook.com (2603:10a6:102:e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 17 Feb
 2022 09:00:16 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::78) by DB8PR09CA0001.outlook.office365.com
 (2603:10a6:10:a0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Thu, 17 Feb 2022 09:00:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 17 Feb 2022 09:00:16 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Thu, 17 Feb 2022 09:00:16 +0000
Received: from e58b2d5dbee0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 59F95ABE-6C7A-4E45-A814-8965CED7BEF0.1; 
 Thu, 17 Feb 2022 09:00:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e58b2d5dbee0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 17 Feb 2022 09:00:09 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by PR2PR08MB4844.eurprd08.prod.outlook.com
 (2603:10a6:101:1d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Thu, 17 Feb
 2022 09:00:03 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e%9]) with mapi id 15.20.4995.017; Thu, 17 Feb 2022
 09:00:03 +0000
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
X-Inumbo-ID: 0826b690-8fd0-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vbq2pUhWcYMWmBB4geu0FnnTyGexLI9QGune3Xs7okg=;
 b=384oGFtPGlurVaGLtUp2STuypFETnBwxlJ6H/gvirn8CJWFF6on7cmuH/dhQswGDFg2S771eueuMoxnPymw3N1zIz2M1Ket/86kaV2Bt5KIEtVYi7Rej5Asg4SlJ6DabuJKFNi4FcG+b6Qlw4bQ8AsS3OqFGNsTZdY9xYgUZl9U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7c660b119950a015
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yud2LlJ0x9hR3z8RyxNLtQ+Js34WRpqMoeaHTdwZ8+WjP3F0lYK4Diw2D6LnMbdA2M9r/X9TumjpqOMIzeNg/YgGUiLJONrViM2nTHlWZ2iBx7DJgHliXLEKpDIFMgvW8OTC2/vm9TYkH5cN/HiRmF1SR32PCc/X5fUUggP6lvLL9NpyjZ67/1sB2ya6VJoYmmBrTTp2mw7xWTCySWZzSWgaN+RuHGGuhywX5ucs1b0iwYxl7VDBVAfEUCrIjk/HeR/MASwwOCeAQluuWJkR1D7M4sc1L3HRKyjpodEgDvTq4EM5lEdIAb3YiFYo/pG+FycpsnbBb4iRiOTSSJ6UPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vbq2pUhWcYMWmBB4geu0FnnTyGexLI9QGune3Xs7okg=;
 b=fP7E9NFJ4w24rsxVpM5gxfl9BuSWoZjLUnV26sq1wxbOYmsg3Q5ujLIRdHpq+AWFmRWg3mfE0EUem+Bu/e7XwI5EhT89HnUXFr0w+5sCBev7hsHQNvNPBIQw3TFx+4sDEzMeg/JxzHwArm2st+0YcyhRfSIlwMqKAmLtx5lCC9AgOfB/Pq0MTHivrKbj6sQAIUZA9gNmvANfiKC+VxlDDJ/4LTrVqSpAgBLf/oFG7CNFfUU3slCcGdYMdPlvC/ReGGJD5kjXB8hq0qecDnuSB3GfbnEKCMRK2N5pdW0AAHa+GRbnaH/vCPZR8KF87JRO/OynZwiFzu8Op0lK+9Q+BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vbq2pUhWcYMWmBB4geu0FnnTyGexLI9QGune3Xs7okg=;
 b=384oGFtPGlurVaGLtUp2STuypFETnBwxlJ6H/gvirn8CJWFF6on7cmuH/dhQswGDFg2S771eueuMoxnPymw3N1zIz2M1Ket/86kaV2Bt5KIEtVYi7Rej5Asg4SlJ6DabuJKFNi4FcG+b6Qlw4bQ8AsS3OqFGNsTZdY9xYgUZl9U=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot time
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <69d80e47-ad4a-5fa7-acdb-96da6c9598de@suse.com>
Date: Thu, 17 Feb 2022 08:59:58 +0000
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Chen <wei.chen@arm.com>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E60AD169-4721-4C27-ADC0-DD575AD62D8A@arm.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-5-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2202151827380.43738@ubuntu-linux-20-04-desktop>
 <53747C8B-681A-4474-B1DF-F08702322AB9@arm.com>
 <44d2673b-2450-81cf-5d3e-9afb23ae09c6@suse.com>
 <1D92168D-DFD6-4B1A-9079-FBFDDA9F2969@arm.com>
 <69d80e47-ad4a-5fa7-acdb-96da6c9598de@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-ClientProxiedBy: LO2P265CA0486.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::11) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: b012262a-1834-4234-1c10-08d9f1f3eaac
X-MS-TrafficTypeDiagnostic:
	PR2PR08MB4844:EE_|DB5EUR03FT027:EE_|PA4PR08MB6093:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB60933546A11EF39BA2B7B7D8E4369@PA4PR08MB6093.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 i5B2dpFInuaHb4ZtndqLu+Yd/m+9MHmpo581kVPShStfidnPxilXRqsvRLm+uaqtYKxvHmrB172XA6R/XMf3IqLxfk5BHs+66KUIa5tKNA7CWI7J3WRHok7H/I27IulkZmw6nvNypp4yD4MXh9Bcy5F3zew8NyO7zIbjbM2C+AJ+S/ULlKnSQB65ok6AEn0hrWUu5HLwivfrrF3ng+Mv6MD9NfaHIVY78dWvamf1X2Ln2rOXldVvJkV8cUpZIM4a2/LxFj0Y4UChSrjCnYo6coiYbFrZd7ja/tAR4ejLuN3EcHp+jwpqIY0kHwyhk5Ew0YuBpuDFhZXNqvkp8tl+16IVz6gpNRY7jSM1Iu8a1nY5sPPzzRCDPTEde3Go1adzJjMeEVUc+AURr15lG6TK4MsO09kvBXHL0SVwfZ6b5mICpQ3pYSmfJlaleflgwA1qZZQh8nidEAq7YB8qy1qmBO10TZfn1IMTWYl8I+zX8pRx8N9TZUNnIspofhblXZfTdR03hFe9dLpNWgDyvaq9K1XxxLBDLCVbmqP3yMiUcP4vy8xDFO66j1gohIm0CxpEFpYLwV/tLfbIaiSB/W4OJefuYbD4t1UV9rFUFYHvMDyQqb4j65qFr5ZyCodneZkROCbyHi+l6PgOeTu0ibw7yqP6nuDBrjC44ri8dTakEy17R2QKShB64E7ywGSGR/beBp/YZpA8BteiRDaCziVWlWNOgXFeabzG1uVe1yjs3Zc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(54906003)(6666004)(86362001)(6486002)(110136005)(66556008)(66946007)(8936002)(66476007)(4326008)(53546011)(44832011)(508600001)(36756003)(7416002)(5660300002)(186003)(8676002)(33656002)(26005)(38350700002)(316002)(6506007)(83380400001)(2616005)(2906002)(52116002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4844
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9355360f-6a54-4757-e22f-08d9f1f3e28f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OWVQ7b+4q3wOY2P4OAsRxBwgz5XR+tpbY0LeFq8gqm6kFNZLPCr7VpulNU/SesPZ9dEjdD2Hg4jRAsDAU9i3S+oCGOTq/rQ4jlpazoWQr+vqxA7Sttf7Y+G7rbYSrBco6C6NNFBj/JiARSxGg3Urg/Mxk4RhNVLL4bvluwH+v1vAijCZWB5HNGb1rm1tIRaeSVFfbSjcvNd4inMZZHFvqUlUdB1mffeaKw+5OKBTnGtpQYZ84C7yU3c2erkWqjKkwlr1asnRqQTPryOG/CboTssjTESNBX9+m30lyIzKjxVkAfi41v8fdT06zXoYUEvX9gWEHrMicIUVd/BlIQDzwSd7lbpd6NK0G4XJ4leIEU1wGWf50l63vKlDjyEEMi382E4zDdF09qaVbIiO2yTA9l32o8HFm1Vjh+v6XbXrEPpaENtdYI/1kISF6N1wSWuaQBtDSkXUmIDm06cVHb4Iwaoekfz1gBX3zldtethchq8i1ddQ3hBXf2Ri+J60NJ2MLOLmvZ6Vq0sIFVoaz5g5Ik4hQ56cRlDT3BI26aWo55jkTgpUMOAHFDUSAb/vBdgIyTJiR84wLFwJbpAIKbsSCC0iAIDARhiPYn1r7i7kfMKS7IQRrtTLeFLd5EbDaW0GzOrLr/xmYw4vPs0YgiPfjQjk05aPMVvYlfgD/SHV6YEPhN6INXBLclH/U9eExEdG
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(186003)(6506007)(4326008)(36860700001)(6486002)(6512007)(6666004)(53546011)(508600001)(36756003)(33656002)(316002)(70586007)(8676002)(70206006)(110136005)(83380400001)(47076005)(54906003)(82310400004)(86362001)(26005)(2906002)(44832011)(356005)(2616005)(336012)(40460700003)(8936002)(5660300002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 09:00:16.5974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b012262a-1834-4234-1c10-08d9f1f3eaac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6093



> On 16 Feb 2022, at 13:07, Juergen Gross <jgross@suse.com> wrote:
>=20
> On 16.02.22 14:01, Luca Fancellu wrote:
>>> On 16 Feb 2022, at 12:55, Juergen Gross <jgross@suse.com> wrote:
>>>=20
>>> On 16.02.22 13:10, Luca Fancellu wrote:
>>>>> On 16 Feb 2022, at 02:45, Stefano Stabellini <sstabellini@kernel.org>=
 wrote:
>>>>>=20
>>>>> On Tue, 15 Feb 2022, Luca Fancellu wrote:
>>>>>> Introduce an architecture specific way to create different cpupools
>>>>>> at boot time, this is particularly useful on ARM big.LITTLE system
>>>>>> where there might be the need to have different cpupools for each ty=
pe
>>>>>> of core, but also systems using NUMA can have different cpu pools fo=
r
>>>>>> each node.
>>>>>>=20
>>>>>> The feature on arm relies on a specification of the cpupools from th=
e
>>>>>> device tree to build pools and assign cpus to them.
>>>>>>=20
>>>>>> Documentation is created to explain the feature.
>>>>>>=20
>>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>>> ---
>>>>>> docs/misc/arm/device-tree/cpupools.txt | 118 +++++++++++++++++++++++=
++
>>>>>> xen/arch/arm/Kconfig                   |   9 ++
>>>>>> xen/arch/arm/Makefile                  |   1 +
>>>>>> xen/arch/arm/cpupool.c                 | 118 +++++++++++++++++++++++=
++
>>>>>> xen/common/sched/cpupool.c             |   4 +-
>>>>>> xen/include/xen/sched.h                |  11 +++
>>>>>> 6 files changed, 260 insertions(+), 1 deletion(-)
>>>>>> create mode 100644 docs/misc/arm/device-tree/cpupools.txt
>>>>>> create mode 100644 xen/arch/arm/cpupool.c
>>>>>>=20
>>>>>> diff --git a/docs/misc/arm/device-tree/cpupools.txt b/docs/misc/arm/=
device-tree/cpupools.txt
>>>>>> new file mode 100644
>>>>>> index 000000000000..7298b6394332
>>>>>> --- /dev/null
>>>>>> +++ b/docs/misc/arm/device-tree/cpupools.txt
>>>>>> @@ -0,0 +1,118 @@
>>>>>> +Boot time cpupools
>>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>> +
>>>>>> +On arm, when BOOT_TIME_CPUPOOLS is enabled in the Xen configuration=
, it is
>>>>>> +possible to create cpupools during boot phase by specifying them in=
 the device
>>>>>> +tree.
>>>>>> +
>>>>>> +Cpupools specification nodes shall be direct childs of /chosen node=
.
>>>>>> +Each cpupool node contains the following properties:
>>>>>> +
>>>>>> +- compatible (mandatory)
>>>>>> +
>>>>>> +    Must always include the compatiblity string: "xen,cpupool".
>>>>>> +
>>>>>> +- cpupool-id (mandatory)
>>>>>> +
>>>>>> +    Must be a positive integer number.
>>>>>=20
>>>> Hi Stefano,
>>>> Thank you for your review,
>>>>> Why is cpupool-id mandatory? It looks like it could be generated by X=
en.
>>>>> Or is it actually better to have the user specify it anyway?
>>>>>=20
>>>> Yes at first I thought to automatically generate that, however I neede=
d a structure
>>>> to map the id to the cpupool DT node. Here my doubt was about the size=
 of the
>>>> structure, because the user could even specify a cpupool for each cpu.=
 I could allocate
>>>> It dynamically and free it after domUs creation in setup_xen.
>>>> What do you think could be the right way?
>>>> Or the dom0less guest could specify the id, but I like it more when us=
ing a phandle to the
>>>> Xen,cpupool node.
>>>>>=20
>>>>>> +- cpupool-cpus (mandatory)
>>>>>> +
>>>>>> +    Must be a list of device tree phandle to nodes describing cpus =
(e.g. having
>>>>>> +    device_type =3D "cpu"), it can't be empty.
>>>>>> +
>>>>>> +- cpupool-sched (optional)
>>>>>> +
>>>>>> +    Must be a string having the name of a Xen scheduler, it has no =
effect when
>>>>>> +    used in conjunction of a cpupool-id equal to zero, in that case=
 the
>>>>>> +    default Xen scheduler is selected (sched=3D<...> boot argument)=
.
>>>>>=20
>>>>> I don't get why cpupool-id =3D=3D 0 should trigger a special cpupool-=
sched
>>>>> behavior.
>>>> Cpupool with id 0 is embedded in Xen, it has its own special case hand=
ling in cpupool_create
>>>> that is giving it the default scheduler. I thought it was better to le=
ave it as it was, however the
>>>> cpupool0 scheduler can be modified using sched=3D boot args as it was =
before.
>>>>>=20
>>>>>=20
>>>>>> +Constraints
>>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>> +
>>>>>> +The cpupool with id zero is implicitly created even if not specifie=
d, that pool
>>>>>> +must have at least one cpu assigned, otherwise Xen will stop.
>>>>>> +
>>>>>> +Every cpu brought up by Xen will be assigned to the cpupool with id=
 zero if it's
>>>>>> +not assigned to any other cpupool.
>>>>>> +
>>>>>> +If a cpu is assigned to a cpupool, but it's not brought up correctl=
y, Xen will
>>>>>> +stop.
>>>>>=20
>>>>> Thank you for documenting the constraints, but why do we have them?
>>>>> Imagine a user specifying 3 cpu pools and imagine the cpupool-id is
>>>>> optional and missing. We could take care of the cpupool-id generation=
 in
>>>>> Xen and we could also assign the default scheduler everywhere
>>>>> cpupool-sched is not specified. Maybe I am missing something?
>>>> Yes we could make the cpupool-id optional, my doubts are in the fist c=
omment above.
>>>> Whenever the cpupool-sched is not specified, the current behaviour is =
to use the default scheduler.
>>>>>=20
>>>>> Does cpupool0 has to exist? I guess the answer could be yes, but if i=
t
>>>>> is specified as id of one of the pools we are fine, otherwise it coul=
d
>>>>> be automatically generated by Xen.
>>>> Yes cpupool0 needs to exists, however it is still generated by Xen reg=
ardless of the DT
>>>> specifications. In fact you could not specify in the DT any xen,cpupoo=
l compatible node
>>>> with the cpupool-id =3D=3D 0 and Xen will generate the cpupool0 anyway
>>>> (Xen internals are tied with the existence of a cpupool0).
>>>>>=20
>>>>> In any case, I don't think that cpupool0 has to have the default
>>>>> scheduler?
>>>> Ok I think I can create a function to assign a scheduler to the cpupoo=
l0 after its creation,
>>>> I would need to test it to be sure I don=E2=80=99t find something stra=
nge.
>>>>>=20
>>>>> My suggestion would be:
>>>>>=20
>>>>> - make cpupool-id optional
>>>>> - assign automatically cpupool-ids starting from 0
>>>>>    - respect cpupool-ids chosen by the user
>>>> Ok, it would start from 1 because cpupool0 always exists
>>>>> - if some CPUs are left out (not specified in any pool) add an extra =
cpupool
>>>>>    - the extra cpupool doesn't have to be cpupool-id =3D=3D 0, it cou=
ld be
>>>>>      cpupool-id =3D=3D n
>>>>>    - the extra cpupool uses the default scheduler
>>>> I gave all the unassigned cpus to cpupool0 to reflect the current beha=
viour, so that
>>>> a user that doesn=E2=80=99t specify any xen,cpupool node ends up in a =
system reflecting the
>>>> current behaviour as the feature is not enabled.
>>>> However I can say, if no xen,cpupool nodes are found then assign cpus =
to cpupool0,
>>>> else assign them to a new cpupool and...
>>>>>=20
>>>>> If the user created cpupools in device tree covering all CPUs and als=
o
>>>>> specified all cpupool-ids everywhere, and none of them are 0 (no cpup=
ool
>>>>> in the system is cpupool0) then panic. (Assuming that cpupool0 is
>>>>> required.)
>>>> =E2=80=A6 panic if cpupool0 has no cpus.
>>>=20
>>> Today cpu 0 is always member of cpupool0, and changing that might be
>>> hard.
>> Oh, are you sure? I did some test in the past for this serie using a Jun=
o board,
>> giving to cpupool0 only a72 cores and the a53 cores in another cpupool, =
my Juno
>> firmware configuration makes Xen having the boot cpu (cpu 0) to be one o=
f the a53
>> and it was working fine. But it was long time ago so I would need to try=
 it again.
>=20
> Maybe on Arm the restrictions are less problematic, but I wouldn't bet
> that all operations (like moving cpus between cpupools, cpu hotplug,
> destroying cpupools, shutdown of the host, ...) are working in a sane
> way.

Hi Juergen, Dario,

I will try to check the cases you list (on arm because I don=E2=80=99t have=
 an x86 setup),
I spotted in the code some places where the cpu0 can be hardcoded but I wou=
ld
need a feedback from you (and Dario, I know he worked around that area too)
since the scheduler code is very complex.

While I see cpu0 is hardcoded in these places:

cpu_schedule_up
scheduler_init

I can=E2=80=99t see the relation with cpupool0.

However here:

#ifdef CONFIG_X86
void __init sched_setup_dom0_vcpus(struct domain *d)
[=E2=80=A6]

I see something that I=E2=80=99m not able to test, could you confirm if tha=
t code would
lead to problems if cpu0 is not in cpupool0, since Dom0 is attached to that=
 pool?

Thank you very much for every feedback you can provide.

Cheers,
Luca

>=20
>=20
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>


