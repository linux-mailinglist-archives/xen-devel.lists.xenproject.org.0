Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0A5776F24
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 06:40:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581809.911222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTxRv-0004qX-Kp; Thu, 10 Aug 2023 04:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581809.911222; Thu, 10 Aug 2023 04:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTxRv-0004ob-Hg; Thu, 10 Aug 2023 04:39:03 +0000
Received: by outflank-mailman (input) for mailman id 581809;
 Thu, 10 Aug 2023 04:39:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCzd=D3=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qTxRt-0004oR-I4
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 04:39:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1782cfa-3737-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 06:38:57 +0200 (CEST)
Received: from DUZPR01CA0235.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::19) by PAWPR08MB8888.eurprd08.prod.outlook.com
 (2603:10a6:102:33c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 04:38:50 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b5:cafe::87) by DUZPR01CA0235.outlook.office365.com
 (2603:10a6:10:4b5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 04:38:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.18 via Frontend Transport; Thu, 10 Aug 2023 04:38:49 +0000
Received: ("Tessian outbound f9124736ff4f:v145");
 Thu, 10 Aug 2023 04:38:49 +0000
Received: from b47b496af87b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 75B696E6-2673-4AEB-BA2D-4B58A5EFCB54.1; 
 Thu, 10 Aug 2023 04:38:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b47b496af87b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Aug 2023 04:38:42 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com (2603:10a6:150:a9::12)
 by AS1PR08MB7563.eurprd08.prod.outlook.com (2603:10a6:20b:472::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 04:38:41 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::19bd:f9b9:756b:f1f6]) by GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::19bd:f9b9:756b:f1f6%4]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 04:38:41 +0000
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
X-Inumbo-ID: d1782cfa-3737-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yy62ScwNvi03uEzv2P7ASs/DqaoxRJuTMUvG7ja0Ffc=;
 b=Rq13kpv1m50Om3bLBby+YNIG0IAF5ZDUJr1sdAhAcw4kVY/Cj8vjyktEYyahJ2bPFUzUymiX70KqEgtwj83fClYv/8P+DPxlA/0kAK2g/1ioCn2pcUpz/DX2ndOCwp8tQoUz6FPMTv9YnrPEwu2POwUzPneMUQdlD5sJq3cGrAc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 122a2afff2d65ca3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbqQJ5JFVl12KcsWBzJiVUxh8bRlIKQ+rpHWTic8IocNU218qk8k8lE7h0HITE/G77WnKEmHBIBbzs+1dXKdI/bRgcnvZs4p2MlDNPERp7rFnG9y5GcULUTy7VK53UaEJA+1al/1WKfTWlw7NtEmyrechv/IW7CWQd+/TjKkdycZ75uJU3r2pVEoNkIxmHwdnsOoyzcxcZ7qbOjp+RBGlet8g7anCMC8Chd21blprMaqUzR9lGTbQ0w/tY/fW+oQJjv47Pyxs1Bq2uDRu852eM+nphqi7ZVtrAXR3r3Jyxtb3DN7oLlP8rrhIAjNyBYS+8lyjcK8Q+zfLzVY9mHe3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yy62ScwNvi03uEzv2P7ASs/DqaoxRJuTMUvG7ja0Ffc=;
 b=jiE9kpz8BYHlwyk0jlkVj1Icj/TtI/PqqGatNKaznB/ToY9gxiSe6S+5tWcWef8gsghyty+dGboKW1rTDyHJhR7fWxhmzTKGf9xYbpd+7CzqNvr0hatIFUgSJKzKxtwG0sTZq/rvqYGP+3HLr57zVLYP7z/D4SOp5s333iOJe374pbU1qAN/IVk67/qwy3zvMk/Yt/QFGizQspFr9vB2qe7TCQTtkY6KKrQH6fgsq9HHUIXn7+m4sJRg5mz7hLeARuKB9nfULDfpR+PKvGFlow2kH92ruNfE6EbLs8BQ12sV9FGfDmskE4/LMfz1X5jJdTWlLuOlGJQ75YNFvGp/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yy62ScwNvi03uEzv2P7ASs/DqaoxRJuTMUvG7ja0Ffc=;
 b=Rq13kpv1m50Om3bLBby+YNIG0IAF5ZDUJr1sdAhAcw4kVY/Cj8vjyktEYyahJ2bPFUzUymiX70KqEgtwj83fClYv/8P+DPxlA/0kAK2g/1ioCn2pcUpz/DX2ndOCwp8tQoUz6FPMTv9YnrPEwu2POwUzPneMUQdlD5sJq3cGrAc=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien
 Grall <jgrall@amazon.com>
