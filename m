Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E366D5185E0
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 15:46:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319676.539996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlsqo-0003oo-1e; Tue, 03 May 2022 13:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319676.539996; Tue, 03 May 2022 13:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlsqn-0003ma-US; Tue, 03 May 2022 13:46:01 +0000
Received: by outflank-mailman (input) for mailman id 319676;
 Tue, 03 May 2022 13:46:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3B0=VL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nlsqm-0003mU-Lk
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 13:46:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cf920ed-cae7-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 15:45:59 +0200 (CEST)
Received: from DU2P251CA0011.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::6) by
 DB9PR08MB6780.eurprd08.prod.outlook.com (2603:10a6:10:2a0::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.14; Tue, 3 May 2022 13:45:47 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::ee) by DU2P251CA0011.outlook.office365.com
 (2603:10a6:10:230::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Tue, 3 May 2022 13:45:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 13:45:47 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Tue, 03 May 2022 13:45:47 +0000
Received: from a428f5eb00a4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9E08E64A-7D4F-4FF7-823B-B0C82B92989F.1; 
 Tue, 03 May 2022 13:45:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a428f5eb00a4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 May 2022 13:45:40 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by DB8PR08MB5449.eurprd08.prod.outlook.com (2603:10a6:10:119::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Tue, 3 May
 2022 13:45:39 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 13:45:39 +0000
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
X-Inumbo-ID: 5cf920ed-cae7-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QSUPa9hpkPN+X5xVNNmvVxIAJX7WT8bQ5EJKvCflhOqXt+cdC7RN/+Gsf3GSCBQrG900UomTHnOIF0YwT7X3EMBYSSTf1N5K2l0tFvGoiP0LB4NZFVGPdH2fCRx0ZsWzoNgaHOyPXaz0LBIr9CXsq0akGNveZCZcvHqRtn/5sk3C+Br6eMGmkRfW9RdO7NL4nbkdtyOUYBXCwgihHpzo5hWIeizdDGQrZ+TtJtCAQQEcGE5BOCeLMlQ5QQRWzj9idRqOpgvE3UpdzQS3KolSTLqOISM6V1Dn1mQ310Svu12FzniLxf53zvQanPGml0wOU4ViQbDojptpn1w3yGzegg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0S4P+wMGdro3ettmemfnoQoqv10broPkU6qZu3+1Tw=;
 b=TR5cu4ol6CQoKLOkgUtMDfXbSPTCrtOWT1Nl0NMcQ2Qu1k4Q+KNyt4curr7tu9jNhaLv+WBqpP6qo7H3tPCh+4INoekKgnpPSrYZrd9gmakDHbJ3SzFfRkniOqJ5X3WYcLQEl+kDgR80rwqDlEuXXoEapTHljUz/41/SH0qDBHZT6drSgyDlaBo+EDfjzvPkXNCcEsl8lqU7gmRo9ixhbAjSoFnMod5+8mxyVRt7WUXpLbrTKhP7RTtg68L9gDqnUWWVKfW6jdYnUzzUVqOTtSjFFaoqtiIj16FkY1Muj3p3obOyCCKktca+cnaDpBnfkB8ij3uHDPxCkAvuRnWM1w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0S4P+wMGdro3ettmemfnoQoqv10broPkU6qZu3+1Tw=;
 b=lOk6SIpWfax5ICAHk4MuEZg2rXJcpJDPiBI5aKbmX/re1taweC5Fa8PImMoZMFjF5mCpiReVRKgDfW0WjgyfBqhAIq2WJR7hOEqe0R+vCtKcVmqYdmTzSY80++DhoRDNr+ztaaIopRH2eH6p3IuMx9/09dvuGugskb9HYUy89mI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 730a73346a3d0705
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOmK0G6keQWmkX+9VLUG8SL3pATwel/Y3pIcTA2uc/yBRZuHVryUDY/NS4pHgsM8vfrpIjpyJBlO/jFq1JgCLWQAKmgmmbVLRbs4hEmbb78SjM3rN+PxkCG1+U40+KZNjX5E5jxhur2+Hvh2VJrWauPJABY5C/Vb1NrcfXDtuc1BH11jZkkXe//RnEgDA4lkO/AZg//wvwGtKRHfWuo4VOQjkPDJErRPW4m/1WkC0WAedTrr5DKQE5aOja5me2MwyBZ115udfN/Zs+keujIJb33jXwwfi6+D3rsVkel9F1fZvPpGOLotGdwwbo+7Zf8rqBZs3LoljAvKtgpQDO4GqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0S4P+wMGdro3ettmemfnoQoqv10broPkU6qZu3+1Tw=;
 b=FXf0IaBZxjZF5NiPW/lQJB97UusdfwStTzrSGiEf5lgXav7xmADXrXNd6ykf7LBSf5H1TEQrqfbK/c0RUyEANLqtPekAcHWe213rCFni+fK+oHu9swR2F9D5ixF8XyF9n6S05HjDLsbPiQs3cYVtdtt8cFKrlVim+OR5gN3LRXQXHEOCd53Rp4Jonp+bVdPw1D5sh37soSMEKGA8q6k2Y9QwdZhxlklRNxKsbzpuqXqzy35QmqyPF05+9ueyAe4shaZxkb8h0TGPSuiAt30eVityegE9+0hjnrYpnPBlFP+/+FCMTDIekgY2YR/uhECLhyFG2tNfz5au6uZx7agXgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0S4P+wMGdro3ettmemfnoQoqv10broPkU6qZu3+1Tw=;
 b=lOk6SIpWfax5ICAHk4MuEZg2rXJcpJDPiBI5aKbmX/re1taweC5Fa8PImMoZMFjF5mCpiReVRKgDfW0WjgyfBqhAIq2WJR7hOEqe0R+vCtKcVmqYdmTzSY80++DhoRDNr+ztaaIopRH2eH6p3IuMx9/09dvuGugskb9HYUy89mI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
CC: xen-devel <xen-devel@lists.xenproject.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v2] xen/arm: p2m don't fall over on FEAT_LPA enabled hw
Thread-Topic: [PATCH v2] xen/arm: p2m don't fall over on FEAT_LPA enabled hw
Thread-Index: AQHYWuuXqjHgGotG8UqKAs+V57fbVK0NMk6A
Date: Tue, 3 May 2022 13:45:39 +0000
Message-ID: <22930B07-FC34-4707-B900-20CB085F5127@arm.com>
References: <20220428103410.2723837-1-alex.bennee@linaro.org>
In-Reply-To: <20220428103410.2723837-1-alex.bennee@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9ea8da1f-48f4-449c-3aec-08da2d0b3a88
x-ms-traffictypediagnostic:
	DB8PR08MB5449:EE_|DBAEUR03FT040:EE_|DB9PR08MB6780:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB67805498AF82A1154AC7DB08E4C09@DB9PR08MB6780.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /aAGThh9VFE6b/MOl0NHauRjFqag2yPldt4TPdfsGjmMYs0/1xKe7JEqygLamPjFj9KS9B4BgO8GST9naTjkPH/BtH50FjbaJtNQndrk2saII6cFw1K8XQFrIwEyOeIUdaG89AoZK+WY9qCp1ialpEWTBUlwbJWwexc1BoLme8GCxUx69S7k0Cm1uo1IVu2MgV1XO0YHOeSdFq2VeDqqI4BlAKPa2BBH9OYl5HCneDalXM863HjIfY1ehrQyqxUn7pgjb5SiEqGbgX8rAK9a6kKNCPe2pFKphL4ZwG+l/0ugJlHEd6hFGWjSQ39crQDh77OJWdz7qi1T9qWjHu2Q7XauVBOdCTsXVAJMGTc1kzJtKVTHz51+gZPpsObhowfchLlHk80MKSNoqE0hwH6EbpBifPj1gI8DXUSwymEDo8qAGdAvXNFoQyvoGasCsrVsCCNa9zms5x5g7/GPLIZ7j28VyqoWwaTAkChy1FdqmC12uc7R/QSv3lCMvF52w0Zc88Y9dUjaqGJBdo5ygxnLHD4AKjT19tWEGZ935xbekJB/oDhiM8xdNYw2IoXEJ0QRoU7d+kQUF+3CeeBROeF+b8AjCIkWyEoktWkVH3VH6QhRciPQ39e4JVBfJyhSHCd1ZxX4atxDwU5Xr9jQLIT88E7kkhwjWD+ZsybZCci4/97IfQsgpuRj064TrRrWlZxKK+fY5ZpicCKdNVNWa4M/UJVf9NX+8JonSnqze26sH5EXquK+QMsZY24H3KNIT/zS
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(6512007)(5660300002)(6506007)(53546011)(26005)(76116006)(38070700005)(8676002)(6486002)(66556008)(38100700002)(64756008)(2616005)(66476007)(86362001)(2906002)(66446008)(33656002)(186003)(6916009)(54906003)(508600001)(316002)(122000001)(8936002)(71200400001)(36756003)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <78D24626CCC1C14287F1B695EBFA0228@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5449
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7cec0545-0e05-4bc8-2d91-08da2d0b35f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	taVSX2o8yshZ4wU6IEEnHBEQZvwxmF6CokwxliLVQQ836p1OoCwGHjU4rrVZxgEGricZbS6XYjhkyaP3VwC9DQ8dt1Sl44SQ3/uX5UfdA26EELhuisaBnv7cDQfPW4z8Uy8HWmKzbm5a9Y21Ex3knGSk22UXsasZnVkHabr6qRhrczeI7cl5ksKqgU0FNYW4Je3r7TT9GZG2xhTeyFQvajSdHSju55dxW7iiY/9EQu1sPlO5KIOSX+bMsb0gc2sA3pjlJhPSx8T4Zjj+3pDimne+7gdFzfitmwikxyYSMx3ftTQOyUKl1NhrKsL31d29osUxjFcbO/GjS9PeHXZLnqMRVAIcxbq52xuwWIj+R0CSIa/M50GaPpu7WzspZPbwZpsp3d0ZnxAD0V5NMlRJB8rqq+P6wIK9v2g/u9bFAhWYmWfFyFwHZPhXm6CKhVBnpDyod+Zki5rGJ6hCPejX5p5THMpRrlbIh/SmGVvFm56vSwZhKyW1hwkLWkqjpqyOdTXTCUOKwguUdn/DE1ufKCrNuYX+rNngHwQNyBvac7aMYzDPaIOJAJ51Bb2FTnnLoxLpSWa4DkYfNK3voTbe+owAtnPsoNZBZ1StM3MgCPEZvzl3dVUrNFhYeWbwSIUVnUqyb8lDzxGufFKAaDePD+7Ekdii57Wh2ivGGehSW2KJYiAu3BSLly3GAtnke+sR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(54906003)(316002)(82310400005)(6486002)(2906002)(336012)(47076005)(186003)(6512007)(26005)(36756003)(53546011)(6506007)(86362001)(81166007)(8936002)(40460700003)(33656002)(508600001)(2616005)(8676002)(5660300002)(70206006)(70586007)(4326008)(6862004)(356005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 13:45:47.6243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea8da1f-48f4-449c-3aec-08da2d0b3a88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6780

DQoNCj4gT24gMjggQXByIDIwMjIsIGF0IDExOjM0LCBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVl
QGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gV2hlbiB3ZSBpbnRyb2R1Y2VkIEZFQVRfTFBBIHRv
IFFFTVUncyAtY3B1IG1heCB3ZSBkaXNjb3ZlcmVkIG9sZGVyDQo+IGtlcm5lbHMgaGFkIGEgYnVn
IHdoZXJlIHRoZSBwaHlzaWNhbCBhZGRyZXNzIHdhcyBjb3BpZWQgZGlyZWN0bHkgZnJvbQ0KPiBJ
RF9BQTY0TU1GUjBfRUwxLlBBUmFuZ2UgZmllbGQuIFRoZSBlYXJseSBjcHVfaW5pdCBjb2RlIG9m
IFhlbiBjb21taXRzDQo+IHRoZSBzYW1lIGVycm9yIGJ5IGJsaW5kbHkgY29weWluZyBhY3Jvc3Mg
dGhlIG1heCBzdXBwb3J0ZWQgcmFuZ2UuDQo+IA0KPiBVbnN1cnByaXNpbmdseSB3aGVuIHRoZSBw
YWdlIHRhYmxlcyBhcmVuJ3Qgc2V0IHVwIGZvciB0aGVzZSBncmVhdGVyDQo+IHJhbmdlcyBoaWxh
cml0eSBlbnN1ZXMgYW5kIHRoZSBoeXBlcnZpc29yIGNyYXNoZXMgZmFpcmx5IGVhcmx5IG9uIGlu
DQo+IHRoZSBib290LXVwIHNlcXVlbmNlLiBUaGlzIGhhcHBlbnMgd2hlbiB3ZSB3cml0ZSB0byB0
aGUgY29udHJvbA0KPiByZWdpc3RlciBpbiBlbmFibGVfbW11KCkuDQo+IA0KPiBBdHRlbXB0IHRv
IGZpeCB0aGlzIHRoZSBzYW1lIHdheSBhcyB0aGUgTGludXgga2VybmVsIGRvZXMgYnkgZ2F0aW5n
DQo+IFBBUmFuZ2UgdG8gdGhlIG1heGltdW0gdGhlIGh5cGVydmlzb3IgY2FuIGhhbmRsZS4gSSBh
bHNvIGhhZCB0byBmaXggdXANCj4gY29kZSBpbiBwMm0gd2hpY2ggcGFuaWNzIHdoZW4gaXQgc2Vl
cyBhbiAiaW52YWxpZCIgZW50cnkgaW4gUEFSYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFs
ZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gQ2M6IFJpY2hhcmQgSGVuZGVy
c29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiBDYzogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz4NCj4gQ2M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFt
LmNvbT4NCj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4N
Cj4gDQo+IC0tLQ0KPiB2Mg0KPiAgLSBjbGFtcCBwMm1faXBhX2JpdHMgPSBQQUREUl9CSVQgaW5z
dGVhZA0KPiAtLS0NCg0KSGkgQWxleCwNCg0KSeKAmXZlIHRlc3RlZCB0aGUgcGF0Y2ggb24gZnZw
IGFuZCBYZW4rRG9tMCBydW5zIGZpbmUuDQoNClRlc3RlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVj
YS5mYW5jZWxsdUBhcm0uY29tPg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

