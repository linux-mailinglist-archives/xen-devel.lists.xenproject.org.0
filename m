Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6B03887BC
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 08:44:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129880.243568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljFvt-0005xO-1R; Wed, 19 May 2021 06:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129880.243568; Wed, 19 May 2021 06:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljFvs-0005v4-TX; Wed, 19 May 2021 06:43:52 +0000
Received: by outflank-mailman (input) for mailman id 129880;
 Wed, 19 May 2021 06:43:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TeaP=KO=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ljFvs-0005uy-59
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 06:43:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.81]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a3c4676-f627-41f0-b1bb-47e4d84d35e9;
 Wed, 19 May 2021 06:43:48 +0000 (UTC)
Received: from AM5PR0602CA0011.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::21) by AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 06:43:46 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::d6) by AM5PR0602CA0011.outlook.office365.com
 (2603:10a6:203:a3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.33 via Frontend
 Transport; Wed, 19 May 2021 06:43:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 06:43:46 +0000
Received: ("Tessian outbound 3c5232d12880:v92");
 Wed, 19 May 2021 06:43:45 +0000
Received: from a14a8ee00a0d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB202A36-AF05-409E-A74D-3D6E89A796B9.1; 
 Wed, 19 May 2021 06:43:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a14a8ee00a0d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 May 2021 06:43:39 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4368.eurprd08.prod.outlook.com (2603:10a6:803:fe::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 06:43:28 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 06:43:28 +0000
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
X-Inumbo-ID: 9a3c4676-f627-41f0-b1bb-47e4d84d35e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDkPoAmre9aQNnw42rYDOBvpVXncRLGsNG06vQE78PI=;
 b=HD6HuCzGFz4KIzqcFP+opPFptCfRfTiPbCFYfst/EbFBWQFuKaHuYG3SMo+qtc0to/14a6hpCf7nd8dSkDa7BamwHTSjqBkOZjjSQznoZIIfBeTVdMnnbVKnCRGDO6v49TFKfz3cY6BXFcs2DFYnjQ/pLgzoac0jsDxcbJk1yLE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gvo/E+0Ogfogq5gznPetqKAh3HunWoI0bRDqxx1jd3z/IHe6xe7qzsEe1SEZnXxf6p8LvYgApS+zQy0B+GMhoafQFh9mdyKksSOfkcJ8PGCW9soFo+hVpvT2P15at2k6i+zHvzIrAjoq7fwvtAUbKzurmOLKRBUKDvIGPWYhhIg2txSk2Wkh1I3W8g0QsMhCMFSCitnpGmZzwPa/ZQMaQyh3bETPDztkgnOXYXHRne0xp2Je4F1HfAUBSDkPNuxEMj7kYEi1YKFb9Cj9p68oM1jNx2Fz0nidYxWsFJqKbOwCtcXHsVgPkYNZfiS13JaatDSBz2t0D4S31ZQuxsXWgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDkPoAmre9aQNnw42rYDOBvpVXncRLGsNG06vQE78PI=;
 b=SNVc+zcM4LhWRu4XU/qBv+huzCKyfNMBxIpTLOFXG/tWeGZXOJ7mofXFDTCRnPu24Y3VjxRLl7neB495IuaclnokXLiUDAxWY4t7GPy3p9m1c8WLp1sUkUwT3vObqYGajECDPS/Y0gyaEZ70eelTmek45+oBTVJwzWDYWDVruiOJtDDQdXVqqs7SL0UeLPX0j1E299TKD9el1pQznnH4M8jtLGfZCyGNknohtOkiHSnUxdXD6gZ6iRWiOeQVwoBsbnVjVs0fFUoYXBIoSXMzpPSPesALF/kqkwRBJ9tjmfG+tS6DYtHp0a9lJzcynp2xpgX+Air5j9ccklBu5bcW4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDkPoAmre9aQNnw42rYDOBvpVXncRLGsNG06vQE78PI=;
 b=HD6HuCzGFz4KIzqcFP+opPFptCfRfTiPbCFYfst/EbFBWQFuKaHuYG3SMo+qtc0to/14a6hpCf7nd8dSkDa7BamwHTSjqBkOZjjSQznoZIIfBeTVdMnnbVKnCRGDO6v49TFKfz3cY6BXFcs2DFYnjQ/pLgzoac0jsDxcbJk1yLE=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH 08/10] xen/arm: introduce reserved_page_list
Thread-Topic: [PATCH 08/10] xen/arm: introduce reserved_page_list
Thread-Index: AQHXS6XFXoougD95T02cEJMQScUNQ6rpEy8AgAFDiqA=
Date: Wed, 19 May 2021 06:43:28 +0000
Message-ID:
 <VE1PR08MB5215D90DCB8B2BB6DF6140EDF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-9-penny.zheng@arm.com>
 <c002d9b2-8210-1c03-b374-76e037b65e2f@xen.org>
In-Reply-To: <c002d9b2-8210-1c03-b374-76e037b65e2f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0C72FC08968CD642B9A78CEA2E5C66DB.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 64c3b6d2-4d35-4a3f-16ce-08d91a9173a5
x-ms-traffictypediagnostic: VI1PR08MB4368:|AM0PR08MB3972:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB397242897EE9C76A301F1110F72B9@AM0PR08MB3972.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:935;OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ePI7QNpKkG2lOGiQCyBmipz6d6fkO5kz/zg5H4YZqBB4ZJBXrAUlFG16DnhAj+rTt+maatc6+3zTjedk6xz2jW2XUlZj4EiA5vkMELRLcE8CMhm9df78IzFOVRYrTc+j+1civFKELsJG2WW/LzeylL04bPwWG0mRgWHK2xntzBa2dNxrzKefOpXjANNPw1EoFJNVKCqthkzkyAdSyKy0vhwqAEVTT0saWQ2QNKUHvcJJwFkxhj1aHZZRWZT1M9osbG4sUWWPhVsgjko9HJzQ44bQWWWWy0orhIUPMOf7lJQxPPaxT0uagTDuwnifTLD8ZBbD0bdMfPiDZ8+FdLrAZZJqiDW8IQ7+AxxrCs0ENvL7QAzCxMezuNrcO8hNjVMP0Co19hj1dPIkbNHviRLItwsxx2CdNzqTpjum5H5nTDx5xWSiRNQMWW08VNC0Ws2APGgSgtrAEjZbglq4V5WFFbgUSIvCT8Vd7mvIp3/QKsHtl7tcOqy2pSt3D0d9jaNwaSrZB2R1cv88UeJI2vZU9FzkSOjuwtpo3eoRZEbdXmrFY0iZ/oxVp1J9Pl7nzOFOs+I5JQz/U2onT3tOsWYW+8Ras0vCQzxzornwJ8v/Ts8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(5660300002)(54906003)(4326008)(66446008)(110136005)(316002)(66946007)(76116006)(52536014)(66556008)(86362001)(186003)(64756008)(478600001)(2906002)(33656002)(122000001)(55016002)(8936002)(66476007)(71200400001)(83380400001)(26005)(8676002)(6506007)(38100700002)(9686003)(53546011)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?ejhVWENEc29USGtHam1nLy9KdHZiSkJXTjFIQjk5THJaSmJ0T2xMc2l4QndE?=
 =?utf-8?B?QVdyN3JZYTVGYmVXK3V0NmhETGZMWTZPcXlMY0RZOW1JOS9TU21zM1VjQTN5?=
 =?utf-8?B?YXFHVkxaN1dxNXBaVE5Zc1hHVXBtaEdhSzJtS0tOdTV5M0xNckJpSTZLMWQ1?=
 =?utf-8?B?SnJFbkFybnQ4ZVVrVkIrRkF1N2lWKzU1R01DUFBmaWszejIzT0p6NnZQMFR5?=
 =?utf-8?B?dCt0ZlU4b2ZHTmREOE1XY3R2Uzd5SmZ3UExEZVJsTDAxZzR2b3BDaENqREsy?=
 =?utf-8?B?RU9UZVNBbGZDTHFxQndhZHdmd3lSak92NXR2SXd5cmVDeFUyY3gvTkRRZEUz?=
 =?utf-8?B?V0dvUUlzSHdwQXA2dTR3b0tKRTYyemx0Q3NQUFptUHVjMVBPd2F2dEhHK00r?=
 =?utf-8?B?UHMxM2g3dWRmcis1bFptRnQ5TmVmdUtyVXVIaGE3YTRXSWRicE0rOUIvQXhT?=
 =?utf-8?B?Mi9vV2FRK000YTFNZk1ZaXc0S08vUDFIQzF3VXhFUkNJZ3B1TDZPYnlqWUZH?=
 =?utf-8?B?a1RMRDArSkg4MzcyNGdtNmtWcTFJZjg5STd1RXB4c3pRZWJxeWVyNG9DMGxy?=
 =?utf-8?B?WDlxYXdOVTVrTjh6TVBFNEl6ZkNtNWJ1Ym84UE9oWndyV1Ivd3ZvMWZyNGp4?=
 =?utf-8?B?VXY4NVpZTmpBR2hvbUU3RnV3WEVIZnRWU2dPM2xlQXA1NXU2WlBRUHF2M2VY?=
 =?utf-8?B?YStVc0FyVG5aMDVEZUdLRUZXUlQra05td29LOWh0N2U5ZVB1cFZ6NGptbnNH?=
 =?utf-8?B?Tm1HSjNyOUEwRVVZb0wyTmFDTmVoTUovN0ZhWGpudE1HQmRIc1dYSUlBOS9F?=
 =?utf-8?B?alN6OE5nODBuVHVJYkVkQUhTT0VmMjhlR2pSdjFRckdOQXVLREJRVlZzQjBj?=
 =?utf-8?B?RjVIMVF5Ry9LMGhGK3ZJd1NRZ0crREx6cGJzOGNFc3ljbHJTMEduc2QyWEtZ?=
 =?utf-8?B?c3E2Ly9mSnBsMU1yYXV3VmVDRWpCWFQ1SGl2dzUwNUZ2YU9BWGw4a2l3MnM0?=
 =?utf-8?B?ekxvNEg5d2NBT3hZRlNZM1FjWkJoalBMWVZlcGh2Q29MWFU1ZnlCQTdNbGR2?=
 =?utf-8?B?d1djQ2tQR0tCTTlLQzU2dnlkNmc0cDEvWWg4eE9TUEE2anpoV1BnQ1Y3bGo5?=
 =?utf-8?B?VEJyMFZ5UG4wbW1BSnM3SDRpZHFGanZXWXF3NTRJb0YwdVZ3U2lTbkNSL1ZK?=
 =?utf-8?B?MkFuNUo5M2p6V2tlTGVwcktkcVE5YXBDZFRuOG8wQ1d0bTltQURhUG1RVnVF?=
 =?utf-8?B?NGgxeHd1MTdWSCtQQWpvcURsdzhPaHZBSUR4Z1VNdS8vN0RGZ2lMRWZaV3lz?=
 =?utf-8?B?MFRVWDFkamRzaGdvU215alRtNGhyUkNpdUhzMkJVYkpybFRPRWE3WEFzQ25h?=
 =?utf-8?B?Rm5qSnhtVU80eStpMk5uK3hIYmI1STQ5L2hTYmVYREFmdXBRYjlVQ2Ywd3lJ?=
 =?utf-8?B?akEvZUE3VTFxeGtMekNZQis4UWlYQ0J0Y0xGV0ErTUFaa2dkdFlhSk1Qcnkz?=
 =?utf-8?B?Z041R0VZRml5b1R3cWFNWm5VdmNlZlM1TGwyaTRRVmN3WFB0VFhSTWNIZVlQ?=
 =?utf-8?B?d293YjZvd3hmWTZFZkVaQ2RQSHRvdjJ5WUZRZm9BWUpTeDBrbmgyWXpxT1NI?=
 =?utf-8?B?ajFOWXpWZTI4NmJIWWptVDlrT1ZWUTU2YVBPOVZ4NmFQV0ZMdXV2enhIUVlW?=
 =?utf-8?B?ZldLRVNjbjFEdHVRdFhiS3cydEhCeXRxWUpISlRoK1h2RCtWMWVvNm9od2Zp?=
 =?utf-8?Q?SYEz6AOxXhozGBJLAKQO/ZDeTsyQASJ/pUiNbbS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4368
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	db6c401e-cdc4-4c2b-0ef1-08d91a916910
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5vNRiIEJnbrQB1QHlrRki0LjrxViX0tFMelKXOzdq9+zFNcztLQYV7kQ1hEeMXVtxxejPy+KZQWz+PdCaQSURRD/Rm8ADMRLlhMyae0/o8jENByfJe44xgp5ndYXAEcPBA2RHx19ZAu5R5CtxXOeTJBW8bCfc2xyKCXqNtERyG1ZlrLOWspefhSTOdwGdkw+NKN35iZXWwWVkEuroD5l9qcCwitTARYpN2c97HW7+dUvnBnlilT2UCw7SOLCR+1dki20zR4TWtJtA23ZXRdt63RmJL+fNtpDPOp6LZlq7zsQ5dR1KhqFS2luyTzr7UvWLawdyDAnJU8SGeDiRPoy7IFgYRGb9rOhFnjhiFC3CUkAyZMY/1YYc7KCtQRBotMw8UQ1VHTb/mBwoIC0PRzYZG81JGtXSkqCdFFtL3gLuaUhXHv9GEXUTXNjUSI+HcNJ0FzHrqMti+AkSXo/ft+lTdVQqAIOvKnHpGOqLGX/MWZF6AOjT94sqrrVLthp65P39ENBimSO5ahgf85k7Ns8I58atiLctfGGEFRqglKs+urmuHoDZObGQhHT64isvZnXOyuGBexVygOJeOwJRJGx/mr5MjR0153dqj47RVUMMeIa5GaEUIlm5Xrkd0TI7eY2IoNCOGviNUgWKsEJHeJcxrH+c4iSyteeqd2sVUdxMIg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(46966006)(36840700001)(36860700001)(356005)(70206006)(81166007)(52536014)(33656002)(4326008)(26005)(8676002)(9686003)(47076005)(82310400003)(54906003)(8936002)(70586007)(86362001)(53546011)(186003)(2906002)(110136005)(336012)(478600001)(316002)(6506007)(82740400003)(55016002)(83380400001)(5660300002)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 06:43:46.1595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c3b6d2-4d35-4a3f-16ce-08d91a9173a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3972

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgTWF5IDE4LCAyMDIxIDc6
MDIgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBC
ZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8
V2VpLkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDA4LzEwXSB4ZW4vYXJtOiBpbnRyb2R1Y2UgcmVzZXJ2ZWRfcGFnZV9saXN0DQo+IA0KPiBIaSBQ
ZW5ueSwNCj4gDQo+IE9uIDE4LzA1LzIwMjEgMDY6MjEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+
IFNpbmNlIHBhZ2VfbGlzdCB1bmRlciBzdHJ1Y3QgZG9tYWluIHJlZmVycyB0byBsaW5rZWQgcGFn
ZXMgYXMgZ3VlYXN0DQo+ID4gUkFNDQo+IA0KPiBzL2d1ZWFzdC9ndWVzdC8NCj4gDQoNClRoeH4N
Cg0KPiA+IGFsbG9jYXRlZCBmcm9tIGhlYXAsIGl0IHNob3VsZCBub3QgaW5jbHVkZSByZXNlcnZl
ZCBwYWdlcyBvZiBzdGF0aWMgbWVtb3J5Lg0KPiANCj4gWW91IGFscmVhZHkgaGF2ZSBQR0NfcmVz
ZXJ2ZWQgdG8gaW5kaWNhdGUgdGhleSBhcmUgInN0YXRpYyBtZW1vcnkiLiBTbyB3aHkNCj4gZG8g
eW91IG5lZWQgeWV0IGFub3RoZXIgbGlzdD8NCj4gDQo+ID4NCj4gPiBUaGUgbnVtYmVyIG9mIFBH
Q19yZXNlcnZlZCBwYWdlcyBhc3NpZ25lZCB0byBhIGRvbWFpbiBpcyB0cmFja2VkIGluIGENCj4g
PiBuZXcgJ3Jlc2VydmVkX3BhZ2VzJyBjb3VudGVyLiBBbHNvIGludHJvZHVjZSBhIG5ldyByZXNl
cnZlZF9wYWdlX2xpc3QNCj4gPiB0byBsaW5rIHBhZ2VzIG9mIHN0YXRpYyBtZW1vcnkuIExldCBw
YWdlX3RvX2xpc3QgcmV0dXJuDQo+ID4gcmVzZXJ2ZWRfcGFnZV9saXN0LCB3aGVuIGZsYWcgaXMg
UEdDX3Jlc2VydmVkLg0KPiA+DQo+ID4gTGF0ZXIsIHdoZW4gZG9tYWluIGdldCBkZXN0cm95ZWQg
b3IgcmVzdGFydGVkLCB0aG9zZSBuZXcgdmFsdWVzIHdpbGwNCj4gPiBoZWxwIHJlbGlucXVpc2gg
bWVtb3J5IHRvIHByb3BlciBwbGFjZSwgbm90IGJlZW4gZ2l2ZW4gYmFjayB0byBoZWFwLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+
ID4gLS0tDQo+ID4gICB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICB8IDEgKw0KPiA+ICAgeGVuL2Nv
bW1vbi9wYWdlX2FsbG9jLmMgfCA3ICsrKysrLS0NCj4gPiAgIHhlbi9pbmNsdWRlL3hlbi9zY2hl
ZC5oIHwgNSArKysrKw0KPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMg
Yi94ZW4vY29tbW9uL2RvbWFpbi5jIGluZGV4DQo+ID4gNmI3MWM2ZDZhOS4uYzM4YWZkMjk2OSAx
MDA2NDQNCj4gPiAtLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jDQo+ID4gKysrIGIveGVuL2NvbW1v
bi9kb21haW4uYw0KPiA+IEBAIC01NzgsNiArNTc4LDcgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWlu
X2NyZWF0ZShkb21pZF90IGRvbWlkLA0KPiA+ICAgICAgIElOSVRfUEFHRV9MSVNUX0hFQUQoJmQt
PnBhZ2VfbGlzdCk7DQo+ID4gICAgICAgSU5JVF9QQUdFX0xJU1RfSEVBRCgmZC0+ZXh0cmFfcGFn
ZV9saXN0KTsNCj4gPiAgICAgICBJTklUX1BBR0VfTElTVF9IRUFEKCZkLT54ZW5wYWdlX2xpc3Qp
Ow0KPiA+ICsgICAgSU5JVF9QQUdFX0xJU1RfSEVBRCgmZC0+cmVzZXJ2ZWRfcGFnZV9saXN0KTsN
Cj4gPg0KPiA+ICAgICAgIHNwaW5fbG9ja19pbml0KCZkLT5ub2RlX2FmZmluaXR5X2xvY2spOw0K
PiA+ICAgICAgIGQtPm5vZGVfYWZmaW5pdHkgPSBOT0RFX01BU0tfQUxMOyBkaWZmIC0tZ2l0DQo+
ID4gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGlu
ZGV4DQo+ID4gZjFmMTI5NmE2MS4uZTNmMDdlYzZjNSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vY29t
bW9uL3BhZ2VfYWxsb2MuYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+ID4g
QEAgLTI0MTAsNyArMjQxMCw3IEBAIGludCBhc3NpZ25fcGFnZXMoDQo+ID4NCj4gPiAgICAgICAg
ICAgZm9yICggaSA9IDA7IGkgPCBucl9wZm5zOyBpKysgKQ0KPiA+ICAgICAgICAgICB7DQo+ID4g
LSAgICAgICAgICAgIEFTU0VSVCghKHBnW2ldLmNvdW50X2luZm8gJiB+UEdDX2V4dHJhKSk7DQo+
ID4gKyAgICAgICAgICAgIEFTU0VSVCghKHBnW2ldLmNvdW50X2luZm8gJiB+KFBHQ19leHRyYSB8
DQo+ID4gKyBQR0NfcmVzZXJ2ZWQpKSk7DQo+IEkgdGhpbmsgdGhpcyBjaGFuZ2UgYmVsb25ncyB0
byB0aGUgcHJldmlvdXMgcGF0Y2guDQo+IA0KDQpPay4gSXQgd2lsbCBiZSByZS1vcmdhbml6ZWQg
aW50byBwcmV2aW91cyBjb21taXQgb2YNCiJ4ZW4vYXJtOiBpbnRydWR1Y2UgYWxsb2NfZG9tc3Rh
dGljX3BhZ2VzIg0KDQo+ID4gICAgICAgICAgICAgICBpZiAoIHBnW2ldLmNvdW50X2luZm8gJiBQ
R0NfZXh0cmEgKQ0KPiA+ICAgICAgICAgICAgICAgICAgIGV4dHJhX3BhZ2VzKys7DQo+ID4gICAg
ICAgICAgIH0NCj4gPiBAQCAtMjQzOSw2ICsyNDM5LDkgQEAgaW50IGFzc2lnbl9wYWdlcygNCj4g
PiAgICAgICAgICAgfQ0KPiA+ICAgICAgIH0NCj4gPg0KPiA+ICsgICAgaWYgKCBwZ1swXS5jb3Vu
dF9pbmZvICYgUEdDX3Jlc2VydmVkICkNCj4gPiArICAgICAgICBkLT5yZXNlcnZlZF9wYWdlcyAr
PSBucl9wZm5zOw0KPiANCj4gcmVzZXJ2ZWRfcGFnZXMgZG9lc24ndCBzZWVtIHRvIGJlIGV2ZXIg
cmVhZCBvciBkZWNyZW1lbnRlZC4gU28gd2h5IGRvDQo+IHlvdSBuZWVkIGl0Pw0KPg0KDQpZZWFo
LCBJIG1heSBkZWxldGUgaXQgZnJvbSB0aGlzIFBhdGNoIFNlcmllLg0KDQpMaWtlIEkgYWRkcmVz
c2VkIGluIGJlZm9yZSBjb21taXRzOg0KDQoid2hlbiBpbXBsZW1lbnRpbmcgcmVib290aW5nIGRv
bWFpbiBvbiBzdGF0aWMgYWxsb2NhdGlvbiwgbWVtb3J5IHdpbGwgYmUgcmVsaW5xdWlzaGVkDQph
bmQgcmlnaHQgbm93LCBhbGwgc2hhbGwgYmUgZnJlZWQgYmFjayB0byBoZWFwLCB3aGljaCBpcyBu
b3Qgc3VpdGFibGUgZm9yIHN0YXRpYyBtZW1vcnkgaGVyZS4NCmAgcmVsaW5xdWlzaF9tZW1vcnko
ZCwgJmQtPnBhZ2VfbGlzdCkgIC0tPiBwdXRfcGFnZSAtLT4gIGZyZWVfZG9taGVhcF9wYWdlYA0K
DQpGb3IgcGFnZXMgaW4gUEdDX3Jlc2VydmVkLCBub3csIEkgYW0gY29uc2lkZXJpbmcgdGhhdCwg
b3RoZXIgdGhhbiBnaXZpbmcgaXQgYmFjayB0byBoZWFwLA0KbWF5YmUgY3JlYXRpbmcgYSBuZXcg
Z2xvYmFsIGBzdHJ1Y3QgcGFnZV9pbmZvKltET01JRF1gIHZhbHVlIHRvIGhvbGQuDQoNClNvIGl0
IGlzIGJldHRlciB0byBoYXZlIGEgbmV3IGZpZWxkIGluIHN0cnVjdCBwYWdlX2luZm8sIGFzIGZv
bGxvd3MsIHRvIGhvbGQgc3VjaCBpbmZvLg0KDQovKiBQYWdlIGlzIHJlc2VydmVkLiAqLw0Kc3Ry
dWN0IHsNCiAgICAvKg0KICAgICAqIFJlc2VydmVkIE93bmVyIG9mIHRoaXMgcGFnZSwNCiAgICAg
KiBpZiB0aGlzIHBhZ2UgaXMgcmVzZXJ2ZWQgdG8gYSBzcGVjaWZpYyBkb21haW4uDQogICAgICov
DQogICAgZG9taWRfdCByZXNlcnZlZF9vd25lcjsNCn0gcmVzZXJ2ZWQ7DQoiIA0KDQpTbyBJIHdp
bGwgZGVsZXRlIGhlcmUsIGFuZCByZS1pbXBvcnQgd2hlbiBpbXBsZW1lbnRpbmcgcmVib290aW5n
IGRvbWFpbiBvbiBzdGF0aWMgYWxsb2NhdGlvbi4NCg0KPiA+ICsNCj4gPiAgICAgICBpZiAoICEo
bWVtZmxhZ3MgJiBNRU1GX25vX3JlZmNvdW50KSAmJg0KPiA+ICAgICAgICAgICAgdW5saWtlbHko
ZG9tYWluX2FkanVzdF90b3RfcGFnZXMoZCwgbnJfcGZucykgPT0gbnJfcGZucykgKQ0KPiA+ICAg
ICAgICAgICBnZXRfa25vd25hbGl2ZV9kb21haW4oZCk7DQo+ID4gQEAgLTI0NTIsNyArMjQ1NSw3
IEBAIGludCBhc3NpZ25fcGFnZXMoDQo+ID4gICAgICAgICAgICAgICBwYWdlX3NldF9yZXNlcnZl
ZF9vd25lcigmcGdbaV0sIGQpOw0KPiA+ICAgICAgICAgICBzbXBfd21iKCk7IC8qIERvbWFpbiBw
b2ludGVyIG11c3QgYmUgdmlzaWJsZSBiZWZvcmUgdXBkYXRpbmcNCj4gcmVmY250LiAqLw0KPiA+
ICAgICAgICAgICBwZ1tpXS5jb3VudF9pbmZvID0NCj4gPiAtICAgICAgICAgICAgKHBnW2ldLmNv
dW50X2luZm8gJiBQR0NfZXh0cmEpIHwgUEdDX2FsbG9jYXRlZCB8IDE7DQo+ID4gKyAgICAgICAg
ICAgIChwZ1tpXS5jb3VudF9pbmZvICYgKFBHQ19leHRyYSB8IFBHQ19yZXNlcnZlZCkpIHwNCj4g
PiArIFBHQ19hbGxvY2F0ZWQgfCAxOw0KPiANCj4gU2FtZSBoZXJlLg0KDQpJJ2xsIHJlLW9yZ2Fu
aXplIGl0IHRvIHRoZSBwcmV2aW91cyBjb21taXQuDQoNCj4gDQo+ID4gICAgICAgICAgIHBhZ2Vf
bGlzdF9hZGRfdGFpbCgmcGdbaV0sIHBhZ2VfdG9fbGlzdChkLCAmcGdbaV0pKTsNCj4gPiAgICAg
ICB9DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmggYi94ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaCBpbmRleA0KPiA+IDM5ODIxNjcxNDQuLmI2MzMzZWQ4YmIgMTAw
NjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgNCj4gPiArKysgYi94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQuaA0KPiA+IEBAIC0zNjgsNiArMzY4LDcgQEAgc3RydWN0IGRvbWFpbg0K
PiA+ICAgICAgIHN0cnVjdCBwYWdlX2xpc3RfaGVhZCBwYWdlX2xpc3Q7ICAvKiBsaW5rZWQgbGlz
dCAqLw0KPiA+ICAgICAgIHN0cnVjdCBwYWdlX2xpc3RfaGVhZCBleHRyYV9wYWdlX2xpc3Q7IC8q
IGxpbmtlZCBsaXN0IChzaXplIGV4dHJhX3BhZ2VzKSAqLw0KPiA+ICAgICAgIHN0cnVjdCBwYWdl
X2xpc3RfaGVhZCB4ZW5wYWdlX2xpc3Q7IC8qIGxpbmtlZCBsaXN0IChzaXplDQo+ID4geGVuaGVh
cF9wYWdlcykgKi8NCj4gPiArICAgIHN0cnVjdCBwYWdlX2xpc3RfaGVhZCByZXNlcnZlZF9wYWdl
X2xpc3Q7IC8qIGxpbmtlZCBsaXN0IChzaXplDQo+ID4gKyByZXNlcnZlZCBwYWdlcykgKi8NCj4g
Pg0KPiA+ICAgICAgIC8qDQo+ID4gICAgICAgICogVGhpcyBmaWVsZCBzaG91bGQgb25seSBiZSBk
aXJlY3RseSBhY2Nlc3NlZCBieQ0KPiA+IGRvbWFpbl9hZGp1c3RfdG90X3BhZ2VzKCkgQEAgLTM3
OSw2ICszODAsNyBAQCBzdHJ1Y3QgZG9tYWluDQo+ID4gICAgICAgdW5zaWduZWQgaW50ICAgICBv
dXRzdGFuZGluZ19wYWdlczsgLyogcGFnZXMgY2xhaW1lZCBidXQgbm90IHBvc3Nlc3NlZA0KPiAq
Lw0KPiA+ICAgICAgIHVuc2lnbmVkIGludCAgICAgbWF4X3BhZ2VzOyAgICAgICAgIC8qIG1heGlt
dW0gdmFsdWUgZm9yDQo+IGRvbWFpbl90b3RfcGFnZXMoKSAqLw0KPiA+ICAgICAgIHVuc2lnbmVk
IGludCAgICAgZXh0cmFfcGFnZXM7ICAgICAgIC8qIHBhZ2VzIG5vdCBpbmNsdWRlZCBpbg0KPiBk
b21haW5fdG90X3BhZ2VzKCkgKi8NCj4gPiArICAgIHVuc2lnbmVkIGludCAgICAgcmVzZXJ2ZWRf
cGFnZXM7ICAgIC8qIHBhZ2VzIG9mIHN0YXRpYyBtZW1vcnkgKi8NCj4gPiAgICAgICBhdG9taWNf
dCAgICAgICAgIHNocl9wYWdlczsgICAgICAgICAvKiBzaGFyZWQgcGFnZXMgKi8NCj4gPiAgICAg
ICBhdG9taWNfdCAgICAgICAgIHBhZ2VkX3BhZ2VzOyAgICAgICAvKiBwYWdlZC1vdXQgcGFnZXMg
Ki8NCj4gPg0KPiA+IEBAIC01ODgsNiArNTkwLDkgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFn
ZV9saXN0X2hlYWQgKnBhZ2VfdG9fbGlzdCgNCj4gPiAgICAgICBpZiAoIHBnLT5jb3VudF9pbmZv
ICYgUEdDX2V4dHJhICkNCj4gPiAgICAgICAgICAgcmV0dXJuICZkLT5leHRyYV9wYWdlX2xpc3Q7
DQo+ID4NCj4gPiArICAgIGlmICggcGctPmNvdW50X2luZm8gJiBQR0NfcmVzZXJ2ZWQgKQ0KPiA+
ICsgICAgICAgIHJldHVybiAmZC0+cmVzZXJ2ZWRfcGFnZV9saXN0Ow0KPiA+ICsNCj4gPiAgICAg
ICByZXR1cm4gJmQtPnBhZ2VfbGlzdDsNCj4gPiAgIH0NCj4gPg0KPiA+DQo+IA0KPiBDaGVlcnMs
DQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg0KQ2hlZXJzDQoNClBlbm55IFpoZW5nDQo=

