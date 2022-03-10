Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F134D442E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 11:04:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288245.488823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSFdV-0008GO-2M; Thu, 10 Mar 2022 10:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288245.488823; Thu, 10 Mar 2022 10:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSFdU-0008DU-Uj; Thu, 10 Mar 2022 10:03:08 +0000
Received: by outflank-mailman (input) for mailman id 288245;
 Thu, 10 Mar 2022 10:03:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGlF=TV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nSFdS-0008DO-Jw
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 10:03:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46ae40d7-a059-11ec-8539-5f4723681683;
 Thu, 10 Mar 2022 11:03:04 +0100 (CET)
Received: from AM6P193CA0062.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::39)
 by DB9PR08MB6361.eurprd08.prod.outlook.com (2603:10a6:10:261::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 10:02:43 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::f) by AM6P193CA0062.outlook.office365.com
 (2603:10a6:209:8e::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21 via Frontend
 Transport; Thu, 10 Mar 2022 10:02:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Thu, 10 Mar 2022 10:02:38 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Thu, 10 Mar 2022 10:02:38 +0000
Received: from b29cf4e2649f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0BB56AF0-D4E6-4784-976E-D5160CB6CB3F.1; 
 Thu, 10 Mar 2022 10:02:31 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b29cf4e2649f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Mar 2022 10:02:31 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB4478.eurprd08.prod.outlook.com (2603:10a6:803:f7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Thu, 10 Mar
 2022 10:02:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 10:02:29 +0000
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
X-Inumbo-ID: 46ae40d7-a059-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OahcQ3uNb0fvdGGa4Pnu0zGAEWlRe6iFXLA/kCpNWM=;
 b=O5bZ1LkvjWfqbuH6qL852t+bAACFQQyS+psb5q8Zail86zqF3wm7PfhMoFgI6ddmyhZsVr+2akcKM8KAE16eRGeV5t8oRpb8NDR3omk0E8cKKKkHhidek20RYcAk15/RNKU/dbQ2EKB1z/76r5U2ejuX8O5LsNB38YVpiyd2w2o=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 54ae81c4c091ab40
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0hO/ogRJPZjvzTJBXjwQGZTtIusBtWwf5jEiNMgNj0NjjjUm/8ieoDkF3Ks1SQPE1QT2V5DbxFuWZC/qCjobJediwqbZmE9wbuZs9HVNOuA/bH1stcEIxfM5i40iUQ6Glnqpb1piR9zq6LFH2TNS/vbFePrBGa7U4tNu37rpS1PJhiQfealrWZl7gVpGwCKsBNwtt5S23edxWa643E2UhH3QRNRSZz0bxGgNBsylBXYyCw9NfB4h1xuVahchDGNU0PQ15nKTWHZw+CIBPwhuwbHMa1MfF1v/g11n0y2sktupMdr+0pxA8bk/MEpKQE40sg2N9mUrsm24hnlS5WBoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OahcQ3uNb0fvdGGa4Pnu0zGAEWlRe6iFXLA/kCpNWM=;
 b=U8GVDGxtCByARRyW8CK68tvwVBbdH7wQtyxSKzqkN3bN5nIUcZKgTVOxxk2HCcjBOtQ1222OCDyD1QSrumDzZqr0COR7NbyHcYDKrhrGST77HBJjzkQvVFFYtOPUtjLtsGOhwlWuQmh5y6IJM4yyijf7vO24QdN2+VTFD0HN/hS0ALKrUtfKrMu3xTDyqOxEnrgJJQ67aLLS0qtKsMtgNYmHUkrOUeqofka5tUDK/Mi7fN9p+n7Sx+eK9GDvPDUG3a1ZfAOr+Gk2GFgycHNDV4qiweN8/bVzZ2gewzSI6SPwXEbiTDPTS/rI/YyiZyTHP9D56AUIJ3Ziu+MWz+bukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OahcQ3uNb0fvdGGa4Pnu0zGAEWlRe6iFXLA/kCpNWM=;
 b=O5bZ1LkvjWfqbuH6qL852t+bAACFQQyS+psb5q8Zail86zqF3wm7PfhMoFgI6ddmyhZsVr+2akcKM8KAE16eRGeV5t8oRpb8NDR3omk0E8cKKKkHhidek20RYcAk15/RNKU/dbQ2EKB1z/76r5U2ejuX8O5LsNB38YVpiyd2w2o=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>
Subject: Re: preparations for 4.16.1
Thread-Topic: preparations for 4.16.1
Thread-Index: AQHYNF0EFrPPp9sw2ESIVxGhRdwIe6y4UusAgAAQQAA=
Date: Thu, 10 Mar 2022 10:02:29 +0000
Message-ID: <4DE5BBE4-F228-4584-81AD-D0A41858FDB9@arm.com>
References: <b9be95eb-7a6e-9f1b-6b68-6d08d6329cd1@suse.com>
 <4fe170af-9120-0203-bed9-895380a2ff0a@xen.org>
In-Reply-To: <4fe170af-9120-0203-bed9-895380a2ff0a@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fcfe4441-371a-43e6-8b43-08da027d1bc2
x-ms-traffictypediagnostic:
	VI1PR08MB4478:EE_|AM5EUR03FT047:EE_|DB9PR08MB6361:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6361E618BF15AC988C1037229D0B9@DB9PR08MB6361.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uUcOfQXC+8Yk+HshakyZA1/6Qucys7JLz9lr20WJ4/RccyqBJeK/jkydyUKGErcWCfFZp9yhGw2tjf9nFBDUrPyyHnegP17/s8xyjwens2SpFxFQM7Wpys0GkpGO1VVQXBlby25MWBcQOKVfDQ1kvvDdzesv1IYeQuuqK5H9um5RJRGu5/JDDGjK/WnA56qdNLdt88ndVJRRiD4eNUslImpsTv0vP59qg+vTX8Hxw7RHDqzhl83PAljkmxUjaUGHfZ8II4odyrdznIvi0acVFSaRs7Hhax7O8quUcwN1qeru9W/t1zvJMmHQAsjlvER+kRwBttAenxMjHefsHlk4pIxm/0/U5RhXnPmgbcaxK2D0MIwe3bW6LqreVE91RRMB77s4LXqQ8YDybYJVhRoaAKN7K2F3ykRM70tC/6UQOPR7Cp6lyV+aHYdoHY4x4xGTT+UgQ22n4cHI2QyVrpMR5bc9GE33B/BDdn9mBJJdnI4QHSkb65x4blRF7LiyqTXjZ6naMsdUtjz5ACOz23H7A3pDUIVK3F2Eh8W3dNwwMucVtQ4EsGMLUoFOaBERCIRSXb7FwdQ0oGJI5REGmBDUPOoy5u0l0GFQj+aKWqpQOCB4nPz2PIz2p3L9Kr1m9/Cw1kgYOFlNZlevV+x25f0n7omkgPtMS0jmRkaqCqH2m7U04fG3aOVz6Vv3AK1wLjiccRNaTNYFzIkiI6R+PpPQgs5ESF7ZTJ4rRhY1Rt6CItq74lVeKX/9VIneKYKmEGjw
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(76116006)(6486002)(4326008)(2906002)(8676002)(66556008)(508600001)(122000001)(7116003)(38100700002)(6512007)(38070700005)(8936002)(6506007)(86362001)(54906003)(316002)(6916009)(2616005)(33656002)(71200400001)(83380400001)(36756003)(186003)(26005)(64756008)(66946007)(66476007)(91956017)(5660300002)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E8CCCD3D81803446A780154CECCB7B84@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4478
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	baa08f42-d134-4d9b-bbbe-08da027d1628
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JktVXTjhl0o8jbQpHoDTM4RjZ+29zNSproPOQ6iRr70+LZqBHTFAc4xPVHS/Tud6C9kyafyYIUMABYXvwD/EveJfOlEDQ8wy7C+T2/EfWBVXtPOnu/hQlyoEg00Sop7PGrl5nFc064QLEW7oDMnpL1M/U5jwKFbPgNIWXhSwbU3jC7SddV4a8HwJU+1bnD76D4H8l5uZwifCv7YjO+ebVsQwFZJp01J52+/Q/koeylWKwKFaoZvuG61nqjZYF89gwFwaZRGubXnaN5y9spOP3+Hi7EtbgLYDsQ7qypuOgZYEI64JW1PgoDPIargk1z55R8cvTFsK5NrCUvq4GFmhxOZhxoQqlc/stswgsmxsAnxInplRclY/HvEIdtPFPxy+fYnns2jQBClyvlM6E0OTt/ftjv3JiLYWbvdGwOaXJH7SCldfbs2nJvJD6AwWbSBjnpg4CVLARpHHJnt36p5M5Bng1NZJiKs0sPsqwMyZRfwaGmF2xeo0ORy6llo+6HVp+7CluJrEPD6mTdyiZjBRGRd56Fg9gcTrFkS8CUouJeJC/TIX1o6//Au6orBRh6n6x+4N5Yq8PtY3ghOOOGSGczLurJY9IgLDaPl7dVX+QGOqBMY1EtrKV3R9QjCHnor9Y3efV/gnW1dS8P2EtyOt7I/0gDI8ntIzQdiGwCkL8A9nahpgClQbrgWPL6ZnectHXdZtF1Lx+MZdRof4sGxCiA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(70206006)(2616005)(186003)(26005)(336012)(7116003)(63370400001)(36860700001)(316002)(6862004)(83380400001)(8676002)(4326008)(33656002)(47076005)(107886003)(63350400001)(53546011)(40460700003)(86362001)(6506007)(70586007)(82310400004)(8936002)(5660300002)(6512007)(36756003)(6486002)(81166007)(54906003)(2906002)(508600001)(356005)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 10:02:38.5679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcfe4441-371a-43e6-8b43-08da027d1bc2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6361

Hi,


> On 10 Mar 2022, at 09:04, Julien Grall <julien@xen.org> wrote:
>=20
> On 10/03/2022 08:57, Jan Beulich wrote:
>> All,
>=20
> Hi,
>=20
>> the release is due in a few weeks time.
>> Please point out backports you find missing from the respective staging
>> branch, but which you consider relevant. One I have queued already, but
>> which I'd like to put in only once the pending fix to it ("x86: avoid
>> SORT_BY_INIT_PRIORITY with old GNU ld") has also landed in staging, is
>> 4b7fd8153ddf x86: fold sections in final binaries
>=20
> For arm, I would like to propose backporting:
>=20
> 32365f3476: xen/arm64: Zero the top 32 bits of gp registers on entry...
>=20

Agree (not changing the fact that Stefano should confirm)

I would like the following one to also be considered:
f3999bc: arm/efi: Handle Xen bootargs from both xen.cfg and DT
f1f38e2: xen/arm: increase memory banks number define value

And maybe this doc fix:
620ed2c: docs/efi: Fix wrong compatible in dts example

Stefano and Julien could tell what you think ?

Cheers
Bertrand

> Stefano, what do you think?
>=20
> Cheers,
>=20
> --=20
> Julien Grall
>=20


