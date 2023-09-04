Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3544C79195E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 16:05:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595275.928790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdACs-0007Fh-TJ; Mon, 04 Sep 2023 14:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595275.928790; Mon, 04 Sep 2023 14:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdACs-0007DC-QZ; Mon, 04 Sep 2023 14:05:34 +0000
Received: by outflank-mailman (input) for mailman id 595275;
 Mon, 04 Sep 2023 14:05:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pUi+=EU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qdACr-0007D4-5d
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 14:05:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c33b23f-4b2c-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 16:05:32 +0200 (CEST)
Received: from AM6P192CA0073.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::14)
 by AS2PR08MB9246.eurprd08.prod.outlook.com (2603:10a6:20b:59e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 14:05:27 +0000
Received: from AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::e2) by AM6P192CA0073.outlook.office365.com
 (2603:10a6:209:8d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 14:05:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT038.mail.protection.outlook.com (100.127.140.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.22 via Frontend Transport; Mon, 4 Sep 2023 14:05:25 +0000
Received: ("Tessian outbound 0b7d6027328f:v175");
 Mon, 04 Sep 2023 14:05:25 +0000
Received: from 51071459adc9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B1BEF1F6-9D5B-4AA3-88A8-8D6B41B41668.1; 
 Mon, 04 Sep 2023 14:05:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 51071459adc9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Sep 2023 14:05:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB7394.eurprd08.prod.outlook.com (2603:10a6:102:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 14:05:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 14:05:15 +0000
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
X-Inumbo-ID: 1c33b23f-4b2c-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KhdceH21n5rvRVhrcBVV+X1di3f8F+BTWVfSrxx2T4=;
 b=MYnBu8p+yCtZD4wFJRYaHOTPlJLg9oMZAAABfS5XoAmGIMY3Edl9MynWyQhhCYK7AsxsKfuVkVVdbhbr37yD1idfIopoQsFOWwR5nyiCcaaQ8G08bGIivOgCmm8tgkhW7kDC6+LlHthGC6v5lzUWBvf8O5ySMz2EaV4qVCFuQ7U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 17e4905d768ba8b8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TP57lmiLEk+2sR5USfNuSuyz06dywob5Vk5F22IKnXCXWz/NGwt1qVKIxJvXyVOovAvHHFf9NO+H5oTvUBHl3BJU4DJnhuFSZkMMEyRDmk9kFKqKA4rkrJh2Moyw//fcGIGmVyGBBcx8bB3bkL+dlWR32u5+zIq6B6/lAJkHAtdA9LKqi6kKw8+F2P0UzNSBjfZQLdekPAoU9sxk3zgsnb5v16bSOvVvHVLsZNMjqXS3kgXDQoNUkUPOSfPA8T5+cCbMI13/qB6l5/bhM1PYONiyoeWSHwFXiDUVaQQ/sFKvNvhVhKbomx/px1y0BVUV5cEzaU4Qw5qHlJUn7C4m7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KhdceH21n5rvRVhrcBVV+X1di3f8F+BTWVfSrxx2T4=;
 b=YmZicxleHz/2TCbD7Akb6Ci3IPEMZ1lCQyElanJPCfP2XUuIHiZYw+X7vh0dALds36lp4uDWCkcjjqsOHjlq4BaKo+oMgEz1IrWWBZNREiey2DW87+QyRbUj+gQtKTFzmZqhDces58MRsNP/fUbuZ41WeMMPxKt+gDHsBx/Ah9pqgLcStOV+Y2k2omicCJaq1ri7u3qf2/lclH3Xei1VntQSKYHn2mCTu2bnQvcg+Y3iSeq3PxHiAjzXkV/0hZjkuFk6BAs+EdVxUBJhC16vpbGR0Ph/MdE+Ui16xCAnfX/oX+75fZG8CZEyfMgEYnjngZykMWzWrMKyJM+uIZ+5yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KhdceH21n5rvRVhrcBVV+X1di3f8F+BTWVfSrxx2T4=;
 b=MYnBu8p+yCtZD4wFJRYaHOTPlJLg9oMZAAABfS5XoAmGIMY3Edl9MynWyQhhCYK7AsxsKfuVkVVdbhbr37yD1idfIopoQsFOWwR5nyiCcaaQ8G08bGIivOgCmm8tgkhW7kDC6+LlHthGC6v5lzUWBvf8O5ySMz2EaV4qVCFuQ7U=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH] Arm: constrain {,u}int64_aligned_t in public header
Thread-Topic: [PATCH] Arm: constrain {,u}int64_aligned_t in public header
Thread-Index: AQHZ3KWtdw8jwJKuHkKXZbII/FmnYbAKsd6AgAAFVICAAAEdAA==
Date: Mon, 4 Sep 2023 14:05:15 +0000
Message-ID: <F05B7AF7-94CC-4AEC-9633-20F34F2BB458@arm.com>
References: <56bb2024-dea0-79e6-6a51-66e6c35a2733@suse.com>
 <7D7DA9F4-8B0B-447C-B35F-6BF53E5D0E52@arm.com>
 <03a6847c-95df-696c-5df9-53af425795e2@suse.com>
In-Reply-To: <03a6847c-95df-696c-5df9-53af425795e2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAXPR08MB7394:EE_|AM7EUR03FT038:EE_|AS2PR08MB9246:EE_
X-MS-Office365-Filtering-Correlation-Id: aafa58a7-256e-482f-2f4b-08dbad4ffcd6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7tv6WmRUO9F9sPsG4lm9LcxHEwe0QAKeK33ACnqcbYLnq3untnNY9AuxoPqvocF1+AJDtQ4VS91H/w5HKaO0HMcjHEszUWTER6oMLcasUE1dN8VTcnQrjujkfTfgUnMzVOKJKu9Nzd3QMTeC6uN5Pon3g8WyoPVa9bBCQ1S6THhQ5VAi2hZ+BZg1wNxmB2MB2fVGTvB5oN6n5eFPw3aGGEYYr83Pow2vyqKDjP7gpBwFD7U5s6tFGfl9V2KGEZGtR5Wjw04riy/Fh3JfTQq4NcuHYQkuWC0ZFp/wcT4X0fWJxLFDDM5rOY4EH1u8GFaKEsY/31DLdRXxql+Gx3TOwRAQyZStM02mVd2BruLWrxEPK3BQ3A2o7Vimqmga0r29pCMdrMvfeExtcapm/ipIWXUOtz3bstCVqxQN9v29NJyx2+d6nhX9ClMtf5sXpKRGXZghy+GzwsJiCbUZJPVEbW0Nrg3z0xgEumwH2dNNG5NfhZR+WL11p563TsXm/7dyHFIEG4335XN4F1weiPd42oGbVSobRxaGfFkirIbn2wA5AuWSwiiOCyqyoOFaIm2AMuRQLe4BkTZSBa9WecGM//xE+EIEEbnY0u9esvTh0+B5e5IhSUjPRgVEyhxMmePt1qXUkdlVd4ACWVe86CBdwLtAbM33JpE6AoeJKlWpp3fDNZhZq7cj/FHgNanjF7E4hX/lsefmHfl2oxveSsn1uw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(366004)(39850400004)(136003)(451199024)(1800799009)(186009)(38100700002)(38070700005)(122000001)(33656002)(36756003)(5660300002)(86362001)(41300700001)(54906003)(66556008)(66946007)(66476007)(66446008)(2616005)(76116006)(26005)(64756008)(478600001)(91956017)(71200400001)(6512007)(2906002)(8936002)(6916009)(8676002)(4326008)(6506007)(6486002)(316002)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <28B621AA95AC8C4DB98C638504957E5C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7394
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3bea6179-0ee7-4b85-b941-08dbad4ff66a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BARVmYisVU639TISwa2iZR1c7lqWICmLfaUht1RUZSdQziRkOvjZhU9Xzph2Ghx+Hyxoxg2XdMN3Ac/DS5Qtwght2TVbkDGx9j4+RnU5yQig1nzhGscsfoXetGPIjwivsHS4+YK/iZO1pRtoh+hWfmGrVg/ty9HNgBPd/YVB/ZyLMR6cYmBYz18d+MQsqYrBZQbRfQ8lYVi3dy8JR3wHEfOkr/u7LF54+2d/8RQHMn27+S/l71JZnKhlHsVkAhWstsikyNW3HFvTLauOF6t4D8KxX3SeLhwt6G+g0uKaowSmbrbZQ2m92Org+WzlzYjoo2B0jqTmt6phn5d4BgqCR5kNf9uH50IEKKoOuxaoGkFyxZlbv+NPHWkMEceIYAcd6a1lOZ6bFbs8ehmfxiQDltsylcvn2VR/k23+x/XQNUDXJ0qiAPENq3vyXuGREI2ZQBakTyT5qRYIDyC/pjdPEbzfSZWb017WP8S4g9VyETr7wCQiPQTiKH4tgEx3Q3ApvWdhvW9cM2s7h2LP+QRUcD7R8ysysHUk4wjZL7XI0U4wLsDhbFjID4ALyOnh1ReH8f8SGZ2kXiTWOxDPCOp6y8iX/vPc3NzNq25H4UY1l5iHYUpFBdo/cqKDbXkLaeHlwyWAzaNHihYhmcGFFhKOPw1nB4mfcF1qZkVf2dLtPwfZ7VX7EYWmOxkuBx0FEi5vvD11MIJg7VIJiH+zpw6C3h9KhaQp1nDEvkDWt2hyer5JtT9tS2vRmiFZrx1mNYfm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39850400004)(136003)(376002)(82310400011)(1800799009)(186009)(451199024)(40470700004)(36840700001)(46966006)(40460700003)(41300700001)(356005)(82740400003)(81166007)(33656002)(86362001)(478600001)(2616005)(336012)(26005)(107886003)(47076005)(53546011)(6512007)(6506007)(6486002)(36860700001)(40480700001)(70586007)(70206006)(54906003)(2906002)(36756003)(316002)(8936002)(8676002)(5660300002)(4326008)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 14:05:25.8349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aafa58a7-256e-482f-2f4b-08dbad4ffcd6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9246

Hi Jan,

> On 4 Sep 2023, at 16:01, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 04.09.2023 15:42, Bertrand Marquis wrote:
>>> On 1 Sep 2023, at 09:26, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> This using a GNU extension, it may not be exposed in general, just like
>>=20
>> Nit: Missing "is"
>=20
> I would guess you would want it added as the 2nd word of the sentence. If
> not, please clarify where you think it is missing. If so, then I'm afraid
> I can't parse the sentence anymore with it added (i.e. there would need
> to be further modifications, e.g. at the very least "so" after the first
> comma).

Sorry yes, it should be "This is using a GNU".

>=20
>>> is done on x86. External consumers need to make this type available up
>>> front (just like we expect {,u}int<N>_t to be supplied) - unlike on x86
>>> the type is actually needed outside of tools-only interfaces, because
>>> guest handle definitions use it.
>>>=20
>>> While there also add underscores around "aligned".
>>>=20
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>=20
>> With the Nit fixed (can be done on commit):
>>=20
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Thanks, but I'm afraid I can't take it before the above is clarified.

Please see above.

Bertrand

>=20
> Jan


