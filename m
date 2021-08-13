Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0DD3EB0A7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 08:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166646.304177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mER5K-00067k-Tg; Fri, 13 Aug 2021 06:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166646.304177; Fri, 13 Aug 2021 06:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mER5K-00064x-QD; Fri, 13 Aug 2021 06:54:30 +0000
Received: by outflank-mailman (input) for mailman id 166646;
 Fri, 13 Aug 2021 06:54:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9ox=NE=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mER5J-00064n-30
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 06:54:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.45]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae835256-81f8-47cc-9518-d69f6bc51ca2;
 Fri, 13 Aug 2021 06:54:26 +0000 (UTC)
Received: from DB6PR1001CA0010.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::20)
 by VE1PR08MB4702.eurprd08.prod.outlook.com (2603:10a6:802:ab::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Fri, 13 Aug
 2021 06:54:24 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::ad) by DB6PR1001CA0010.outlook.office365.com
 (2603:10a6:4:b7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Fri, 13 Aug 2021 06:54:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Fri, 13 Aug 2021 06:54:23 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Fri, 13 Aug 2021 06:54:23 +0000
Received: from d62c7fd72215.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B950FFBF-1E69-444C-9B44-6EFABE2A72E9.1; 
 Fri, 13 Aug 2021 06:54:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d62c7fd72215.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Aug 2021 06:54:18 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR0801MB2037.eurprd08.prod.outlook.com (2603:10a6:4:74::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 13 Aug
 2021 06:54:17 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%6]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:54:16 +0000
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
X-Inumbo-ID: ae835256-81f8-47cc-9518-d69f6bc51ca2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lahISmC2Rj4Z/MZivjs2/ulJG1zQFRm3Al1OekUNb24=;
 b=m1R21ax+CeDSZIA3vktBlyRMUQA21PatxbO5oXUbL92IusH+FcAkdJuTKvmpe1V0/mgQt6vLSmeXmUpPsKtmWwJ7ER/PQKRLQ/wSrF/Hy7YhZtmsyKu/1ClEoGhKtrLzKACTm44oak5kx0PaPPvh2kR6KdRggJ64Dmy3vkJ3ahw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrYSTBhgxYasOuxsbzZSEqJYtKUU9D14xdJyV07P1kXgEYyOS0qSMU32Oc9nEqTJeTFM3bENbcveaO1vxORRkRN5gL4/UXY0mdX8uwX1/4Ehpwui3hbtEr/EDkpMiA53AqrM4WczuCy9qLfoPKZJ7K6CMcN8pbiEJXSzbhmtjz69Tw9r7a5RC/u7qs0TwI9SuYUfxux0f5/RCrhX/VRxMVF0NbOZKQKZEI/oied5NG+dYmR0IArRVeUGN+1wsDiWA5JN5i1Mog2/Ul5wjxHx4fcFBlTE1oybeFsatZwVP8K4Zbo77p3A+YVNbLL8qDjcdnal57FE32byA4yAdTx+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lahISmC2Rj4Z/MZivjs2/ulJG1zQFRm3Al1OekUNb24=;
 b=HTP/hl88RC4Y/RXWL0MfVcFJNDmqdFmUxOQhbTRqkewIwjfQDecnr6nFV26cJbTi18WfZWq/COfmSbYMkimrP0yvithL1QGYe1yo5eTqLnbLya9Syc2KtDBcF6NHoUx7Zn+JH2plTJXVGBuJTcSJh3/otLc2EcZY5/L55g9us5PKbeG1H0kT2EYh8CpeNYTbUuquYsZj1Du2sV38lY9K07QSpOxVJujerXSVTyuwJ+MVVdrYJdwwoQzpwwAFu2zeUreKoDEDzI4iMhJPFTmarqiu7Vu7tuXJDsPSL4eVnQOVsXIsf/EgKGsLCoiX+Ejw1ZE5YcMg94M2B2IKSQttAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lahISmC2Rj4Z/MZivjs2/ulJG1zQFRm3Al1OekUNb24=;
 b=m1R21ax+CeDSZIA3vktBlyRMUQA21PatxbO5oXUbL92IusH+FcAkdJuTKvmpe1V0/mgQt6vLSmeXmUpPsKtmWwJ7ER/PQKRLQ/wSrF/Hy7YhZtmsyKu/1ClEoGhKtrLzKACTm44oak5kx0PaPPvh2kR6KdRggJ64Dmy3vkJ3ahw=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit width when
 platform is not set
Thread-Topic: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit width when
 platform is not set
Thread-Index: AQHXjpsgsRofIZVQlECQrMelX8MpkqtuIUAAgALdEnA=
Date: Fri, 13 Aug 2021 06:54:16 +0000
Message-ID:
 <DB9PR08MB6857BDA872A6271EDE37A4DE9EFA9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-5-wei.chen@arm.com>
 <9f3f002d-6919-bcaf-1f00-aa13ec1a2ccb@suse.com>
In-Reply-To: <9f3f002d-6919-bcaf-1f00-aa13ec1a2ccb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F55DBB9300A76943BFF2F41537EDA9A8.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8ebf798c-5312-4af0-48e0-08d95e272f3d
x-ms-traffictypediagnostic: DB6PR0801MB2037:|VE1PR08MB4702:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB470234E9FB46C5F27842C1379EFA9@VE1PR08MB4702.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 e/X7wFvelkoW4tR9kLrtB7k/rmIurDj2xN96+YrSma/2wVRAh6hjFmemGzPIhx/lSOgvrJg2PHti20oRsD5Uh1VK3dSXP6gjoq8jDeg6wmTTIRa9dqDwr+t8FYoIbYyK0vHWJ+Gf0fkfwuP/LDqc3LO7q2Ycg4IMhf/5Dr1lMdw+BFlFynM6FBmw3h6O92wrm3Ctp0x31cppkySUgmpjO2//fSrT933nGYV6HLeL9YPrao/mnJzDVshBxowWnGkczw2wHGvF+cKT9w6dHyXvgSWIeOHyOU9PL9LG8c9+IcFXVZxr69+PX0kehZDO/fw5C1/qxTbPYoGH5vXAi3/x0GPUVaGND2x6QJobD8xmkywp2HnEgzA24lvN8b13CzoN3DDaFRd1G98AJpkSt0gllAmlCimCeGB/g7nHzPiT/fONawptxJffyUBePhKLXYbVQaOX5mE8x7m5YQd4F1A6BVTmv6LCYHCxoZYn8L7Jgzi2Msy+4ieLtmdHouz8eqyLghAsQkgR5nYyoRDw3sLDPpgg4u11FcUEQabCMpdEGYRfbvyvmcdY896CfKh/fARBQk60owHyf2fXhQUpsppLVIPQatsYxxU+sSHV0pZNpFA5I0DeZzDrp5v/1Gi5IiBhwJYvblC4bHLpS+lfASfT68TmTEpdmFGhWA48W2X4Msj9ZNCNtc+y/px4a3VWBT5Q4+UOoBR9hemmPdUxRmq6yg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(136003)(376002)(366004)(66556008)(122000001)(54906003)(83380400001)(8676002)(66446008)(38100700002)(66946007)(478600001)(8936002)(76116006)(66476007)(9686003)(316002)(64756008)(33656002)(86362001)(2906002)(55016002)(6916009)(186003)(6506007)(71200400001)(4326008)(38070700005)(52536014)(53546011)(7696005)(5660300002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T1dLVzZJdmtuOFpkT3J3eGhlUm83dngwdVVvZzhROUJPVW9Ra0Y2Ny9ua3Np?=
 =?utf-8?B?T2hhSXR2WmxNSlcyNGQxS2dnb1ZXNUo3RzJJVTBkUG5yWWJtbS8rMWdBS29r?=
 =?utf-8?B?TXIxYmx4VXpEOEx0QjlNQmNhYjRNam1LQm90Ui9TK1NwUUZjbHo3WCsvQlp5?=
 =?utf-8?B?TDFoc0VOOHZkTjhrUUlXOFJxYW9VVmhQK3dXS2FHYVdwY3NZZ2s5d1VKWGRq?=
 =?utf-8?B?ZEtHZ2sxUG5sOU9KVDQwUzRPRGt1dVdDN1BjYmpmRDRyNXR6cGw4allUK3dO?=
 =?utf-8?B?cUMzR2d6MzdKMnd4RWZ4ZDNBMmRHbGxqbXB3RnRBdUlYdTBtUHlBQ0Q1NEE3?=
 =?utf-8?B?SENXRGpPT1dDdXcxaDkzZWxjMnpRUW0rOWZnMTRicHU3S2c3NmxGRmF2Zm85?=
 =?utf-8?B?STRnclRLZ1B2TG43SzRXZ0RtQk5xWDNVV3JMSlA2d21HeE1RbHNKeEphZ010?=
 =?utf-8?B?b21mbTRocFpGNVBhMTBBU2x6ak9nNXh4M2FpbzRyZ0VtVzBrWk43VXFBU0JM?=
 =?utf-8?B?d3l5TjYrdU01Vk9UVGQyTEFuMUxUZUd6NlBVeW00cHQwQkZZS1ltVG50ZXRS?=
 =?utf-8?B?djhrZXBrMTdSMDhqMTBlMm85dWxtNTdqSDFCbXlzd1ZjRzZSQno4alhEbmdx?=
 =?utf-8?B?N0RMU1JwcVJZdnJ0TzE4eXdlQTJRTndueTRpaS9oOEVUYXM3dWJ1T3NkQnpI?=
 =?utf-8?B?Ym43RzVBRFZHZEgycXkxSkRBb2RSbFJ0cmJ0aEQ1dHFQdkFaZlI1bms3NE4x?=
 =?utf-8?B?cVpabExEZnhlc29wVFlYa3RLNzU3RnY1ZWQ3L3ZxMW50cGlMbGg1dzlzLzgx?=
 =?utf-8?B?S0x3eWZ1V0xqc3duZ1h3NjJhV3llTk00NlUxT2FmcEV5NmVzSTdNaEd0akJN?=
 =?utf-8?B?NjMvNFNkRG9oeTg1RmYwM0pRWTIzSGZyU29LOVM4MGs0S2p4Q090aUN2TUkx?=
 =?utf-8?B?aGhjdzRjZ3BlZVVHTnNhTklWRFdkbllxNkovRHhCTGN6NEdUQXBHMUpRSFN4?=
 =?utf-8?B?cWdKZGY5c1pEelU5cnQ0cW8yY1hQZkxhNzIyZEVZc0hTYU5OY3Z2cHlXdkQr?=
 =?utf-8?B?c1ZhOSs2VHVIb1R4STFqdm5LaCtvd2xQTnZNMjV6c3RZWlVMOGlUUm5XTmta?=
 =?utf-8?B?RVJvcjU2c0FLUlBvTGJBTnRuNW83M291dmdyMzRRd3l3Y2JFTG9TcjBNRzhT?=
 =?utf-8?B?T3VnSlIwN0JrZ1JMT0VnT2ZNcXpNa1RrdnpqZ1BtN0xzYjdxVFhBcHRWQzhl?=
 =?utf-8?B?MnBMZVBXOXZNNExPM284Z1VIZlVraTZqUG1ZdGdId3BXaVIrVUd4WlVyc0cr?=
 =?utf-8?B?NlBOOUxSOXQ4WGdXcWhhNnFQRTZmRyswcS83cnE5S1A2MVV2N29yQTRtcmIv?=
 =?utf-8?B?Nld0RGY3aEhtZXZpcW5tYmxWU0txcXZGTW0yU1BobUlLdTV0cmZGVHBWQkEy?=
 =?utf-8?B?aHdhRGhVZUN1Qm10MDViU2VwUWZ4azJmYS8yZDdBeHpqbUpXOFNDTFBrTVpJ?=
 =?utf-8?B?K1ovUHUyd3NFV3lleFdaYlljMFhoYnBneWZlK0Z2dm1PSnJtM0R6K3pRVWVv?=
 =?utf-8?B?Q1F0MnI1QUd4NjVVYjQwMzFzWkZVZWp3blI2cnRrTnN4aHJSeC9IajdVUW0y?=
 =?utf-8?B?SXNvMW8zbkVsL2FhS1RWeGJRc2tmMXFDZ08rdFVIMjJHZVVnWlFiTlVLdEVQ?=
 =?utf-8?B?L0VieStveVUzWlR5R0JTM0tmeVp3M0QwS1ZtSWVqOW5MTlZaNGpRdlMreWRU?=
 =?utf-8?Q?IKKpQ/4kK1AFPtG5rndyaywy7JYktwe+dv+xogB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2037
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4d6b3558-a2d4-48c5-ed7a-08d95e272b06
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kWwQFNIMJF07NP/X0zFV90VqnBpbd3nUlwui+uUKzrrUoKHZShMh5NNQ3sWfnk8nzFFrWGYzTdsYb/gH9FReq150oIR7RPYP5r3aRrehTW/JJHb8xHIYyaBPAMzJ2VAPrbFdgMhDnEMXFsyDNcEhvoEz0e5renYMMRQFSz2hGFomebeyLMDFq+lhkGvzZOXJXWXnAi8DYScSRaCbqDWkrR2rvfk/M/jbBhW8tAAXZJ2Ukzh7zGuIOTyC7Fv+wJiZt64FlbYkefzwlG+flZPzDHZu4GECBOFFCI4pFAhY9SDmrW2JFVrvB6T21tDV9DjBwWF7a9xOF25R0ESAVvhuahn2lqw9XUE16/injLueulnXIAA72ioCS8jxChZ5Z1Qdc0GC6QNo+GSLf4qObkSnJ+BtFe1tqfppYkUbHKkZ7al/XdpB4Q2HMq1aoEyG04/Zowuq6MFqtXoXkTSuO1hTkkwT12u1a4LWrA5qJaAzbp+UaKihAlwrukERFsNp8ANI1NckeiFW3ocrv9DhKNJ30/Uam/1SKcnchnT1Phw0+FFj9iv8Rzz9zoF8KEENoj9OT2B8+hKR5vpxyO92Lae+9vnbPgxRGV+D/HZF5831OLky9r60GQWr109fkYD3MTNN3xgbrwpWkjMRa8zfBFS3WzRnC24vXfMF59INcnhDYq2Ooyojx4ePqYmZ/DeFO4ObslqK7A2i2upc/jn0jlHPSg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(36840700001)(46966006)(53546011)(478600001)(47076005)(6506007)(26005)(36860700001)(83380400001)(6862004)(4326008)(7696005)(82310400003)(33656002)(8676002)(186003)(8936002)(336012)(82740400003)(9686003)(52536014)(70206006)(70586007)(81166007)(5660300002)(86362001)(356005)(54906003)(55016002)(316002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:54:23.8816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ebf798c-5312-4af0-48e0-08d95e272f3d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4702

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMeW5tDjmnIgxMeaXpSAxODo1NA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1hFTiBSRkMgUEFUQ0ggMDQvNDBdIHhlbi9hcm06IHJldHVybiBkZWZhdWx0IERNQSBi
aXQgd2lkdGgNCj4gd2hlbiBwbGF0Zm9ybSBpcyBub3Qgc2V0DQo+IA0KPiBPbiAxMS4wOC4yMDIx
IDEyOjIzLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm0u
Yw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybS5jDQo+ID4gQEAgLTI3LDYgKzI3LDcg
QEAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9kZXNjIF9zcGxhdGZvcm1bXSwNCj4gX2Vw
bGF0Zm9ybVtdOw0KPiA+ICAvKiBQb2ludGVyIHRvIHRoZSBjdXJyZW50IHBsYXRmb3JtIGRlc2Ny
aXB0aW9uICovDQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGxhdGZvcm1fZGVzYyAqcGxhdGZv
cm07DQo+ID4NCj4gPiArZXh0ZXJuIHVuc2lnbmVkIGludCBkbWFfYml0c2l6ZTsNCj4gDQo+IFRo
aXMgaXMgYSBuby1nbzogRGVjbGFyYXRpb25zIG5lZWQgdG8gbGl2ZSBpbiBhIGhlYWRlciB3aGlj
aCB0aGUgcHJvZHVjZXINCj4gYW5kIGFsbCBjb25zdW1lcnMgaW5jbHVkZS4gRWxzZSAuLi4NCg0K
T2ssIEkgd2lsbCBwbGFjZSBpdCB0byBhIGhlYWRlci4NCg0KPiANCj4gPiAtLS0gYS94ZW4vY29t
bW9uL3BhZ2VfYWxsb2MuYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+ID4g
QEAgLTIyNyw3ICsyMjcsNyBAQCBzdGF0aWMgYm9vbCBfX3JlYWRfbW9zdGx5IHNjcnViX2RlYnVn
Ow0KPiA+ICAgKiBCaXQgd2lkdGggb2YgdGhlIERNQSBoZWFwIC0tIHVzZWQgdG8gb3ZlcnJpZGUg
TlVNQS1ub2RlLWZpcnN0Lg0KPiA+ICAgKiBhbGxvY2F0aW9uIHN0cmF0ZWd5LCB3aGljaCBjYW4g
b3RoZXJ3aXNlIGV4aGF1c3QgbG93IG1lbW9yeS4NCj4gPiAgICovDQo+ID4gLXN0YXRpYyB1bnNp
Z25lZCBpbnQgZG1hX2JpdHNpemU7DQo+ID4gK3Vuc2lnbmVkIGludCBkbWFfYml0c2l6ZTsNCj4g
DQo+IC4uLiBhIGNoYW5nZSBoZXJlIChvZiBlLmcuIHRoZSB0eXBlKSB3aWxsIGdvIHVubm90aWNl
ZCBieSB0aGUgY29tcGlsZXIsDQo+IGFuZCB0aGUgY29uc3VtZXIgb2YgdGhlIHZhcmlhYmxlIG1h
eSBubyBsb25nZXIgd29yayBjb3JyZWN0bHkuDQo+IA0KDQpTb3JyeSwgSSBhbSBub3QgdmVyeSBj
bGVhciBhYm91dCB0aGlzIGNvbW1lbnQuDQoNCj4gQWxzbyBJJ20gYWZyYWlkIHRoZSBkZXNjcmlw
dGlvbiBkb2VzIG5vdCBtYWtlIGNsZWFyIHdoeSB0aGlzIHZhcmlhYmxlDQo+IGlzIHdoYXQgeW91
IHdhbnQgdG8gdXNlLiBDb25uZWN0ZWQgdG8gdGhpcyBpcyB0aGUgcXVlc3Rpb24gd2h5IHlvdSBu
ZWVkDQo+IHRvIGNvbnN1bWUgaXQgb24gQXJtIGluIHRoZSBmaXJzdCBwbGFjZSwgd2hlbiB4ODYg
bmV2ZXIgaGFkIHRoZSBuZWVkLg0KPiANCg0KRGlmZmVyZW50IEFybSBwbGF0Zm9ybXMgbWF5IGhh
dmUgZGlmZmVyZW50IERNQSBiaXRzaXplLiBTbyBpbiBteSBwcmV2aW91cw0KdGhvdWdodCwgSWYg
QXJtIHBsYXRmb3JtIGRvZXNuJ3QgcHJvdmlkZSBhbnkgRE1BIGJpdHNpemUgaW5mbywgSSB3aWxs
DQpyZXR1cm4gdGhlIHN5c3RlbSBETUEgYml0c2l6ZSAoZG1hX2JpdHNpemUpIGluIGFyY2hfZ2V0
X2RtYV9iaXRzaXplLg0KQnV0IHlvdXIgY29tbWVudCBtYWRlIG1lIHRoaW5rIGFnYWluLiBNeSBj
dXJyZW50IGNoYW5nZSBtYXkgaGF2ZSBmYWxsZW4NCmludG8gYSBsb2dpY2FsIGxvb3Bob2xlLiBk
bWFfYml0c2l6ZSBhcyBhIGhpZ2ggbGV2ZWwgdmFyaWFibGUsIGl0J3MNCnZhbHVlIGRlcGVuZHMg
b24geGVuIGJvb3QgY29tbWFuZCBsaW5lIG9yIGFyY2hfZ2V0X2RtYV9iaXRzaXplLg0KSSBjYW4n
dCB1c2UgaXQgZm9yIGFyY2hfZ2V0X2RtYV9iaXRzaXplJ3MgaW5wdXQuDQoNClNvIEkgdGhpbmss
IGluIG5leHQgdmVyc2lvbiwgSSB3aWxsIGRpc2NhcmQgdGhlIGNoYW5nZXMgb2YgZG1hX2JpdHNp
emUsDQpqdXN0IGtlZXAgdGhlIGNoYW5nZXMgaW4gYXJjaF9nZXRfZG1hX2JpdHNpemUgdG8gcmV0
dXJuIDAsIHdoZW4gcGxhdGZvcm0NCmhhc24ndCBzcGVjaWZ5IHRoZSBETUEgYml0c2l6ZS4gSnVz
dCBsaWtlOg0KDQp1bnNpZ25lZCBpbnQgYXJjaF9nZXRfZG1hX2JpdHNpemUodm9pZCkNCiB7DQot
ICAgIHJldHVybiAoIHBsYXRmb3JtICYmIHBsYXRmb3JtLT5kbWFfYml0c2l6ZSApID8gcGxhdGZv
cm0tPmRtYV9iaXRzaXplIDogMzI7DQorICAgIHJldHVybiAoIHBsYXRmb3JtICYmIHBsYXRmb3Jt
LT5kbWFfYml0c2l6ZSApID8gcGxhdGZvcm0tPmRtYV9iaXRzaXplDQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogMDsNCiB9DQoNClRoYW5rcywNCldl
aSBDaGVuDQoNCj4gSmFuDQoNCg==