Subject: Re: [PATCH v4 02/13] xen/arm: Introduce 'choice' for memory system
 architecture
Thread-Topic: [PATCH v4 02/13] xen/arm: Introduce 'choice' for memory system
 architecture
Thread-Index: AQHZxCqJmtSfvrOVyE67LM5R2F23xa/h6xaAgAEVmgA=
Date: Thu, 10 Aug 2023 04:38:41 +0000
Message-ID: <74203F81-0FFE-4474-88AF-D0126D3022C3@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-3-Henry.Wang@arm.com>
 <429625da-ec4f-448f-a0c4-47ca0f62f395@xen.org>
In-Reply-To: <429625da-ec4f-448f-a0c4-47ca0f62f395@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV2PR08MB8001:EE_|AS1PR08MB7563:EE_|DBAEUR03FT021:EE_|PAWPR08MB8888:EE_
X-MS-Office365-Filtering-Correlation-Id: 59fe0b20-47bd-4a46-0d0b-08db995bb149
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G6kWyb8xaMq0mSX28bwEFuO6VudZNCy/NqmrRvSo1j2ddLDYeMCqxYNo0vQknnXsYzhEloymO/CTkvo3ow3h6p10Cuzqjt2/XxTO1WQrBbX3hOJuf2MoIlY8s/dLbXE4PV3u8vBjRVEdalF8eiSv/dKDCXgwtZ/9najlsPon/xmpgfMFYeuZcl+QvAR7dyCuepF5BsPee7GmvQlP9xPqjP8sNJ4T87VPu5H3pUbI5m93twHRg2uKPpcZx2VjzR3ROqFh9cDygWgEHYYyBR1gw3t9ANp6FN81oe5Hw8dwF7weqTnYBEyQAIGt8TqcPwsPkoHV5Ce9t8FeUy/g8pe9pkcbOBHMHlfqT5wve3F2RPB2penVO4zKOJweeq5r5Dpkmv2PlD3W93FTuS7v+LabXeRSwdmXtCt5aO9lhqqB8LOfq2IMvrqOLXZBjNupOAVDbKHx1F51/8bxuxikSBisy0k6/lwtwQqswgA7i8dMx6MS2gWVpvru39HQYUF/mzhmVlkZtUf4DoO9J67QO8jD2fF+LyH3gTvOFjsE36SRt/kIw1logE/CSrT6bo9B6xEnIJe8RCr61KVvFGi1psB0aHQa19sGp5ckiHhur/xZ8ZsF4m2X59A6E6WJk3uTS+QUClfqzSHv5BSPLMJwv0UP6Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8001.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199021)(1800799006)(186006)(33656002)(2616005)(316002)(41300700001)(8936002)(83380400001)(66946007)(478600001)(6486002)(66556008)(71200400001)(53546011)(76116006)(54906003)(6506007)(91956017)(26005)(64756008)(6916009)(6512007)(4326008)(66476007)(66446008)(38100700002)(86362001)(38070700005)(36756003)(122000001)(5660300002)(2906002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AB151EDC2E527F41A6EE1BA58F353924@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7563
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25778f14-3221-41a0-24fa-08db995bac19
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AjqOYG5UcTA/fbc5rv1cA7yGjmDS4v5daMZXXHza+IAEpqtWktB4c+tUGoSh6rEDaDIIgaTg4N3fftMeuiIs0oA2xBTH5UDGJDSmvr8dhE+NCChZhdM/ylSP9PBbqoYzym2Afc5kEZn4Ld1NbAV/UlM2fV6yfBHYn2KsxHN3E0pGVrKBNCDUjedChoGTo79z0e7+azZ/7/4BcMZpq+9q7SFnO+g5wF6HMC4lM/u7A7TbQtoG0hVjcF24X7IBra7LJ9kb+4dCGGvQXMIOGesek25JLolfwAN/TOVpXsPUWpgKzEWKvjIbn3YuQuL3qYuiIQqahUKbS4SlYkqfSxe/T6/JaYVLqNL56ZqT+6hXFAhcPZvR7dDV5ECek6LJlHj5U6dqYlN4U1eUP5FnoZRrtJ9KjxGsN1Z0cbBFBRSm4Y7jxCUnjiqssJVAcaFSm6zCthvL6Vxqsx2dLx2yBlyHo3yEZ6tqpirERCRescjzVYcFpMm+g9iThf6+q3tdk0hT6GNsSTk40Vyp0+9d51fx9PxwZ9Hh9daTxIqQp7S+lJ/be23XNDry1BS6Y4ogv6EguXJT2FTjF5EFpkf6pckqwBII+0PCUWLK3oxQUJPmzGSw3NbAPcPTb05ovp2lmrdRpyOyi+d3cD+/T8SsYP2eTDT3Z1ZKP48w6ordiYfCzDqxAqvTCy5WUPGFxqXMHLRO1SWZM/fmzp45+XnPDBeSfEdsQG1R3+6AMQoOcUuqSlM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(186006)(82310400008)(1800799006)(451199021)(40470700004)(36840700001)(46966006)(2906002)(8676002)(83380400001)(107886003)(2616005)(41300700001)(47076005)(36756003)(336012)(5660300002)(40480700001)(36860700001)(40460700003)(6506007)(26005)(53546011)(8936002)(6862004)(86362001)(54906003)(6486002)(82740400003)(478600001)(81166007)(356005)(33656002)(316002)(4326008)(70206006)(70586007)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 04:38:49.8329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fe0b20-47bd-4a46-0d0b-08db995bb149
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8888

Hi Julien,

> On Aug 9, 2023, at 20:04, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Henry,
>=20
> On 01/08/2023 04:44, Henry Wang wrote:
>> There are two types of memory system architectures available for
>> Arm-based systems, namely the Virtual Memory System Architecture (VMSA)
>> and the Protected Memory System Architecture (PMSA). According to
>> ARM DDI 0487G.a, A VMSA provides a Memory Management Unit (MMU) that
>> controls address translation, access permissions, and memory attribute
>> determination and checking, for memory accesses made by the PE. And
>> refer to ARM DDI 0600A.c, the PMSA supports a unified memory protection
>> scheme where an Memory Protection Unit (MPU) manages instruction and
>> data access. Currently, Xen only suuports VMSA.
>> As a preparation of the Xen MPU (PMSA) support. Introduce a Kconfig
>> choice under the "Architecture Features" menu for user to choose the
>> memory system architecture for the system. Since currently only VMSA
>> is supported, only add the bool CONFIG_HAS_MMU to keep consistent with
>> the default behavior. User can choose either VMSA or PMSA but not both
>> in the future after PMSA/MPU is supported in Xen.
>=20
> So in the long run I agree that we will want to have a choice. But this s=
eems to be a bit premature to introduce it now as the user can't select the=
 MPU and also can't deselect MMU.
>=20
> Therefore, I think it would be best if we introduce an unselectable confi=
g for now. Like:
>=20
> HAS_MMU
>  def_bool y
>=20
> This could be turned to a choice once you introduce the MPU.
>=20
> Also, from my understanding, we are using the prefix HAS_ to indicate if =
an architecture support the given feature. In your case, you will want the =
user to select it, so I would just name the config MMU.

Make sense, I will just introduce a

MMU
  def_bool y

in this patch and turn this to a choice between CONFIG_MMU and CONFIG_MPU
in the last patch of the full MPU series where MPU is expected to be functi=
onal.

Kind regards,
Henry

>=20
> Cheers,
>=20
> --=20
> Julien Grall



