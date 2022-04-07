Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 729744F799A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 10:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300506.512623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNTY-0002EP-Ld; Thu, 07 Apr 2022 08:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300506.512623; Thu, 07 Apr 2022 08:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNTY-0002Ar-GH; Thu, 07 Apr 2022 08:26:44 +0000
Received: by outflank-mailman (input) for mailman id 300506;
 Thu, 07 Apr 2022 08:26:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WyQK=UR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ncNTX-0002Aj-0K
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 08:26:43 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe02::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73b243b7-b64c-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 10:26:42 +0200 (CEST)
Received: from AS8PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:20b:311::34)
 by VE1PR08MB4704.eurprd08.prod.outlook.com (2603:10a6:802:b0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 08:26:31 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::b0) by AS8PR05CA0029.outlook.office365.com
 (2603:10a6:20b:311::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22 via Frontend
 Transport; Thu, 7 Apr 2022 08:26:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Thu, 7 Apr 2022 08:26:31 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Thu, 07 Apr 2022 08:26:31 +0000
Received: from 29e1ab1c2663.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FE2F45BB-AEFE-47D8-AF50-9914C823A381.1; 
 Thu, 07 Apr 2022 08:26:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 29e1ab1c2663.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Apr 2022 08:26:20 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM0PR08MB3011.eurprd08.prod.outlook.com (2603:10a6:208:64::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 08:26:18 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 08:26:17 +0000
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
X-Inumbo-ID: 73b243b7-b64c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAf35f9MNqHW/6RMCK1wmqGwGM3tG+Fuo6ex+MaKSD4=;
 b=rBcBoMyIRJrRC0LzWf78EF/4+3FFpNi2wQCmaASKt4E+4rei7idsGoznDutBYC7phIiK2bBl/kmnjJ9Sy6gqRY3j6MzCauLFfL4BqWU8MpmNL6aLBl3D4uu6TRuAmjHJJwIkRTYTr1kXIZL7oe+20RfS1yuapnEzhlXFoSTy+0o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9d1d0de6160579a9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miD2w7UPezTtTBxu47NXPTwDfZh2QRTbA1p5Ma3Gu+yWS0DOjPfxgc2fOVCIFbdqNq2FqEDKEa58892N9bNeO8jAMuaywgpmwBIftShX+LEOit07hRVKygOlrt/Tam8e7uUe7g0YbGNp24TCv8MQxT1FIzhNg8ufeaNvhSA6kVaPepobOoGjXL8WLZqprvWSYRwO2yjOQDEVQgKOj+EG2+ITCjWPjYxU1j4N9mmq2ZTDEj0l4RQWKwiAe+6QSBY9VZHgFooKXmZXohVB14DRXfc0XN1MdDJnVAN9jtEG32Alxi+wl97hKi4XVcdZZ6TiUYlb0FkRq/KA8H3wyE6mNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAf35f9MNqHW/6RMCK1wmqGwGM3tG+Fuo6ex+MaKSD4=;
 b=MGTLkhXR7kbxvPDPmvuI3hnE9Q/kgzV+Btp4WvvaLT6Y4iHhwoMHiNQ2VLnq1e6DsSjBSfE0zXhirRZ7ojEGBDU+T0u7E7bQ94MMIz3SJWnOcxJyQwZAzUNJlV1UPs7RI50BaQWE7bcE1jQdz/70hGvJqin1Z9PsWI2hYOaAKH7zCseDVXIk/WgJWL8MzW7fAwnsi0HFtC6+bzHYhYN9UF3aOViXIV3YwMPVGHLXqKE4U7zM253XokD9sgZR+baIW++yYt2Xhu0N/3Wa4EV18rdOoon8GboEvDxCHHQ/7itNEx8Dr4nJTxxQudC664DZPv3XW5MyZ7g1JR6b/M069A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAf35f9MNqHW/6RMCK1wmqGwGM3tG+Fuo6ex+MaKSD4=;
 b=rBcBoMyIRJrRC0LzWf78EF/4+3FFpNi2wQCmaASKt4E+4rei7idsGoznDutBYC7phIiK2bBl/kmnjJ9Sy6gqRY3j6MzCauLFfL4BqWU8MpmNL6aLBl3D4uu6TRuAmjHJJwIkRTYTr1kXIZL7oe+20RfS1yuapnEzhlXFoSTy+0o=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 1/6] tools/cpupools: Give a name to unnamed cpupools
Thread-Topic: [PATCH v5 1/6] tools/cpupools: Give a name to unnamed cpupools
Thread-Index: AQHYSMtXyn8LVgjvo0+6iWYmcNxLBKzi+zCAgAElhoA=
Date: Thu, 7 Apr 2022 08:26:17 +0000
Message-ID: <DC9DBD73-6E4F-487E-A9C4-F86202059ED1@arm.com>
References: <20220405085741.18336-1-luca.fancellu@arm.com>
 <20220405085741.18336-2-luca.fancellu@arm.com>
 <Yk2p73WCT5Gi85vK@perard.uk.xensource.com>
In-Reply-To: <Yk2p73WCT5Gi85vK@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fab108d5-9ae6-4ea1-cfe3-08da187051df
x-ms-traffictypediagnostic:
	AM0PR08MB3011:EE_|AM5EUR03FT007:EE_|VE1PR08MB4704:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB4704D6FC3A37A9792E846163E4E69@VE1PR08MB4704.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XVGDJiXJwxupogkqUmojGcqw2tx6G6h7772JKHxBL2n/V9RmTPGGRmUSsbs6yh+LmrZxJ/ckNBkRcApC5D8fx92dwIq0zIb9kuBjdxfRgxoLX+TF9y9/JHSX18EVKKUxUAroNUCOOmPWkUuNKjyeMKCzNecRKwvbMumUhW2dJFeXTxc7ZHF2eGvdPxNIXdbd7hxIOnSLp1HbcESHLDe5Hr41lDmjjBKz8XvOtgxFfQSAcWB5zBVtC1RYG2O6hespJORGZ9fyBwl35otYVHcEJW1wor0STRgm3X8hkd95zOyBwFMQ/vzqOaw/QAzqOzn4Lk43rYSlLfR58WsF06LwHcCQ+xNWfzbZH+pnwqrgaPJKhtOpWVHL1ytUdFI2eO3IBQfB3GbTu5lQeQMFrDi74bvR9L8YV0i2JvcUK8fshUH0WpBVzLFukc+mZDf8lO+VgQTe8E7byz7ZH+20k4RhhHepC1Xc9W/h9n7jKTe+ZkANmL+h4Y/cVuNsvqY36S6yX+Re/ZHQu0vmiCayT3CEBV86QCisionIsATpSrC1y51OyQjMSqour99/fxiIK+dp32tF6uF8aAFAkAU6vj0NYrwsb9NiVOFEE5rJ+tiNQvkSKSvwCV5PBFCRq5rc1y1zQ9Q0K3X0DLzhGhqR0WFVfrZuK515mXKV2d9VZBy8qmSBPvd2u+c8GI/LfJ1CBZBxwHO99oincunSOA/QI+nDaj063e7G1M39jXdL963wOro=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(6506007)(316002)(2906002)(38070700005)(54906003)(8936002)(6916009)(5660300002)(2616005)(6512007)(38100700002)(66446008)(4326008)(66476007)(8676002)(64756008)(86362001)(33656002)(76116006)(66946007)(508600001)(91956017)(26005)(6486002)(186003)(122000001)(71200400001)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C26EBC72DCBE4F4F9E773A2FAAD90D7D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3011
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	83db19ec-aaa2-40a7-2056-08da187049ce
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4iDYHEB+NmmFk7tiFj/9Iv3KZT8or04rkcamk93kjcxjAk/RMNy1wbJWyWm+OnO4KKjaWOZCAW9fJkFRJd9OyY/dhLcRVmOqs+BIPkOYZfGirJJHyeIaxiNIkCeJgN3kxiLjOva+SjyEtrTP/vlDHLK/at6TOiRC4oFvMVXUkbNNaH77HM6qjz7OblaTRgQDRMoXdKA4SCwsDFmvHsNmnogGvooY3X8AAzBq2GSbo7RsYJ6yVNa0MxVjSaRkh31m3zqxjPVaBh91iSCLmNevV6Iu7HukNmxB8WwIthUV/7bPz4VOfpekg386kBRf/0O2kJhY/Ko6q3jLDp6K2o4MasU4nQPB3G1nu9Yr3Tzv+EqFNsmEZ/fcg3rIy+9dWk3CXtQL9osQE+NTEmh2F79PDmMzY0gMkjtqOBXkVRSK5KwNY6NsLrBXBuphmrUND8Cz2TRIvWIA6FyuYAf4xKJDT4MIQzjbGOi/54oiKUHPXKtVJmE5O1zIko0bwJr1zGfh1hK/NqRLxzuF3sfY1x0Q+K+XqnGLsbLsZCI6eGZp2Lb6M6Rb9WOi0bQ98VphqkRpF+ufo9648Fw5eAlQN5snjiPRoHlPuN20e258KHHslBYu2KFLCAD54Fs1YXJ0QfJkASMe0quPu//JoXW3ftfoU0kGeODDyWkCycubW9KE8EZqV3jvTD8Ie0EshTAeirLG
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36756003)(186003)(107886003)(508600001)(54906003)(33656002)(82310400005)(8936002)(5660300002)(6486002)(26005)(2616005)(2906002)(47076005)(6862004)(4326008)(8676002)(70206006)(336012)(6506007)(316002)(356005)(40460700003)(6512007)(36860700001)(81166007)(70586007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 08:26:31.4773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fab108d5-9ae6-4ea1-cfe3-08da187051df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4704



> Could you rework this loop so that "goto out" is always the right things
> to do in case of error? That is the function would always free()
> "pool_path" and "pool_name" regardless of their values, and we only need
> to make sure both are NULL when they are already free. This is to avoid
> having several path in case of error, as this could result in mistake
> later. If there's only one error path, there will be less likely to have
> mistakes. This loop, at the moment, is using three different error
> paths: "goto out", "goto out_err", and no goto followed by a standalone
> goto.

Hi Anthony,

Yes I will rework it and send v6. Thanks for your review.

Cheers,
Luca

>=20
>> +            }
>> +            pool_id++;
>> +            if (!xs_write(xsh, XBT_NULL, pool_path, pool_name,
>> +                          strlen(pool_name))) {
>> +                fprintf(stderr, "cannot set pool name\n");
>> +                rc =3D 1;
>> +            }
>> +            free(pool_name);
>> +out_err:
>> +            free(pool_path);
>> +            if ( rc )
>> +                goto out;
>> +        }
>> +    } while(xcinfo !=3D NULL);
>=20
> Thanks,
>=20
> --=20
> Anthony PERARD


