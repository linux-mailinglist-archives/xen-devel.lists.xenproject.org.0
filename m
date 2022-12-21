Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04937652E14
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 09:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467623.726662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ukA-0005H6-MI; Wed, 21 Dec 2022 08:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467623.726662; Wed, 21 Dec 2022 08:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ukA-0005FL-JE; Wed, 21 Dec 2022 08:46:30 +0000
Received: by outflank-mailman (input) for mailman id 467623;
 Wed, 21 Dec 2022 08:46:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCPi=4T=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1p7uk8-0005FF-1Z
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 08:46:28 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2074.outbound.protection.outlook.com [40.107.105.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f31b5be2-810b-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 09:46:25 +0100 (CET)
Received: from FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::11)
 by PAXPR08MB6384.eurprd08.prod.outlook.com (2603:10a6:102:154::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Wed, 21 Dec
 2022 08:46:21 +0000
Received: from VI1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::ef) by FR0P281CA0006.outlook.office365.com
 (2603:10a6:d10:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.10 via Frontend
 Transport; Wed, 21 Dec 2022 08:46:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT015.mail.protection.outlook.com (100.127.144.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.6 via Frontend Transport; Wed, 21 Dec 2022 08:46:21 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Wed, 21 Dec 2022 08:46:20 +0000
Received: from c8f68ef7f1f8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D359A8BB-4576-4686-AFDB-8A4352E9D3F1.1; 
 Wed, 21 Dec 2022 08:46:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c8f68ef7f1f8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Dec 2022 08:46:10 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8448.eurprd08.prod.outlook.com (2603:10a6:10:404::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Wed, 21 Dec
 2022 08:46:07 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5944.006; Wed, 21 Dec 2022
 08:46:07 +0000
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
X-Inumbo-ID: f31b5be2-810b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F89N1bOr0Wx/OsmP4nIOjqrWOw7O5CLxqilM7ntPwlI=;
 b=QWkt9qQ6ChDpcT/l5GQ4K5QEXPPrvOpxPvsov1wHn1ccS6JGivswKMfbj9AtsEuc7Dojef555mKZ8s3Z/4knVk7LRhGQr2hJrSqRoDIPzgq/6sNZ4gw69h3FC+3TtNlj0SqzWCsApY6W/vdSMC5xduoTKlNzpTuL9C+HC/tkNIA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 82167019247094c2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6uB96XuPzNO6D2Y3Rk+NqxnsvuPPIlVJiWMUrz95Ce98doebunb4eUhjN0SMr4B6G+3u72/E5mmGq34+TZW4qjgkCxZC9nRbBk9+PgdLDY4PlTDe8pyllb6Hi3fKgx3hgmmp9Xq8khyHi8NHS4rWhdzyL7r+sXO7mCOpnMzKI45D3H0K8i9/9B39e1jI3aMzmTUhkNZOnW5HL/BoPVuTdX0PQGFkIoSmPeGDz2pTIsfWSSgpRptpHAuPgiDYj3JKpPD6WTEXWs5c9yqHjLn2N9XfgZAcCvgnk6rOJkDtqKYNF7uKTceZWoI++BryIy4gEm13h0/0D9dfHJlr0CbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F89N1bOr0Wx/OsmP4nIOjqrWOw7O5CLxqilM7ntPwlI=;
 b=W+Nari0Cn9aS5zAF9Wr84lO8+GN8rhYNKKS3dUHUaGwzzzcnBM4WKOpr6aIsa13m74myhIVIq/HXJzSCxpFg53A7UqiHnSlII5AmgdK8ssxLreqyMHzbkRj7L6MB0WcpVbVNN0gbuF4Box+0TrjrfGGyKP6CCyX01PhqcW86gX7mgVcI8qlmDeZKk3+tXlsPghf3DtlGPxumwgKfTJoVOeV9Hcq9d0KWgdITcCJBRCEmrz9LDjkHt0pwB31xqesloAiiiF9oH0YNSHqNTpduNEHhjMUC54/jjGwOTaEkQ4CpQWhe6Z38j0Z9qSUUNoTO4AV3P9/X4dOmM7siEZUvFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F89N1bOr0Wx/OsmP4nIOjqrWOw7O5CLxqilM7ntPwlI=;
 b=QWkt9qQ6ChDpcT/l5GQ4K5QEXPPrvOpxPvsov1wHn1ccS6JGivswKMfbj9AtsEuc7Dojef555mKZ8s3Z/4knVk7LRhGQr2hJrSqRoDIPzgq/6sNZ4gw69h3FC+3TtNlj0SqzWCsApY6W/vdSMC5xduoTKlNzpTuL9C+HC/tkNIA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 17/18] public: misra rule 20.7 deviation on errno.h
Thread-Topic: [RFC PATCH 17/18] public: misra rule 20.7 deviation on errno.h
Thread-Index: AQHZFFDT1G4dt8FOrUCfFOSy+7FsQq52iJ4AgAGACAA=
Date: Wed, 21 Dec 2022 08:46:07 +0000
Message-ID: <5493C27D-32EA-44BF-B3F9-DBF5274FDD3C@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>
 <20221220085100.22848-18-luca.fancellu@arm.com>
 <77931264-71a4-edeb-0749-9de77bfd9c1a@suse.com>
In-Reply-To: <77931264-71a4-edeb-0749-9de77bfd9c1a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8448:EE_|VI1EUR03FT015:EE_|PAXPR08MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf8ac38-b01c-4c7a-8dd4-08dae32fd583
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gyhnhzaknE++jsoL7PtvzwqIiiB5LYA6N3tbc8SaDiqwNIMdvFXayb/o+pne8kGWz1oJtgycrDvMBloXc2RqBMinCqbcDwMPh5qYsyWjPjVCN+Yy0I8Wkws23fh4kNcCroJ5zivQ6bDdt/r50e0XMAM34ObBeck3AAeQYm05/JlwRR5cydPX3xkhRKVM9pvMsoQM3bqGMo7H0UXT4Tw7mgks4odMHyNEWYZWzTi5azQ9YhiM9vB9PCMM9dw0/YREd6G82DqxnkHgcnZqGQV2ndIjxNU3eUPq921oQe2mmKslyhNmWZMr+msPmJpeaZXCoPTUqR1B/RVhCGviSx4g1vVgtsX3SVpE7UKgPNUAoyAh88qpeiZtpxlJZ2Ock2IIgqtgHeGbJtV2HLCwCq+mXMulCh78bzHZfij6faiWitCllA2pSZPJyVROAGh/YLKet9Mwh88zfAsbyZFahtCNqIB2j4bmrTLyGgVUDqcdkLuVygO6WSS88TL6EWl7UtjEQMYXCaZPLgjpQo90cPa+uVtAmeuQsDJQTRotmgK10C936i2GIBu+PVsr1i/4VQzn2n2YYmclgQHqGNbhhtSg+LBcALL8Zfb0FQ1V1zrMZj1twQFSxVirYBE2bbaQyan+tq5hOpMPvtg4bSbvlaWcBtKo5h85GhMwHcrhhOs9Sxyc/yuE6b0iIKozyiZ80lH1ZqD6ZO6r3tkHEsQAZP+/BdO3IPpxFRvo83OOqEYTfGw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199015)(2906002)(8936002)(4744005)(2616005)(86362001)(5660300002)(33656002)(54906003)(4326008)(8676002)(76116006)(41300700001)(478600001)(91956017)(66556008)(66946007)(316002)(64756008)(66446008)(6916009)(66476007)(6486002)(71200400001)(6506007)(38070700005)(6512007)(26005)(186003)(122000001)(53546011)(36756003)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CAA79CCA52A28540AB70155B4673F115@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8448
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	95981edb-8234-4492-2940-08dae32fcd33
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vbQdWQyAh66xOc7NqTVhVFOFcpE/gehFxfkhOCAG3I7dl+QvpHGdS90pknPMVq8oen5gjqXqmJKpZWup297ML1RggBSWjGjeuun3D7U1lkesHRsvhYy9J8ikT8DIaFbA5XErXuCuFgvlARfYcrY0uxdIBV9EJymS6YW7za27LQjsngKXcs1qR5qywsSVI78wuZPFqmnNoXPLnLQHU8ISFckdmHBHRZzhD9SuGCx0B1r4DQ9O1n9onVGRByOQWWHcvBMKLQRoxiP+FHHHwCFzkj5anVaEW5kds2gBYcY6Fc5i0JpCK3ExfzHyOl0KvUvz54vGFLLBliCIcQPZtIsW4xA9UfYYSnPb7LwDyHl+I7h6Z1u0TzbaL/QcnoZtlW9hoTL2UpxsZjEtxJE9xUN4ggyCsrZlyzvfIXLycVhol6mQyvkBv8K51P/HEMMftRi0u5EmuX+0kJSfVIaTkvuoPd+tiCsSOO9iInsJEe64kwuGhumFLzIGcVc6R8D9ltR5+UYbd5UTV704IeahxUyaMIpXISI53rV6iJbif8lMcWAG2HJsBCVMpBPtGbjnQNClspZIPt1Mc+EgMG6z5LarR4QSvb/jis750ynogCfI/JCQXXqptSNz3Ks+L+KTu39zsJ5BodZfeZa7McO0KcuQCzwRYkGUUbmIQtVteJN3ZcnqWyMxWKxDVVU9yI6o2feDTXo4F8/urm0tlzxQI1IJyA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(54906003)(36756003)(356005)(70586007)(81166007)(70206006)(336012)(47076005)(82740400003)(4326008)(2616005)(6862004)(8936002)(8676002)(4744005)(6486002)(316002)(41300700001)(6512007)(6506007)(26005)(86362001)(186003)(33656002)(478600001)(5660300002)(40480700001)(53546011)(2906002)(36860700001)(40460700003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 08:46:21.0389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf8ac38-b01c-4c7a-8dd4-08dae32fd583
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6384



> On 20 Dec 2022, at 09:51, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 20.12.2022 09:50, Luca Fancellu wrote:
>> Cppcheck has found a violation of rule 20.7 for the macro XEN_ERRNO,
>> while the macro parameter is never used as an expression, it doesn't
>> harm the code or the readability to add parenthesis, so add them.
>>=20
>> This finding is reported also by eclair and coverity.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> But with the title adjusted - this isn't about a deviation, but actually
> addressing a finding.

Is it ok this title:

public: misra rule 20.7 fix on errno.h


>=20
> Jan


