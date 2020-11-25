Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE052C4778
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 19:22:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37988.70592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khzQV-0002hn-HH; Wed, 25 Nov 2020 18:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37988.70592; Wed, 25 Nov 2020 18:21:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khzQV-0002hO-Dy; Wed, 25 Nov 2020 18:21:59 +0000
Received: by outflank-mailman (input) for mailman id 37988;
 Wed, 25 Nov 2020 18:21:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqAN=E7=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1khzQU-0002gf-7T
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 18:21:58 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.64]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9f07653-0e89-47d5-8a77-e7bfd432125b;
 Wed, 25 Nov 2020 18:21:55 +0000 (UTC)
Received: from MRXP264CA0002.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::14)
 by PR3PR08MB5819.eurprd08.prod.outlook.com (2603:10a6:102:92::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 25 Nov
 2020 18:21:53 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::d) by MRXP264CA0002.outlook.office365.com
 (2603:10a6:500:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Wed, 25 Nov 2020 18:21:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 25 Nov 2020 18:21:52 +0000
Received: ("Tessian outbound 814be617737e:v71");
 Wed, 25 Nov 2020 18:21:52 +0000
Received: from 605a731f6680.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A8B4863E-D059-4552-95C1-0BAC54E59237.1; 
 Wed, 25 Nov 2020 18:21:46 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 605a731f6680.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 25 Nov 2020 18:21:46 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB6073.eurprd08.prod.outlook.com (2603:10a6:10:1f7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Wed, 25 Nov
 2020 18:21:43 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 18:21:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MqAN=E7=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1khzQU-0002gf-7T
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 18:21:58 +0000
X-Inumbo-ID: c9f07653-0e89-47d5-8a77-e7bfd432125b
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown [40.107.5.64])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c9f07653-0e89-47d5-8a77-e7bfd432125b;
	Wed, 25 Nov 2020 18:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLfhbrK9LYwE2RBPiYt0z6OHpay32aY/DJpawgIffhg=;
 b=dwbnKzNpQxHFwFPds7E/9iWmXcgJZ8Y6jYLjoU/sLxqxAcqF85LBFf2814ZCVykt67gNbE8InYhChXcXzAirp5ybD+/Ke1ieRWmzLJ95l5D1RzN+3SM21blBsTCbUOxf7hrl7QgRqAbguuw3MBta8zM0ki/DzSX2ZW2+sIbGCPE=
Received: from MRXP264CA0002.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::14)
 by PR3PR08MB5819.eurprd08.prod.outlook.com (2603:10a6:102:92::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 25 Nov
 2020 18:21:53 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::d) by MRXP264CA0002.outlook.office365.com
 (2603:10a6:500:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Wed, 25 Nov 2020 18:21:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 25 Nov 2020 18:21:52 +0000
Received: ("Tessian outbound 814be617737e:v71"); Wed, 25 Nov 2020 18:21:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f6d0924bc956bd91
X-CR-MTA-TID: 64aa7808
Received: from 605a731f6680.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A8B4863E-D059-4552-95C1-0BAC54E59237.1;
	Wed, 25 Nov 2020 18:21:46 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 605a731f6680.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 25 Nov 2020 18:21:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5xd5mm9DVv8+AGK1kH6cofZjW9bWXQGXgB+/ipUimnGse0/EcBDAmAb4eB7gOqoQ7ddGLQpiSO/pvuSSNGgH83TTKSDbbqkW7yq4IXFN7D0yafC1OL8dyMJdC3vSJ9jX5c5FUYUiSMehCbo/5UStlckXqlrHpr3hO8nurCkJ18YsHZHQUJv1HXHxH3DDejMi90vSovJDfDzwcPLUEaCt1wb5IygAxgMk8aEKCiEXEJ6JS4wN7Ro/wAxZ6CdQ8of7uCCUxIEhao4jy92kQVfxZH5z+GtQ45JB0u/HoKW8cc17Ncz/QuzZYSVOLZ+Ii8Saq1XP/NUzncoLzWvyaYW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLfhbrK9LYwE2RBPiYt0z6OHpay32aY/DJpawgIffhg=;
 b=exqbBk+iAUeW2uSyMfYbRJdQfvwbgKbc6G4ccRlXPmZ7RtwmvkawB9yhVgunD4ys1Tcwrrad43dRZWTF9tzydGDlJyL+//Bij8yw3RP/8sTLm3D1Drq28qXvjrH3R9dFnaC2cZa33baKk5LG3ebhpQOdot2ZCloCEU0CDjvLPKN5Q/jaFA6cHiL29aKvaqRFNx9t7EBdw26kjRQ4Grkf5YT1VA41/ju1jk3IEqRKSVr8cMvGPnNqxhK7cCAv2sl8Ad85/CtyW8xoDTb1tI35Vi8KcJ0r41HGlzylYno2ACGm3nXnuQSLy4jxrMcIqkDf6jAUFDBD9lqlAx+JIDk4lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLfhbrK9LYwE2RBPiYt0z6OHpay32aY/DJpawgIffhg=;
 b=dwbnKzNpQxHFwFPds7E/9iWmXcgJZ8Y6jYLjoU/sLxqxAcqF85LBFf2814ZCVykt67gNbE8InYhChXcXzAirp5ybD+/Ke1ieRWmzLJ95l5D1RzN+3SM21blBsTCbUOxf7hrl7QgRqAbguuw3MBta8zM0ki/DzSX2ZW2+sIbGCPE=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB6073.eurprd08.prod.outlook.com (2603:10a6:10:1f7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Wed, 25 Nov
 2020 18:21:43 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 18:21:43 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v4 3/3] ns16550: Gate all PCI code with CONFIG_X86
Thread-Topic: [PATCH v4 3/3] ns16550: Gate all PCI code with CONFIG_X86
Thread-Index: AQHWw1cvjUPnGDPA302zQ9SdCrcARanZKPcA
Date: Wed, 25 Nov 2020 18:21:43 +0000
Message-ID: <A24BBAFF-2D6C-448A-955E-4471902C6413@arm.com>
References: <cover.1606326929.git.rahul.singh@arm.com>
 <6d64bb35a6ce247faaa3df2ebae27b6bfa1d969e.1606326929.git.rahul.singh@arm.com>
In-Reply-To:
 <6d64bb35a6ce247faaa3df2ebae27b6bfa1d969e.1606326929.git.rahul.singh@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d7e42557-e2ae-41ca-f08e-08d8916efbbe
x-ms-traffictypediagnostic: DBBPR08MB6073:|PR3PR08MB5819:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB581974A7BA206E710250EEE9FCFA0@PR3PR08MB5819.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /i64okDlhDE5x2s8tzPktNqBiNkPbLe6S4obOAtrbCywbymO7Ly+sM+UdK1xvewHqMMxlCRXviuzs419XhFdDurW/LQLUgtva6AAwf3JJiW2Id00ZvKDLBLmr4djdUmu6CmH+R5oFAUfrFHimdqiss9C+f/6R3EDby9MMuB5mp5tEeubKoEVemrXV0910XWrEkdRP0bQbvTruORtuinZm/MM79xiGAXcSUYdG71XhDwzlb2DdBsJDB/eqdUyi5rPEbDWoIECmszaVY0wFCMqR7kJKLQidgjnhd8U4jInz15tOUQZU5PSAiA99revDljKVPMehVdLGraDMHjSnAL99A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(86362001)(36756003)(33656002)(71200400001)(6512007)(478600001)(4326008)(2616005)(54906003)(8676002)(5660300002)(2906002)(26005)(8936002)(83380400001)(186003)(6916009)(316002)(53546011)(91956017)(76116006)(6486002)(66476007)(66556008)(64756008)(66446008)(6506007)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?UE9vSFZFK09BN1VDQ25hR3lPby9xT3A4QXNwQ2hUek5OTGEzaEh3Q1BkR1lk?=
 =?utf-8?B?MUxtdkRCK00vYUZCVWcyVmZ6QXIzMGk3WlVYdk9rZlIrOWJXYTJ1ZGI5YmlF?=
 =?utf-8?B?WTBKUzJScEJRbXBzOGUvVXlhTzdscEV0UVhQQXY4MFZxZWtKN1M1alNOS2lE?=
 =?utf-8?B?T2o5bXhIR01tWXorMUZmTHB3a2p6bUcrUDlDVDFwNGZmSkhuWTJabEtEZ0c5?=
 =?utf-8?B?U1hIMzFUY2hBME1BVGV1ZVc1SC9Hd2pJR1pleE5RYkpjc1lseWxlNjJvSlhF?=
 =?utf-8?B?cDVzYjRXMXhkRmI5aG1LZU4raWo1OUdFWXFBaXVZY0Rrc0hRT1dWdDFxQkV0?=
 =?utf-8?B?MWREbzdGK2cwZWlqOEpBOERCNXNkYnZJUFJ5VGlRSlpGdmQ3eW55VnlMeVVV?=
 =?utf-8?B?akxzTVRpbG81cWNLTnhDcE8xMFoxYmZZUnpyQmMyZkZySUdZdXU5Ui9WQ2tS?=
 =?utf-8?B?eGdCMTFLSlhEUmNROTduZEhIZjhhY2VPeUVEVG9Iemk5ODFWbnVWMGlObWFM?=
 =?utf-8?B?N2xkS3hnRmVLcEQrSmdFQUJFTWtYVEpMRkhiYmdZa3AybjJ3ZGw4UWEzUUc4?=
 =?utf-8?B?NGxRSnNoQTRpT3hTekc4S2tEYnhBMU9URXRmM285elZUVkhaZzNLdzRaVGx2?=
 =?utf-8?B?NXdJTkEvSkNzc29Yc3dpRkJvZ1Nmd3J4aTVqcU9vcW56aUFKYnBCRVg1cDlV?=
 =?utf-8?B?N0NmSTBBMGo5aHJCSlAzcElJNTBZQ2RQN003ZmxZWkRCc2JPeXZKazBjVzVI?=
 =?utf-8?B?QmpEaU1pMk82Y2MvZWIvTDNDUm1aWGE5bG1zZzlHeU5aMHp0cHF0WHF6OTFi?=
 =?utf-8?B?MnNIb2RrZlVnS0thVE9nclZlS2lud2NLcFJSSk5CNUkwb0dCeklEbFp5VVRG?=
 =?utf-8?B?clRSRGlmWFk2ajhxdEtrY1pFNG0vV1FIUGk1VzJxYmM0OWNLSnJsWTgvZ0dy?=
 =?utf-8?B?Q0hWMFZqY3VYWXZPaHRxejBmakpnSE1lOUpxS1FqRWVHUm84U29Cak4wYkhO?=
 =?utf-8?B?UTkvL3VzSXRFNjUzN05TM3Q2UGxrTnNmVXlPSE5iQy9vbFV5ZTNzSzczRmY0?=
 =?utf-8?B?Z0FSdzVFWERmMTN0TWtHdm5ZTHUySVN1ajVObnBTTEEvelpHS0VTdjhwTGpG?=
 =?utf-8?B?VDYvOGJUV2EwTnlKUWlIMHl5TzV3dkhwSHYvcThub2pNd1RRUWVlQUp4eHVi?=
 =?utf-8?B?amZKcVJYNDlSUXNuQThJTHNxeVRCVWxDVDZiaXFOTmFjaXZCWlFKbXFKZWZk?=
 =?utf-8?B?WVpWeWtySjZtVVUvWkVJa1Q0SDhpZVFERkp2ZVcrclhNQlBVVElKRFRuU1RU?=
 =?utf-8?Q?mbSP0aLjSS4C5+41AbWPWgRdJOdpHSKzMu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78A05B04AAAB4F4380AD1EB22ED5E94B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6073
Original-Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	11da004b-5af1-4d12-3f26-08d8916ef620
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MnnBF16t7ouaKUpECrBFQRUdQmC8L56JssJIQW3nlkusOfxQuvh5ItEMEM0hvQC9kR3KMR99CyRCAnCkZlBI51CD+MM2hVKNhPDpzwtr2bW7mIIzPROSTncmgukI1ieKgy1uU1JEi8tfDbgkQa8UpxaDUe2rhi7fkiwFTdz3UKxW300+jDgo/XU0OWF0z5Fqkb9w8q6g7NNRcyQmMl56mjP55k/26PZr64mIP3Pc0SMugD/SsBHQJw9doprXoputCIyO/rJfRvCoGt7jMqmNK8tt5Uaqz+HikLknqBByNIYQzSCwKRpDy7VJE+DApqnshO0/N3cKBqpQIXrFy7fmqVo6cuajJEXHGVafc+LrwnFCPJl//IaZmWcvbvb2YbTscXHVeRW0588kMIJFujYrYg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39850400004)(396003)(46966005)(47076004)(26005)(82740400003)(8936002)(316002)(33656002)(70586007)(6486002)(81166007)(356005)(36756003)(70206006)(6512007)(2616005)(6916009)(336012)(8676002)(186003)(2906002)(54906003)(82310400003)(4326008)(86362001)(53546011)(478600001)(5660300002)(6506007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 18:21:52.7230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e42557-e2ae-41ca-f08e-08d8916efbbe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5819

SGVsbG8gSnVsaWVuLA0KDQo+IE9uIDI1IE5vdiAyMDIwLCBhdCA2OjE2IHBtLCBSYWh1bCBTaW5n
aCA8cmFodWwuc2luZ2hAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBUaGUgTlMxNjU1MCBkcml2ZXIg
aXMgYXNzdW1pbmcgdGhhdCBOUzE2NTUwIFBDSSBjYXJkIGFyZSB1c2FibGUgaWYgdGhlDQo+IGFy
Y2hpdGVjdHVyZSBzdXBwb3J0cyBQQ0kgKGkuZS4gQ09ORklHX0hBU19QQ0k9eSkuIEhvd2V2ZXIs
IHRoZSBjb2RlIGlzDQo+IHZlcnkgeDg2IGZvY3VzIGFuZCB3aWxsIGZhaWwgdG8gYnVpbGQgb24g
QXJtICgvIVwgaXQgaXMgbm90IGFsbCB0aGUNCj4gZXJyb3JzKToNCj4gDQo+IG5zMTY1NTAuYzog
SW4gZnVuY3Rpb24g4oCYbnMxNjU1MF9pbml0X2lyceKAmToNCj4gbnMxNjU1MC5jOjcyNjoyMTog
ZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGNyZWF0ZV9pcnHigJk7
DQo+IGRpZCB5b3UgbWVhbiDigJhyZWxlYXNlX2lyceKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVu
Y3Rpb24tZGVjbGFyYXRpb25dDQo+ICAgICAgICAgIHVhcnQtPmlycSA9IGNyZWF0ZV9pcnEoMCwg
ZmFsc2UpOw0KPiAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+DQo+ICAgICAgICAgICAg
ICAgICAgICAgIHJlbGVhc2VfaXJxDQo+IG5zMTY1NTAuYzo3MjY6MjE6IGVycm9yOiBuZXN0ZWQg
ZXh0ZXJuIGRlY2xhcmF0aW9uIG9mIOKAmGNyZWF0ZV9pcnHigJkNCj4gWy1XZXJyb3I9bmVzdGVk
LWV4dGVybnNdDQo+IG5zMTY1NTAuYzogSW4gZnVuY3Rpb24g4oCYbnMxNjU1MF9pbml0X3Bvc3Rp
cnHigJk6DQo+IG5zMTY1NTAuYzo3Njg6MzM6IGVycm9yOiDigJhtbWlvX3JvX3Jhbmdlc+KAmSB1
bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcw0KPiBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDi
gJhtbWlvX2hhbmRsZXLigJk/DQo+ICAgICAgICAgICAgICAgcmFuZ2VzZXRfYWRkX3JhbmdlKG1t
aW9fcm9fcmFuZ2VzLCB1YXJ0LT5pb19iYXNlLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBefn5+fn5+fn5+fn5+fg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBtbWlvX2hhbmRsZXINCj4gbnMxNjU1MC5jOjc2ODozMzogbm90ZTogZWFjaCB1bmRlY2xhcmVk
IGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlDQo+IGZvciBlYWNoIGZ1bmN0aW9uIGl0
IGFwcGVhcnMgaW4NCj4gbnMxNjU1MC5jOjc4MDoyMDogZXJyb3I6IHZhcmlhYmxlIOKAmG1zaeKA
mSBoYXMgaW5pdGlhbGl6ZXIgYnV0IGluY29tcGxldGUNCj4gdHlwZQ0KPiAgICAgICAgICAgICAg
c3RydWN0IG1zaV9pbmZvIG1zaSA9IHsNCj4gICAgICAgICAgICAgICAgICAgICBefn5+fn5+fg0K
PiANCj4gRW5hYmxpbmcgc3VwcG9ydCBmb3IgTlMxNjU1MCBQQ0kgY2FyZCBvbiBBcm0gd291bGQg
cmVxdWlyZSBtb3JlIHBsdW1iaW5nDQo+IGluIGFkZGl0aW9uIHRvIGZpeGluZyB0aGUgY29tcGls
YXRpb24gZXJyb3IuDQo+IA0KPiBBcm0gc3lzdGVtcyB0ZW5kIHRvIGhhdmUgcGxhdGZvcm0gVUFS
VCBhdmFpbGFibGUgc3VjaCBhcyBOUzE2NTUwLCBQTDAxMS4NCj4gU28gdGhlcmUgYXJlIGxpbWl0
ZWQgcmVhc29ucyB0byBnZXQgTlMxNjU1MCBQQ0kgc3VwcG9ydCBmb3Igbm93IG9uIEFybS4NCj4g
DQo+IEd1YXJkIGFsbCByZW1haW5pbmcgUENJIGNvZGUgdGhhdCBpcyBub3QgdW5kZXIgeDg2IGZs
YWcgd2l0aCBDT05GSUdfWDg2Lg0KPiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4N
Cg0KU29ycnkgSSBtaXNzZWQgdG8gYWRkIHRoZSBzaWduZWQgb2ZmIGZvciB0aGUgY29tbWl0IG1z
Zy4gSSB3aWxsIHNlbmQgdGhlIG5leHQgdmVyc2lvbiBvbmNlIHJldmlld2VkIGRvbmUuDQpTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KDQpSZWdhcmRzLA0K
UmFodWwNCj4gLS0tDQo+IA0KPiBDaGFuZ2VzIGluIHY0Og0KPiAtIEFzIHBlciB0aGUgZGlzY3Vz
c2lvbiBndWFyZCBhbGwgcmVtYWluaW5nIFBDSSBjb2RlIHdpdGggQ09ORklHX1g4Ng0KPiANCj4g
LS0tDQo+IHhlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jIHwgMTYgKysrKysrKystLS0tLS0tLQ0K
PiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jIGIveGVuL2RyaXZlcnMvY2hh
ci9uczE2NTUwLmMNCj4gaW5kZXggOTIzNWQ4NTRmZS4uMjZlNjAxODU3YSAxMDA2NDQNCj4gLS0t
IGEveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMNCj4gKysrIGIveGVuL2RyaXZlcnMvY2hhci9u
czE2NTUwLmMNCj4gQEAgLTE2LDcgKzE2LDcgQEANCj4gI2luY2x1ZGUgPHhlbi90aW1lci5oPg0K
PiAjaW5jbHVkZSA8eGVuL3NlcmlhbC5oPg0KPiAjaW5jbHVkZSA8eGVuL2lvY2FwLmg+DQo+IC0j
aWZkZWYgQ09ORklHX0hBU19QQ0kNCj4gKyNpZiBkZWZpbmVkKENPTkZJR19YODYpICYmIGRlZmlu
ZWQoQ09ORklHX0hBU19QQ0kpDQo+ICNpbmNsdWRlIDx4ZW4vcGNpLmg+DQo+ICNpbmNsdWRlIDx4
ZW4vcGNpX3JlZ3MuaD4NCj4gI2luY2x1ZGUgPHhlbi9wY2lfaWRzLmg+DQo+IEBAIC01MSw3ICs1
MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgbnMxNjU1MCB7DQo+ICAgICB1bnNpZ25lZCBpbnQgdGltZW91
dF9tczsNCj4gICAgIGJvb2xfdCBpbnRyX3dvcmtzOw0KPiAgICAgYm9vbF90IGR3X3Vzcl9ic3k7
DQo+IC0jaWZkZWYgQ09ORklHX0hBU19QQ0kNCj4gKyNpZiBkZWZpbmVkKENPTkZJR19YODYpICYm
IGRlZmluZWQoQ09ORklHX0hBU19QQ0kpDQo+ICAgICAvKiBQQ0kgY2FyZCBwYXJhbWV0ZXJzLiAq
Lw0KPiAgICAgYm9vbF90IHBiX2JkZl9lbmFibGU7ICAgLyogaWYgPTEsIHBiLWJkZiBlZmZlY3Rp
dmUsIHBvcnQgYmVoaW5kIGJyaWRnZSAqLw0KPiAgICAgYm9vbF90IHBzX2JkZl9lbmFibGU7ICAg
LyogaWYgPTEsIHBzX2JkZiBlZmZlY3RpdmUsIHBvcnQgb24gcGNpIGNhcmQgKi8NCj4gQEAgLTY2
LDcgKzY2LDcgQEAgc3RhdGljIHN0cnVjdCBuczE2NTUwIHsNCj4gI2VuZGlmDQo+IH0gbnMxNjU1
MF9jb21bMl0gPSB7IHsgMCB9IH07DQo+IA0KPiAtI2lmZGVmIENPTkZJR19IQVNfUENJDQo+ICsj
aWYgZGVmaW5lZChDT05GSUdfWDg2KSAmJiBkZWZpbmVkKENPTkZJR19IQVNfUENJKQ0KPiBzdHJ1
Y3QgbnMxNjU1MF9jb25maWcgew0KPiAgICAgdTE2IHZlbmRvcl9pZDsNCj4gICAgIHUxNiBkZXZf
aWQ7DQo+IEBAIC0yNTYsNyArMjU2LDcgQEAgc3RhdGljIGludCBuczE2NTUwX2dldGMoc3RydWN0
IHNlcmlhbF9wb3J0ICpwb3J0LCBjaGFyICpwYykNCj4gDQo+IHN0YXRpYyB2b2lkIHBjaV9zZXJp
YWxfZWFybHlfaW5pdChzdHJ1Y3QgbnMxNjU1MCAqdWFydCkNCj4gew0KPiAtI2lmZGVmIENPTkZJ
R19IQVNfUENJDQo+ICsjaWYgZGVmaW5lZChDT05GSUdfWDg2KSAmJiBkZWZpbmVkKENPTkZJR19I
QVNfUENJKQ0KPiAgICAgaWYgKCAhdWFydC0+cHNfYmRmX2VuYWJsZSB8fCB1YXJ0LT5pb19iYXNl
ID49IDB4MTAwMDAgKQ0KPiAgICAgICAgIHJldHVybjsNCj4gDQo+IEBAIC0zNTUsNyArMzU1LDcg
QEAgc3RhdGljIHZvaWQgX19pbml0IG5zMTY1NTBfaW5pdF9wcmVpcnEoc3RydWN0IHNlcmlhbF9w
b3J0ICpwb3J0KQ0KPiANCj4gc3RhdGljIHZvaWQgX19pbml0IG5zMTY1NTBfaW5pdF9pcnEoc3Ry
dWN0IHNlcmlhbF9wb3J0ICpwb3J0KQ0KPiB7DQo+IC0jaWZkZWYgQ09ORklHX0hBU19QQ0kNCj4g
KyNpZiBkZWZpbmVkKENPTkZJR19YODYpICYmIGRlZmluZWQoQ09ORklHX0hBU19QQ0kpDQo+ICAg
ICBzdHJ1Y3QgbnMxNjU1MCAqdWFydCA9IHBvcnQtPnVhcnQ7DQo+IA0KPiAgICAgaWYgKCB1YXJ0
LT5tc2kgKQ0KPiBAQCAtMzk3LDcgKzM5Nyw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBuczE2NTUw
X2luaXRfcG9zdGlycShzdHJ1Y3Qgc2VyaWFsX3BvcnQgKnBvcnQpDQo+ICAgICB1YXJ0LT50aW1l
b3V0X21zID0gbWF4X3QoDQo+ICAgICAgICAgdW5zaWduZWQgaW50LCAxLCAoYml0cyAqIHVhcnQt
PmZpZm9fc2l6ZSAqIDEwMDApIC8gdWFydC0+YmF1ZCk7DQo+IA0KPiAtI2lmZGVmIENPTkZJR19I
QVNfUENJDQo+ICsjaWYgZGVmaW5lZChDT05GSUdfWDg2KSAmJiBkZWZpbmVkKENPTkZJR19IQVNf
UENJKQ0KPiAgICAgaWYgKCB1YXJ0LT5iYXIgfHwgdWFydC0+cHNfYmRmX2VuYWJsZSApDQo+ICAg
ICB7DQo+ICAgICAgICAgaWYgKCB1YXJ0LT5wYXJhbSAmJiB1YXJ0LT5wYXJhbS0+bW1pbyAmJg0K
PiBAQCAtNDc3LDcgKzQ3Nyw3IEBAIHN0YXRpYyB2b2lkIG5zMTY1NTBfc3VzcGVuZChzdHJ1Y3Qg
c2VyaWFsX3BvcnQgKnBvcnQpDQo+IA0KPiAgICAgc3RvcF90aW1lcigmdWFydC0+dGltZXIpOw0K
PiANCj4gLSNpZmRlZiBDT05GSUdfSEFTX1BDSQ0KPiArI2lmIGRlZmluZWQoQ09ORklHX1g4Nikg
JiYgZGVmaW5lZChDT05GSUdfSEFTX1BDSSkNCj4gICAgIGlmICggdWFydC0+YmFyICkNCj4gICAg
ICAgIHVhcnQtPmNyID0gcGNpX2NvbmZfcmVhZDE2KFBDSV9TQkRGKDAsIHVhcnQtPnBzX2JkZlsw
XSwgdWFydC0+cHNfYmRmWzFdLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dWFydC0+cHNfYmRmWzJdKSwgUENJX0NPTU1BTkQpOw0KPiBAQCAtNDg2LDcgKzQ4Niw3IEBAIHN0
YXRpYyB2b2lkIG5zMTY1NTBfc3VzcGVuZChzdHJ1Y3Qgc2VyaWFsX3BvcnQgKnBvcnQpDQo+IA0K
PiBzdGF0aWMgdm9pZCBfbnMxNjU1MF9yZXN1bWUoc3RydWN0IHNlcmlhbF9wb3J0ICpwb3J0KQ0K
PiB7DQo+IC0jaWZkZWYgQ09ORklHX0hBU19QQ0kNCj4gKyNpZiBkZWZpbmVkKENPTkZJR19YODYp
ICYmIGRlZmluZWQoQ09ORklHX0hBU19QQ0kpDQo+ICAgICBzdHJ1Y3QgbnMxNjU1MCAqdWFydCA9
IHBvcnQtPnVhcnQ7DQo+IA0KPiAgICAgaWYgKCB1YXJ0LT5iYXIgKQ0KPiAtLSANCj4gMi4xNy4x
DQo+IA0KDQo=

