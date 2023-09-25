Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B41B7AD264
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 09:54:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607682.945965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkgPJ-0006mD-7V; Mon, 25 Sep 2023 07:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607682.945965; Mon, 25 Sep 2023 07:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkgPJ-0006hf-3z; Mon, 25 Sep 2023 07:53:29 +0000
Received: by outflank-mailman (input) for mailman id 607682;
 Mon, 25 Sep 2023 07:53:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LToL=FJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qkgPH-0006hZ-PG
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 07:53:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9abc3573-5b78-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 09:53:24 +0200 (CEST)
Received: from AS9PR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::16) by DB9PR08MB8457.eurprd08.prod.outlook.com
 (2603:10a6:10:3d7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Mon, 25 Sep
 2023 07:53:20 +0000
Received: from AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:542:cafe::2e) by AS9PR01CA0038.outlook.office365.com
 (2603:10a6:20b:542::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 07:53:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT049.mail.protection.outlook.com (100.127.140.234) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Mon, 25 Sep 2023 07:53:17 +0000
Received: ("Tessian outbound c99fbc01d472:v175");
 Mon, 25 Sep 2023 07:53:17 +0000
Received: from 2a5b2ec0eba6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C998A5EB-CF54-4644-9A5F-FE84868922EB.1; 
 Mon, 25 Sep 2023 07:53:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2a5b2ec0eba6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Sep 2023 07:53:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB5935.eurprd08.prod.outlook.com (2603:10a6:102:e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 07:53:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 07:53:08 +0000
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
X-Inumbo-ID: 9abc3573-5b78-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=En7O30F/RZO5oOvbQqdI7F1Xch162MdrZ67ZvgGGTOE=;
 b=2GzEsPhlaS8KZluYoGaflWVpMDYA9qk2jyylX4+DtkjgRCZFsdT+3qvJWyhcwBQ1cLxEgYYXwtH4SW9wFO7G06yBEWVMAsuT4I8SwIna6J4YspAeEqf1VXrJwBKPyxPInha+sMdrGxUbVhxj9/s0FurzZm9Vjj5p9dNcxttCNDo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cdb18cb95e47ed8e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gz2GAxQHOchnrRiiLLVuCae0Y5TVMXXwB/K2NCh3lLLEALQr9uiyJpPai7/Qdc0qBFrulQQ15WhYICLPdr5/GGDfTa71XFBykKPCMSXm6z6iheGlqS+tqBSad4M5ILx2lCaGKvPEMrw8Lbv3i2s5LPQK0Z+mYQvve9e6aVl9icf/f4hd1ofFwExNmfMfMbvJKZBkyqCRXzxYBGJkiQ23h4Y2UAEE+oab9Acko0Egsn/BElhr+i5UafU5MzoZuN5CqL65cjYLcm8xabHAMsLwE354fHKHekEHmfh3NUsDRtGEuYHWUthOCxHX93fRGtYrLg3eTb8YvRo3cyfwFOiVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=En7O30F/RZO5oOvbQqdI7F1Xch162MdrZ67ZvgGGTOE=;
 b=M63YBVV4OZQ1BYXms0va/9PKLAcHIcQSySyRYnkBT8/9Pa7oHLEdbPoXbnKaKAJfiT4vOUxkoOpIzoivwWdqNOuCMRVg6aDgnnQiTm0dxLXLNsI8QIVpzxdUqQiaxX5RJHoPwuLRpwL84InR2ii+UYfbSVcH8iitwXyhFiSfHYLG3LHd3br1yKPHVzjG88JLozc1662OuIFOF99xx2STwl6jD17QOc+a09cHsvaqKRMnZ8lMF0zck+0Snk72RSAfHZyR9ESMmdWnLZn3R23QqGfV41z8kyQJ6q00gy0ry0eL4caYC4jq1WliCxxaEY+s4HVRLjM969BEzfl0SvVvpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=En7O30F/RZO5oOvbQqdI7F1Xch162MdrZ67ZvgGGTOE=;
 b=2GzEsPhlaS8KZluYoGaflWVpMDYA9qk2jyylX4+DtkjgRCZFsdT+3qvJWyhcwBQ1cLxEgYYXwtH4SW9wFO7G06yBEWVMAsuT4I8SwIna6J4YspAeEqf1VXrJwBKPyxPInha+sMdrGxUbVhxj9/s0FurzZm9Vjj5p9dNcxttCNDo=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Demi Marie Obenour <demi@invisiblethingslab.com>
Subject: Re: [PATCH v2 for-4.18?] x86: support data operand independent timing
 mode
Thread-Topic: [PATCH v2 for-4.18?] x86: support data operand independent
 timing mode
Thread-Index: AQHZ5MDnZ00SVLfzmUmuQZLkdMd2orAWXCkAgBTk6QA=
Date: Mon, 25 Sep 2023 07:53:06 +0000
Message-ID: <4F6F6A66-515C-4543-ABB5-246330F5EAA2@arm.com>
References: <54005c49-b012-8265-246e-22b03a87f724@suse.com>
 <29A9BF11-7ECF-4C3E-9D5E-9D44E63A297A@arm.com>
In-Reply-To: <29A9BF11-7ECF-4C3E-9D5E-9D44E63A297A@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB5935:EE_|AM7EUR03FT049:EE_|DB9PR08MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d84710-8a7e-4e66-c398-08dbbd9c7b02
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 agN/TimRK98fctknZdeoqjzKqbSdgL0HMpk2xv6ydtywSLk+OxbZBevyHrPiMU5q1bff8aGwiwyBq+XcoBqzO8sEGybI5mwMsyqLjJykjWECz9LVvoKFgfYALVRW0XrKE9HXMosQYHdCjw9oF0FzENdQftfBjAWkFyWJeelVkHQYZfn+FvAC6mnnGu/WiMFGWpZ/ufaYrNtG4GQ+XPqIibNqMH3Tos1kFyXRvzujA3SQ73DnoZaHKUaCoyvnm/hjsbZSba30VfvmVnWqiFlyMrvXqMJNuOShSp+f47zILbpNmZVlHaMRmxog2dB4JqdwyWeG66zZc/LXrnA+t6PH/hhYr24XEFTe4l9KavJXBsLMYEywqfJeum9tEDj+p8f70eshxbGtB1DmrUL3H3/1sBbjT/HRueb3oxaQZFXrQt1n4b4VLlYZO2KjMP8rRzeX9pdMs3afARfm8MqwuOCMqfG9RVKejTymtEkRrIPVnIijDoSf3+ep6UWal7xfi9+XSD3LnyJshN4SHFFVjI6+uPXntNR/hfOdFoWi60RyeWgVmy8WzthaBewSwAjEOouRFa4881C3v8w6s3fU5GY6M4OIsh1nLfkjTiIz8XGJyp//ds7d6xhHLC7VwCHxxGnBxZBmcDVBoK9PA+3xifWPRA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(451199024)(1800799009)(186009)(316002)(41300700001)(26005)(2906002)(66556008)(5660300002)(8676002)(478600001)(966005)(6916009)(91956017)(66446008)(54906003)(64756008)(66476007)(66946007)(76116006)(4326008)(8936002)(6486002)(6506007)(71200400001)(53546011)(6512007)(36756003)(2616005)(83380400001)(122000001)(38070700005)(38100700002)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <964F4B870C40F3419B504E24698EC24F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5935
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	061c6a52-1a2a-4cd7-dc6d-08dbbd9c7407
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mlpboPlht2FulVWj7HzNhoWjHCnQ38XDDtv1K3/pKh9OGng0jIrqpqsW2iuxrAg2WFrOb7MuKKKLOGUnCpaTH8VXWNfSf/X1zMrXim+XV6sK89aGti9owEVdVRHbZDC7C66quH0MMn9/boHuaSqdzW8ZbFCCmCy9+vaNF/ICzTTupHc4oluBYL/+B5iCocliXn7pt9k3HIjSr4Y6Qd8xGxbRDzgMrtg+CtE/adtkVNSGkZgg6RNlOmFGrSglcgZgCImIWTl8ylwbiLfsGQfvXUMRNQlHSJsULz/uXpGw+DJIX7GmnbfpCAhiFBgwVL4YNjqfp6s++OlXci58HbuUFjVfAbpRRQCDIMg9BaEjoHUcmgabU0FgASlKLfyMXCg3XvkJKUQ9PjfWf0dwKhM+fdmFqhMvDn3yP32qCT6NG7mnLm6uuQWXLKdg94qRxcWBGNCY/gRuciF/e82MfV3ij6t1dXNEYgT5llEy7ymBGRLw2bSYc0b1+wTbo83yZU9jMLd4RJY9D8hCsSRsiO1T3Xxp/VYQ1GaYJCq4f3eFRj+0e9UJMD8DXWQE6d+2qTMGkmDn5TdaAB8SnfTJPfxn35Zfh7qrc3Z+SGqzMgJA7Eh/zvjFljzbPnEjj8YAhhh80dGbvAc5IBRbMYtQ0J8Pvc+KQFgQT5vy22BoljX3RM5GJWDlC2e9L42cJOHBhPveaXFTWoUYZI7gBAMxLH6GwdCJqEsBCF9pEB5LmA9tkUc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(451199024)(186009)(82310400011)(1800799009)(46966006)(36840700001)(40470700004)(336012)(53546011)(40460700003)(6512007)(83380400001)(8936002)(54906003)(41300700001)(40480700001)(6862004)(2906002)(8676002)(36756003)(316002)(4326008)(5660300002)(70586007)(33656002)(86362001)(966005)(70206006)(2616005)(26005)(478600001)(6486002)(107886003)(6506007)(82740400003)(356005)(47076005)(81166007)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 07:53:17.8758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d84710-8a7e-4e66-c398-08dbbd9c7b02
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8457

Hi Jan,

> On Sep 12, 2023, at 08:48, Henry Wang <Henry.Wang@arm.com> wrote:
>=20
> Hi Jan,
>=20
>> On Sep 11, 2023, at 23:01, Jan Beulich <jbeulich@suse.com> wrote:
>>=20
>> [1] specifies a long list of instructions which are intended to exhibit
>> timing behavior independent of the data they operate on. On certain
>> hardware this independence is optional, controlled by a bit in a new
>> MSR. Provide a command line option to control the mode Xen and its
>> guests are to operate in, with a build time control over the default.
>> Longer term we may want to allow guests to control this.
>>=20
>> Since Arm64 supposedly also has such a control, put command line option
>> and Kconfig control in common files.
>>=20
>> [1] https://www.intel.com/content/www/us/en/developer/articles/technical=
/software-security-guidance/best-practices/data-operand-independent-timing-=
isa-guidance.html
>>=20
>> Requested-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This may be viewed as a new feature, and hence be too late for 4.18. It
>> may, however, also be viewed as security relevant, which is why I'd like
>> to propose to at least consider it.
>=20
> Fine with me if this patch can be properly reviewed on time, because of
> the security relevance.=20

Based on this, if this patch can be properly reviewed before we release
4.18, please feel free to add:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


