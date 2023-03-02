Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4686A7D16
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 09:56:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504731.777077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXej7-0003v8-G6; Thu, 02 Mar 2023 08:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504731.777077; Thu, 02 Mar 2023 08:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXej7-0003tB-DV; Thu, 02 Mar 2023 08:55:49 +0000
Received: by outflank-mailman (input) for mailman id 504731;
 Thu, 02 Mar 2023 08:55:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lklr=62=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pXej5-0003t5-Nz
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 08:55:47 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe13::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02e7a239-b8d8-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 09:55:42 +0100 (CET)
Received: from DB3PR08CA0008.eurprd08.prod.outlook.com (2603:10a6:8::21) by
 AM0PR08MB5475.eurprd08.prod.outlook.com (2603:10a6:208:188::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.19; Thu, 2 Mar 2023 08:55:30 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::f0) by DB3PR08CA0008.outlook.office365.com
 (2603:10a6:8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18 via Frontend
 Transport; Thu, 2 Mar 2023 08:55:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.18 via Frontend Transport; Thu, 2 Mar 2023 08:55:29 +0000
Received: ("Tessian outbound 2ba0ed2ebb9f:v135");
 Thu, 02 Mar 2023 08:55:29 +0000
Received: from f1553225d149.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3C405CF7-6DFE-402D-B750-2897FCA0A0F2.1; 
 Thu, 02 Mar 2023 08:55:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f1553225d149.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Mar 2023 08:55:18 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM7PR08MB5512.eurprd08.prod.outlook.com (2603:10a6:20b:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 08:55:15 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::f0e7:5f67:ed2f:a70a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::f0e7:5f67:ed2f:a70a%4]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 08:55:15 +0000
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
X-Inumbo-ID: 02e7a239-b8d8-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXgK/+wGSplPdHF/FL01UQYN7tMUop+Xnt4MppqqvLY=;
 b=yt+eDf0+NHts3hC29fT+Q0+P9JTMgx+sGeP/0y1hIzrBZGvuYie/vBQKF54N0OynHdKq/COK/VpneSYB8/0nkDs3hgzmm1oyVvHLRqo8ITGov2ayeW0i48c3XY2b+ATn/D+Wa7kONI5inEWe34VAF9rSCx7tO86CbZAqwfmDtMc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1c800889619869aa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieSvnFS5wu17LZVl6V5h1wqN9+++9+vkS3PUtdkEBDrfP8uLqseaaGZKjHw0JvoGzQ2WPfWuY9z3sHB5Y5PE79kxTUsjy1vKgq6SNMr73u9PJVsZkJmOtoJzVNlR3q1AroIdgjC8xnkEuyY3FucNLmxmjrgPCIasXV0A0pwSR8YV2W6sfvryICqqlw/0C2yi1AZGJ6ca6cD2nu97ckwo9Fz+wMd/y45SGxvSqd9b4QofJ+JA1R7tF7zPMvMrkM3F4WHfjBs0jCAKouwKxlv03yi0JjuSgBhuM8KCqYY9S4HbFDMRlbD0f6j1g43zzFthrzRqFYCXC+m4TcQBHCmqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXgK/+wGSplPdHF/FL01UQYN7tMUop+Xnt4MppqqvLY=;
 b=QesxT+pCHY7UozskjfS1yIThUTLdeGB2kU/xvxUlMq0JpQRMmLFa73FjyuYglk9PGFvtfSUuUQkpdehPEzaJwVU8K18uP5/+yOhmr9K2dCcvNH7UExthFp+dUCbHDL5XapU+1wdgj3KkH7Vi0q2MREJCfJu8VAV02kyLER6ohsaZHBJP01MWHAUJ5yltt/q32zRy+qlcsQJ4Un4PZ3m+g+FyHq0gVl0TJKQtIBWzNkdNICekYegMsynU7xnN/sVxfWd1CcR0t8bVWY4RivamkJiqCHUPsMY04697J1nTL7TlFqzsbCwx/pyVbhzNTuWnQ7nUJJJvQBp4vsfpjsrPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXgK/+wGSplPdHF/FL01UQYN7tMUop+Xnt4MppqqvLY=;
 b=yt+eDf0+NHts3hC29fT+Q0+P9JTMgx+sGeP/0y1hIzrBZGvuYie/vBQKF54N0OynHdKq/COK/VpneSYB8/0nkDs3hgzmm1oyVvHLRqo8ITGov2ayeW0i48c3XY2b+ATn/D+Wa7kONI5inEWe34VAF9rSCx7tO86CbZAqwfmDtMc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 2/2] xen/misra: add entries to exclude-list.json
