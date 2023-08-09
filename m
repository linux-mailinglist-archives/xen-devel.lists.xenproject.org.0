Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B52A7761D9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 15:57:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581133.909691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjgc-0000ZL-CD; Wed, 09 Aug 2023 13:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581133.909691; Wed, 09 Aug 2023 13:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjgc-0000W7-8x; Wed, 09 Aug 2023 13:57:18 +0000
Received: by outflank-mailman (input) for mailman id 581133;
 Wed, 09 Aug 2023 13:57:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmRr=D2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qTjga-0000W1-L4
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 13:57:16 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20609.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a514c65e-36bc-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 15:57:14 +0200 (CEST)
Received: from AS8PR05CA0011.eurprd05.prod.outlook.com (2603:10a6:20b:311::16)
 by PAWPR08MB10017.eurprd08.prod.outlook.com (2603:10a6:102:34e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 13:57:11 +0000
Received: from AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::ef) by AS8PR05CA0011.outlook.office365.com
 (2603:10a6:20b:311::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27 via Frontend
 Transport; Wed, 9 Aug 2023 13:57:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT041.mail.protection.outlook.com (100.127.140.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.18 via Frontend Transport; Wed, 9 Aug 2023 13:57:10 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145");
 Wed, 09 Aug 2023 13:57:10 +0000
Received: from 17dc439d95f4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 33DE6BF8-83F2-45FA-9D2A-BF84218584BF.1; 
 Wed, 09 Aug 2023 13:56:31 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 17dc439d95f4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Aug 2023 13:56:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8116.eurprd08.prod.outlook.com (2603:10a6:10:3ec::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 13:56:29 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 13:56:29 +0000
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
X-Inumbo-ID: a514c65e-36bc-11ee-b281-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHdWBxCSqPq2YeMQiK1OXXbKH02/DFQllBT60BSrEtA=;
 b=BU8uAtEewF5RF0svZuYYj1mAwAtNypuILG0caj6Oq8DImxPi742ChkcvsdVgfMn5+0IWEDuTxO3AHWN98r1RObQT3RzvOocufgy24UgpslYYbwPO97/oDAoOWRAuecHO1BdrdC/4hMPKKWJk9JRYKqsl/PywQOUwFxBTs0UbsA0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9af028e2086d487f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m59RVKfLoVYh6VOhBHhZEZxTXm0EubVwNX97wZXaW9+9y5Yzf9jNeSZAkZJc4IVbAr/LqI+GEYTDzGXJhooOteu1/kbSJaB+JEaobVNGSLhovjI3Z6LlV4z+bEr7axScxyteLc7Y+Lmk8BLOZ6O2/lPItdOymPs1KEYxG7dCCP/lSokv1xJ2kzJFJgkj4wfDonHwlxhZBR+UXZyVmHk7nytMaNdP+cAZUpWmWxMwb0xIO7ylaxLLylV37c4uHgGdA5eEBmqmRCM1QcrH5v1SCqh5k0CSZnEMsUwFLBjTUjn57hcrewTdrr8WhuDavSfVD47LUuuCQZr6yDOFmL/cNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHdWBxCSqPq2YeMQiK1OXXbKH02/DFQllBT60BSrEtA=;
 b=UEU7TS3bASADIbhBvzkCXRTQhYx/Wc7XfC19i+NFYMCaqLGSEZ0sPWTEsE8UMJ0G6XjtYRyk76YOL167w5fZo9axF+qm9xrMS+Xv0DVhGP742M9hjL9uLsuDsffI4+DPOiao364WV/fWo2AFWj7pO66z/EUzH73kSaDMmvDJ39LOVLrY6TVISLaa3MBsCICaL/eKLvCTdq/S4TbsTUH09K359JhnwZIRyr/aMEDygrxIuZwkSl1iIm6J4HWZx6tuac7ATtH2PGcrYIb4mNwo//E1DkHTsI+6KamrX3KatSm9IjFgDNsdmnqVPK/Qz5RSaeDPOJWlCFUKgVDaJndDOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHdWBxCSqPq2YeMQiK1OXXbKH02/DFQllBT60BSrEtA=;
 b=BU8uAtEewF5RF0svZuYYj1mAwAtNypuILG0caj6Oq8DImxPi742ChkcvsdVgfMn5+0IWEDuTxO3AHWN98r1RObQT3RzvOocufgy24UgpslYYbwPO97/oDAoOWRAuecHO1BdrdC/4hMPKKWJk9JRYKqsl/PywQOUwFxBTs0UbsA0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH 2/2] xen/delay: address MISRA C:2012 Rule 5.3.
Thread-Topic: [XEN PATCH 2/2] xen/delay: address MISRA C:2012 Rule 5.3.
Thread-Index: AQHZypb0I6Psnfw1ike70N3zDUOJFa/h/VwA
Date: Wed, 9 Aug 2023 13:56:29 +0000
Message-ID: <E970F516-F626-4F8A-8A82-DF3E31ABEA20@arm.com>
References: <cover.1691567429.git.nicola.vetrini@bugseng.com>
 <47e2c8770e38ab064cbcdfaafa8467c5e733f11d.1691567429.git.nicola.vetrini@bugseng.com>
In-Reply-To:
 <47e2c8770e38ab064cbcdfaafa8467c5e733f11d.1691567429.git.nicola.vetrini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8116:EE_|AM7EUR03FT041:EE_|PAWPR08MB10017:EE_
X-MS-Office365-Filtering-Correlation-Id: 16982fb9-ebd9-42be-80d9-08db98e086cd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 a8NBy3xVLczwDz24Tvmd+dQu1SlY5vGu+6qBYXMyGaPTcakznU2HEC5XLbfsUTUELLZu87znroeU59TxB2gZyDdkx68l8AZl3hLx1QZ1nAjcDgF5yow5MVgpaZOg1zwsDX0c7DhGipkan/x0c0/hNzeqNh874iXtA3WileawrBQOTEpda/2i/epFeK/NLkvlTMYcZ3Uqd0PEhHlNlZaL1HKWSuBKN1VTojlp4R+1CgkkY4buglfMpgv7Feug0bfBn/jb8u9HzMv/BKOTZwpB/GGZf2HY2ViPQZpxQKz5PUuVXeKPkFzuGaAzcNC7f0qhK7OsN3kEE8wfN3ggbU3b24iSwGSH3iiQZ/pemCNKFoAuQVdnLZd0Qpfd6O8sbo35eC3249hSfW33jshS/nxYse1X7aLGfGZnIYbi9Oqf29r/yttumjiW1wRPhvy5bqF3TV//8L440kO9sazjXdFvQ3AB/H2nys+s5n5oRtU1GdNVyZgbPBXI5An3n5xqJUJgShP+TKgnmb1GqfQNwbMQvidMHn6q0rUSTtPGe5otafIsfnwu1wn/nbUdR4/laUZfReOIEMVFSiFEzQ/BxWdrQ9H3t0jiA8gWl2WcM0Cp9aYBAob8xUFeqwtr4P+7CKu99kAQEU0Y0Vt3B6M02SuReg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(186006)(1800799006)(451199021)(316002)(83380400001)(2616005)(2906002)(4744005)(122000001)(36756003)(71200400001)(6506007)(8676002)(5660300002)(53546011)(6486002)(38100700002)(26005)(66446008)(64756008)(41300700001)(6916009)(76116006)(66476007)(4326008)(66556008)(66946007)(54906003)(33656002)(86362001)(91956017)(38070700005)(7416002)(8936002)(6512007)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <662F63AFD3C9A540A429F0C264F18699@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8116
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f04c8d7c-c9cc-4470-87fc-08db98e06e34
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XQwpPbadcS1PVa6UYfux1C4Gg01JCt8E2dXZOW0kortazTsBUJFFCj/MLQKaNAySw7dgT1CjDJqJiv6ae0zNhWWyFviCAUvIfDAe9q7uCsCRo36+ztFiykipiPwlNpQeXrF45Gxil9yaRks7jXRvursXXWjlFJEwE9BWyYpGlxC4QxiphHWE9vNDHlLM4fHdEm8ict/Pi8k7UCldzh0lx1rnubGc4fvYkBiM+Kctt09nDOgYBEZOTK//FisR6+IVsD+ojQs/5VsRV9Paj7XaxxDY5VltHu6DP6V0xuNdKLGhyt3yc/9/6pd4gv7mDW+kradKkdWNiixY9KAu/aBktrn3PVMsnNcdcIJcLe7NMYlQOSncAbRnvbmMxZRoPTRQSoJH5TIgCaBf1xldB/CM6zXEvYWQEz5ZLWb+OGZPHJuQgSLTtGOpkFBhMVzEOYCMNhVgdbzcnd6IfE8350e7JJ02f3xt8BWrES87fOsTbjvo+NU/TG2nojIwVMQxp/HeMFf194UDJTBVxrfxry1IAKqj8idQ7fO2C/+Iz2uXO2gnVD6r+AcXkbfVwoAE1jw5wYXOvCVy01PqQxNWziNRiSxufbvzcObbvyIIv2k9KSjA6EKZvGeDdCYimdhC8FDzJEfetHFqiaYZPcWvaP4gBsksqfUOacqDkxmBr5pc+i0Hl8ShrLNgjNUMFoQXsvt0ccXYYHliW/Q1y/VXFNu5yMCwDKeYHzpssSNQ0zrBDXG8yT6rMJq6LUvCqstUqCR0
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(1800799006)(82310400008)(186006)(451199021)(40470700004)(36840700001)(46966006)(2906002)(8936002)(41300700001)(316002)(40460700003)(5660300002)(6862004)(8676002)(33656002)(36756003)(86362001)(40480700001)(81166007)(356005)(53546011)(478600001)(82740400003)(26005)(6506007)(54906003)(83380400001)(6512007)(2616005)(6486002)(36860700001)(336012)(70206006)(4326008)(47076005)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 13:57:10.4143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16982fb9-ebd9-42be-80d9-08db98e086cd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10017



> On 9 Aug 2023, at 08:55, Nicola Vetrini <nicola.vetrini@bugseng.com> wrot=
e:
>=20
> The variable 'msec' declared in the macro shadows the local
> variable in 'ehci_dbgp_bios_handoff', but to prevent any
> future clashes with other functions the macro is converted to
> a static inline function.
>=20
> No functional change.
>=20
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> xen/include/xen/delay.h | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/include/xen/delay.h b/xen/include/xen/delay.h
> index 9d70ef035f..9150226271 100644
> --- a/xen/include/xen/delay.h
> +++ b/xen/include/xen/delay.h
> @@ -4,7 +4,11 @@
> /* Copyright (C) 1993 Linus Torvalds */
>=20
> #include <asm/delay.h>
> -#define mdelay(n) (\
> - {unsigned long msec=3D(n); while (msec--) udelay(1000);})
> +
> +static inline void mdelay(unsigned long msec)
> +{
> +    while ( msec-- )

Does misra allows to modify the function parameters? (Truly asking because =
IDK)

> +        udelay(1000);
> +}
>=20
> #endif /* defined(_LINUX_DELAY_H) */
> --=20
> 2.34.1
>=20
>=20