Thread-Topic: [PATCH v2 2/2] xen/misra: add entries to exclude-list.json
Thread-Index: AQHZTCO+YULgtT6v8UGWpLW+tpxpla7moaSAgACPcYA=
Date: Thu, 2 Mar 2023 08:55:15 +0000
Message-ID: <23059C98-EEE9-4F27-AB54-4648629D497A@arm.com>
References: <20230301095320.264301-1-luca.fancellu@arm.com>
 <20230301095320.264301-3-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2303011605310.3680@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2303011605310.3680@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM7PR08MB5512:EE_|DBAEUR03FT062:EE_|AM0PR08MB5475:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f54edf-7d1a-4c9e-522d-08db1afbdff2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 A3dnbb3F6u7PrcJqTUfFTUL0fVZzukjk3SKH/JxRo/bJoN8boD+jFVAR129t+V3Jc6BVU1kRwuSpq10+68AMJQu3dZ4FR8RovyFMfwK8YaGzUt4Xr5KOz4CUF56fx8eds716Px7FvsucOYrbcjJfarvwtkxjd+Phz32AoBwdPnT842ptviBbJMJReXT+IUwjY1u/GUMxNIvimTCUndJsXN4+euSjGsucqZiLqHDDof6P3ccR8gVagZprzQ9VN69VBy22nDTQg8tFrsV29697KF9s7lugJUi0gUBTScxuKeIWxh54LEmkwkqv/SHESNvaizGU6QE7RJrWNRmjxDH33D21DTdk26hBJO+DbUpDEPOTO1AaiCgPxIaL3ESXoU/DxDkpWN4TLdOt/pcpXp+6+qmDjaGXU8TgHxx3dxyXK3QsEwQ3r2zV5SAr3sEM4R1LHt3AQbAISPVUzkh1eTU5213wVBXu5Hefyt+j6/78bzJmXTf3fWzO2Odh2LJloTM3m1k2pWk81SQOFvoMA+3KWYDjPP6fheMAydK+th9hgvp7jJnTMTsJTSkJ05lIZ3ziIR7L5J/DzgX0CVdwv5M3nRjv/4CuKxuckytFT2a0G6HoGz6XyRVNlHKtDOrQ9mnAyPF5OjsLEtQ+aKToj4zyZqcmzSNRKT6yv1W1lhBDLvnFsLD4Y10Kvyj5Gv926IqeTsSNIDsAlIZ9xYwaJWs8JsNfib9sSuHEcZrpnp289eM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199018)(36756003)(33656002)(53546011)(6486002)(6506007)(6512007)(2616005)(186003)(26005)(54906003)(41300700001)(316002)(91956017)(4326008)(64756008)(4744005)(66556008)(66476007)(8676002)(76116006)(6916009)(2906002)(66446008)(71200400001)(8936002)(5660300002)(478600001)(38100700002)(122000001)(86362001)(38070700005)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <23E69306C5777C45985E75626D3F2063@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5512
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3933473d-a4fb-4260-ed78-08db1afbd74e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5k6oOK5ox/xJxbAxwzTqdur8vdV+ZhH3CxiDFxIPgElEnPdufrP7g3AY9fUr/EVVW+XiReDsy10CJTuKj9BV9j5DbkwIFdX3KTpGrsb1MJ4O/vZ3LDt+0eg9efllRDX8Uyfxtt5zEI5xBRriRGGOPmZqyTDckIQfyHuVKkk1hEKO1HTLpd5m3rpVkYs7dTQA9Wv6sFlorXx2Y2cMLO1mkD6J3ByMPQ0Q2qjdDQ6Jtqdc6FpAQ7BCyrpGtzsTznyKNgkvNs8XZXYSO8vrkr27JtJtbt1IOrj1RH5aJS5YHq2e5bbApenG7L1s9G0flmvgG/SSoTe7vXFsA7ejUbcrzTyvbG0hRAv0DI4DK7PydLW8ho9ThTaCKfTIJy51pUAVG5j6kc1HrgvPgwwQQL6aVd5S6ZzOSvUv1dC9kQmQskGBuQlXizpEaF0EDFbt+EDjw5bfYC1VOPzaHQgmAtBhmwh4GePlHFlRBZpBuSkjiaK58TPjihoVjIQ4S95INUdKJirRGL4ANapoQT6mmI1o4wEe2bEgOZC72oNZZ0GoXlcizX1FJgmS6honarSdL2vReKQ4PQZzoR2pwTXDoyt60eXzxmFKWAURTOxO26rrOGPqy9pm5mjZcaPV+qjjwfRshIdtoptCfzjbgADvikFRiSAiI786ozvuVDm4xMEMB80WTy51BuRsdbWnxtG5k9wQBYsiBYOGVV09HIdWtINvpw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199018)(36840700001)(46966006)(40470700004)(36860700001)(47076005)(33656002)(40460700003)(36756003)(5660300002)(6862004)(8936002)(82740400003)(81166007)(478600001)(356005)(86362001)(40480700001)(82310400005)(186003)(2616005)(26005)(336012)(6512007)(6486002)(53546011)(6506007)(70206006)(4744005)(2906002)(8676002)(70586007)(316002)(41300700001)(4326008)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 08:55:29.9214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f54edf-7d1a-4c9e-522d-08db1afbdff2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5475



> On 2 Mar 2023, at 00:21, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Wed, 1 Mar 2023, Luca Fancellu wrote:
>> Add entries to the exclude-list.json for those files that need to be
>> excluded from the analysis scan.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>=20
>=20
> I checked the results both x86 and arm and they look much more
> reasonable (with the exception of the way too many unusedStructMember
> reports on x86).

Hi Stefano,

yes I will send a patch to suppress unusedStructMember globally



