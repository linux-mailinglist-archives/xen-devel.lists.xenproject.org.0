Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742E5314FCD
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 14:10:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83239.154396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Smc-0001tW-W4; Tue, 09 Feb 2021 13:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83239.154396; Tue, 09 Feb 2021 13:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Smc-0001t7-Ro; Tue, 09 Feb 2021 13:10:22 +0000
Received: by outflank-mailman (input) for mailman id 83239;
 Tue, 09 Feb 2021 13:10:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gqd1=HL=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l9Smb-0001t1-FX
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 13:10:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.71]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d1a1fd7-4be5-48d1-b012-6bba688f6568;
 Tue, 09 Feb 2021 13:10:18 +0000 (UTC)
Received: from DB6PR0601CA0020.eurprd06.prod.outlook.com (2603:10a6:4:7b::30)
 by AM0PR08MB3826.eurprd08.prod.outlook.com (2603:10a6:208:105::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.25; Tue, 9 Feb
 2021 13:10:16 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::b0) by DB6PR0601CA0020.outlook.office365.com
 (2603:10a6:4:7b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Tue, 9 Feb 2021 13:10:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 9 Feb 2021 13:10:15 +0000
Received: ("Tessian outbound 4d8113405d55:v71");
 Tue, 09 Feb 2021 13:10:15 +0000
Received: from f8e84157b6f8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2A68FCB6-F6E9-47FA-AC53-D9EDE9756E6C.1; 
 Tue, 09 Feb 2021 13:10:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f8e84157b6f8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Feb 2021 13:10:10 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB5899.eurprd08.prod.outlook.com (2603:10a6:10:208::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Tue, 9 Feb
 2021 13:10:08 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 13:10:08 +0000
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
X-Inumbo-ID: 0d1a1fd7-4be5-48d1-b012-6bba688f6568
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+iMAGOzN1j9tIkmGuC+qwNoR956aFcvV7NuUkUY7Pg=;
 b=a89FmOBo/rtAktPg4or1YRIvFxoJctA04j/KfbMzcySmnMPF6C1CKMDxsmdQsDBI4Lw5+LYWWVPEVxWjZ0MsT6kTwn3oTD7iw077uDmtykgg5cpSximIE/pjCAyvPsx2o4KfufqgqzCxNFyXyR3mX7JEpa2DUTiVLdFkpTkXb18=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 91649c49368791df
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tb4H5nOyjei9476wSmvoSPVbrwQW2Xdf8Krk5xEjMqx5ppqFooIxYka/e1NS1iPDLBmWQlnIJX8vReqyWtm2Ubw8/3ZrAA9J0RlEMzcZ2Cjt50CfYRGPO9qJChrX8yYKff1vpT06AdmI+EIzSuApO+WDhwzbwLotAkIzWIVrcR07/mblx3Ux0l0A1sP9c6iI1c70zz5gM4vCjsTwKyN+sDFf2sTe0ivLe+orqCeHlUpAOtJ5WrDvJGo7/YuObBY5JnLwvR4RIpK/TExjRBozQ8robg99znstG8pIM77nqPN4vX/sqGbKdH9IIqVyes1YmBjSex3sInTsF4oDXS8z1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+iMAGOzN1j9tIkmGuC+qwNoR956aFcvV7NuUkUY7Pg=;
 b=R3xIY/rUGkWpjBOR9aQ7yKNijUWKjfjOGtPUizePK9Ig3MY7uNXZUv5cuqOjN/JrsD9EMQh96qiSRT6w+EO0JoqjYnUIEhQX0jYkWrwPTNq9MN7OoJibgdxrrroG0BcdMIAlNH2/5XAN69lRgmgFnR4hUH0ogZV85UG2mQ82gbTXnJvCrIFVTib6dVK/n2RaaH7VgLEMBLzcKMa6b3KncKTHXUJmi1ipimhMGQSU4lSPP2lY1/O1OZ9cJzQYws9HGrNxiCENqZuqiK/oWrmjkZhlORke4MRu3H89CNFVPUlnONcnJ8FIyiNpbmNjWO4BEZ2D47H+VexAhnQ3yBBFzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+iMAGOzN1j9tIkmGuC+qwNoR956aFcvV7NuUkUY7Pg=;
 b=a89FmOBo/rtAktPg4or1YRIvFxoJctA04j/KfbMzcySmnMPF6C1CKMDxsmdQsDBI4Lw5+LYWWVPEVxWjZ0MsT6kTwn3oTD7iw077uDmtykgg5cpSximIE/pjCAyvPsx2o4KfufqgqzCxNFyXyR3mX7JEpa2DUTiVLdFkpTkXb18=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, "lucmiccio@gmail.com"
	<lucmiccio@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: fix gnttab_need_iommu_mapping
Thread-Topic: [PATCH] xen/arm: fix gnttab_need_iommu_mapping
Thread-Index: AQHW/CCVIBhvrRIcEE2wSNDNMu6y5KpOkgeAgAABdICAAAIFgIAACHWAgAEzkIA=
Date: Tue, 9 Feb 2021 13:10:07 +0000
Message-ID: <D7BC7145-3C03-456C-B255-AF2CC90A351E@arm.com>
References: <alpine.DEB.2.21.2102051604320.29047@sstabellini-ThinkPad-T480s>
 <C36DCA9F-1212-4385-AE66-7D41C586A313@arm.com>
 <7e963696-a21f-4c79-5f35-a342982bee86@xen.org>
 <3EEEACBE-2028-4DE9-A3BD-053FF82CFC75@arm.com>
 <bc7c3b13-88da-691f-8094-75502f06e882@xen.org>
In-Reply-To: <bc7c3b13-88da-691f-8094-75502f06e882@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d6a0cd37-3b54-4953-8b6a-08d8ccfc0ad5
x-ms-traffictypediagnostic: DBBPR08MB5899:|AM0PR08MB3826:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3826CE735CCA5EE7E8612D65FC8E9@AM0PR08MB3826.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +tAKqqUUP2ZQN5gdIQ6kfftJw/EX4aLfRnHGKjOJMD8WfuoLKarFQqEHfLfUclnSxMpBlL3YQKq9/6EyxW13eswWdOw1L21zVvcFguua/bEjDpfb0MgMpN+jIKbq+VEpwV8SDJLja7+jeM0pQZX0rBSS+faitw8n6Zkmp3iG4VIqTkXpuVMTTiTrbYBp0LQSzp0ZJtfu0b8Gp+cYTvXAUO24NEjCkvO4mv37gfaykMklUukwRr4f7JXqlLkm64jYoBCVkULzUhx8/9e5kHbLDRnxNlvd/I/4BSrwb/NRyU0MOSHzBRmoojbNVcbPNr3WGg7sTY4LYxgCNHuGpx7kTQiyHvVKsxT0w1Urs2dE+rE8+74mGKX6hEyLbTju/0fYuYJnJX7v5hZFLMW2u65i0Ah9lzalGU5QBMmh4mDE96QdEBcgM5ZdHGmb27tUWx24FL0yANoskgyQ91h4hNWogUDg3HMjpEGHYrwK6IfL4IZMF7QXZeo1Cu/vORlrXgryprg9Am1jGfPz46KOwsjMfxje5WvTH3P/obv2JOIerxKttZ7iJ68ycZfulCt7Unm7lVfHKkvk5D2Io7Fa1/Ef+Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(346002)(136003)(396003)(4326008)(8936002)(53546011)(6506007)(6486002)(2616005)(26005)(33656002)(6512007)(54906003)(186003)(316002)(6916009)(86362001)(91956017)(76116006)(83380400001)(36756003)(66476007)(66556008)(64756008)(66446008)(66946007)(8676002)(478600001)(5660300002)(2906002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?NllXQnhhWjhBdWg1MVRORkI3Z0I4YWQzSnJCTEkrUGV4ZzV1ektEdFd2MUh3?=
 =?utf-8?B?TllBZE5LRy9udnJGaG4wdVBhVUFRMDZzamx6UmVJZW9wYjB0cDBpKzVDOEZa?=
 =?utf-8?B?Y1U1YWJRTmUzaEMrSytnRFdRS2J4NnNENmswWnJQNHhWaHRqNG4rR2Z2ZUJC?=
 =?utf-8?B?b0hETGNqNXNxSnpLZXc2Q0VWMnZwc2dTN01QT1VscmlNWmRSU2dkam4rV1BX?=
 =?utf-8?B?ejB4YmNLbG8rQnAyN0UvZmtMemR2Y2ZIVGZGc1pOTlcrZDY3N3dXTEZ0TE1x?=
 =?utf-8?B?R0kyVGtpeHIwVGhxN0M5UmhtSklUNDBxd01qTjdld2lVRmxwZTgyUStmUGZo?=
 =?utf-8?B?a2ZyMSttSEljdjF3WlZJQ1lPSkUwSjhjVGZROS9SbC9RM2pvT1UyeU9NdGs4?=
 =?utf-8?B?T1IzZWZJdnNMaHBwZ1g4c1NaOWpHUDFRdXZ2Y3VldS9PQlMwVmJGTFJQRmRS?=
 =?utf-8?B?WVVJQUNvaUJLTjdLQkV4aTJqRnRFMEZKMjhMTkMxLzFTampVejZSaEd3UFcz?=
 =?utf-8?B?ZHNVREpRRzd6TURla3RWZFRnK2htTjUrRTJCT29RN2xNN01YM3hKdmt3dUpq?=
 =?utf-8?B?R1VIU1d4cUw4MXMxa0pndXJmbU0ySytlSDVQTVVQNUVVMmw0ZkI2T1N3bVZo?=
 =?utf-8?B?SFVtNkdqeDNtalovNHcxSGFoRi9TRG9Ecm8xRUlUelBHSkFNOUREVk9QcWVV?=
 =?utf-8?B?SHI2Z2k5d1I3M0txVUZia0ZMUUJMck94emVibzF4ejByZnI5VmxlaDB5MDdE?=
 =?utf-8?B?QmphOUlUcUVEbjg2QTlVRzNGbzkvNldSTVd2M0x1TTRwcjkxT1BtZXpBRVYw?=
 =?utf-8?B?NnY4U2srb3l0RE4zQXQyT1pySHdtYXl4RHNaRGlBQkZIbkFYRzQrS3hwV3lQ?=
 =?utf-8?B?S0Fha2VvdU1hZGFyU1dmK1pQOGp1bHlXWC93dFpoV1ZSZVJrcGtFNk84QWVo?=
 =?utf-8?B?TGFnSDNFZGc4ZEc5ZUN0d2NZVWUxMkJhUzhIWk5uOURReGNVa2tEVG1Ic1B1?=
 =?utf-8?B?R1luVDBCRWtleGVUTEJkZUFlaGN3VXVrOWlyS2Rodzg4ckdING1DOWttdnF3?=
 =?utf-8?B?L2hXN0J1UjNicDNqK3pXWDdjQmRZNlJLSElRTHRkZTdjQjZOSWJNNERnYzFW?=
 =?utf-8?B?OHdWRlM0TnVXdFVRcE90RXE1enAyM3ZJdXZRTG5KSmhGY1NzRlJRSWN2WFF4?=
 =?utf-8?B?L3lWOGVDYkx5ZnBkVzVGSXQ3aW9TLzBwYkhSL0p6SHhJa0duTmpFUDJTTEw2?=
 =?utf-8?B?Skd6aHlPNW5DeDM0TlN0OWxKdDVNMXg0dXhDa3RzTFoveFhNS0tiNTVaYnFq?=
 =?utf-8?B?bGNxcUtXWStwWnk5c1psdCtYOWtwVWV1TmswK1VoVUwzT1BsZTEreUxJem9w?=
 =?utf-8?B?c1pSRERRNXdmOW1rWlpJRk9zQk9RWWl1eGhpQXdtMXg1bDlpVDZoUENCOTUw?=
 =?utf-8?B?QjFpaW9ZOWNOQmFGdm5JUHVVWVVKajVYOE1kUDVZdkM2aTVjWlYzME1UUDQx?=
 =?utf-8?B?L2dSeUtRd2c3RWtFd1RqWmo3ZE1pNHROT0lnYlhTNE9EVlJNZy9DVmZxRW9L?=
 =?utf-8?B?eFNpRnhPZzZ2akxyQXBCYW1XbUllQXJGVmxqYnd2aDZOd2FzUWxCL0Z3Qk9X?=
 =?utf-8?B?SzNwTzhQdm9sZ0RhMWxocVVvOGxHUnpCNXJlRzEwTWFqV25ZU3RYdS9kc29k?=
 =?utf-8?B?c2w0RlJHZlUvTDgrakJjYk1rc2RVakVhRU5zMC8yY1J0YXlmc1pGbG5sV0tX?=
 =?utf-8?Q?wmjVwVOI/dyceMzKthOZKFuptOuY/rbcecA1C7n?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31A76DA5169DE749BE5A06DFAEC97D3E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5899
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f6999384-d6f3-474f-2db5-08d8ccfc063e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KXRJvGTQKg/D4J3fpffBKxWdX/KS+HoN/oXqWXO9N8YaJIiFIZrPwSK+++nP5ntmSySf020Fh9I1tclLmKi3/tlmJCoC0JSfkVUwxF/8d6s2wtZYH/prmFQvobi/tENcld3U1UDFM/Vq9L8tm1B4KzVqOr37b7wsZTBMiheg9MBqJ+inzGsajuU+UYSn40Qf8xneKITKLGmQNot2/A/Df4FgbtQOkcGFC8Kg0lr6PptNhMocE676ByQHmp3fG9GyS1tUVs14oOfB8X3SAkNbbi4ckoUgBa+va+Oo5fWl/4ZRHmtllB8Vs6jGlk1ZExEdI0ZpMXQd/dBjLabkOd80V2OxjgGRJJEG2wwZ4ztfujRlb3Or5Tcax7XBtiekNUTbb1/hp4Ho4MRaiejN67cE3F2TkqAiDrbozPILnG97S8tZrC8NWczK+Y32iNnbRfMSNSjGPo9dSHvdEaWI0kQJu0bhJXMitHrwqlIoZ/5xYO1iPB4plg8GFFXsP9p2FllVVuOIblFrf5vQGUM8ya7DuYhXPYF72WaMxwgks9THd1dL+VZov+c4qttn+UedUTJvSkP7aPQcbsyPpc4tVForIw6duOTxj6w2uGe1UwAgvT2W4mx2qpjISjZYB0DICwoebW2jsEwNm1H9c2LlyKD7Tn6r/1ZbeYSC8656Pmye9IA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966006)(36840700001)(316002)(6862004)(6486002)(6512007)(70206006)(33656002)(86362001)(5660300002)(53546011)(6506007)(81166007)(82310400003)(82740400003)(70586007)(36756003)(356005)(83380400001)(478600001)(4326008)(54906003)(47076005)(107886003)(8936002)(186003)(2906002)(2616005)(26005)(336012)(8676002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 13:10:15.8447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a0cd37-3b54-4953-8b6a-08d8ccfc0ad5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3826

SGVsbG8gSnVsaWVuLA0KDQo+IE9uIDggRmViIDIwMjEsIGF0IDY6NDkgcG0sIEp1bGllbiBHcmFs
bCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwOC8wMi8yMDIxIDE4
OjE5LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IEhlbGxvIEp1bGllbiwNCj4gDQo+IEhpIFJhaHVs
LA0KPiANCj4+PiBPbiA4IEZlYiAyMDIxLCBhdCA2OjExIHBtLCBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiANCj4+PiANCj4+PiBPbiAwOC8wMi8yMDIxIDE4
OjA2LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+IE9uIDYgRmViIDIwMjEsIGF0IDEyOjM4IGFt
LCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+
Pj4gDQo+Pj4+PiBDb21taXQgOTFkNGVjYTdhZGQgYnJva2UgZ250dGFiX25lZWRfaW9tbXVfbWFw
cGluZyBvbiBBUk0uDQo+Pj4+PiBUaGUgb2ZmZW5kaW5nIGNodW5rIGlzOg0KPj4+Pj4gDQo+Pj4+
PiAjZGVmaW5lIGdudHRhYl9uZWVkX2lvbW11X21hcHBpbmcoZCkgICAgICAgICAgICAgICAgICAg
IFwNCj4+Pj4+IC0gICAgKGlzX2RvbWFpbl9kaXJlY3RfbWFwcGVkKGQpICYmIG5lZWRfaW9tbXUo
ZCkpDQo+Pj4+PiArICAgIChpc19kb21haW5fZGlyZWN0X21hcHBlZChkKSAmJiBuZWVkX2lvbW11
X3B0X3N5bmMoZCkpDQo+Pj4+PiANCj4+Pj4+IE9uIEFSTSB3ZSBuZWVkIGdudHRhYl9uZWVkX2lv
bW11X21hcHBpbmcgdG8gYmUgdHJ1ZSBmb3IgZG9tMCB3aGVuIGl0IGlzDQo+Pj4+PiBkaXJlY3Rs
eSBtYXBwZWQsIGxpa2UgdGhlIG9sZCBjaGVjayBkaWQsIGJ1dCB0aGUgbmV3IGNoZWNrIGlzIGFs
d2F5cw0KPj4+Pj4gZmFsc2UuDQo+Pj4+PiANCj4+Pj4+IEluIGZhY3QsIG5lZWRfaW9tbXVfcHRf
c3luYyBpcyBkZWZpbmVkIGFzIGRvbV9pb21tdShkKS0+bmVlZF9zeW5jIGFuZA0KPj4+Pj4gbmVl
ZF9zeW5jIGlzIHNldCBhczoNCj4+Pj4+IA0KPj4+Pj4gICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9t
YWluKGQpIHx8IGlvbW11X2h3ZG9tX3N0cmljdCApDQo+Pj4+PiAgICAgICAgaGQtPm5lZWRfc3lu
YyA9ICFpb21tdV91c2VfaGFwX3B0KGQpOw0KPj4+Pj4gDQo+Pj4+PiBpb21tdV9od2RvbV9zdHJp
Y3QgaXMgYWN0dWFsbHkgc3VwcG9zZWQgdG8gYmUgaWdub3JlZCBvbiBBUk0sIHNlZSB0aGUNCj4+
Pj4+IGRlZmluaXRpb24gaW4gZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jOg0KPj4+
Pj4gDQo+Pj4+PiAgICBUaGlzIG9wdGlvbiBpcyBoYXJkd2lyZWQgdG8gdHJ1ZSBmb3IgeDg2IFBW
SCBkb20wJ3MgKGFzIFJBTSBiZWxvbmdpbmcgdG8NCj4+Pj4+ICAgIG90aGVyIGRvbWFpbnMgaW4g
dGhlIHN5c3RlbSBkb24ndCBsaXZlIGluIGEgY29tcGF0aWJsZSBhZGRyZXNzIHNwYWNlKSwgYW5k
DQo+Pj4+PiAgICBpcyBpZ25vcmVkIGZvciBBUk0uDQo+Pj4+PiANCj4+Pj4+IEJ1dCBhc2lkZSBm
cm9tIHRoYXQsIHRoZSBpc3N1ZSBpcyB0aGF0IGlvbW11X3VzZV9oYXBfcHQoZCkgaXMgdHJ1ZSwN
Cj4+Pj4+IGhlbmNlLCBoZC0+bmVlZF9zeW5jIGlzIGZhbHNlLCBhbmQgZ250dGFiX25lZWRfaW9t
bXVfbWFwcGluZyhkKSBpcyBmYWxzZQ0KPj4+Pj4gdG9vLg0KPj4+Pj4gDQo+Pj4+PiBBcyBhIGNv
bnNlcXVlbmNlLCB3aGVuIHVzaW5nIFBWIG5ldHdvcmsgZnJvbSBhIGRvbVUgb24gYSBzeXN0ZW0g
d2hlcmUNCj4+Pj4+IElPTU1VIGlzIG9uIGZyb20gRG9tMCwgSSBnZXQ6DQo+Pj4+PiANCj4+Pj4+
IChYRU4pIHNtbXU6IC9zbW11QGZkODAwMDAwOiBVbmhhbmRsZWQgY29udGV4dCBmYXVsdDogZnNy
PTB4NDAyLCBpb3ZhPTB4ODQyNGNiMTQ4LCBmc3lucj0weGIwMDAxLCBjYj0wDQo+Pj4+PiBbICAg
NjguMjkwMzA3XSBtYWNiIGZmMGUwMDAwLmV0aGVybmV0IGV0aDA6IERNQSBidXMgZXJyb3I6IEhS
RVNQIG5vdCBPSw0KPj4+PiBJIGFsc28gb2JzZXJ2ZWQgdGhlIElPTU1VIGZhdWx0IHdoZW4gRE9N
VSBndWVzdCBpcyBjcmVhdGVkIGFuZCBncmVhdCB0YWJsZSBpcyB1c2VkIHdoZW4gSU9NTVUgaXMg
ZW5hYmxlZC4gSSBmaXhlZCB0aGUgZXJyb3IgaW4gZGlmZmVyZW50IHdheSBidXQgSSBhbSBub3Qg
c3VyZSBpZiB5b3UgYWxzbyBvYnNlcnZpbmcgdGhlIHNhbWUgZXJyb3IuIEkgc3VibWl0dGVkIHRo
ZSBwYXRjaCB0byBwY2ktcGFzc3Rocm91Z2ggaW50ZWdyYXRpb24gYnJhbmNoLiBQbGVhc2UgaGF2
ZSBhIGxvb2sgb25jZSBpZiB0aGF0IG1ha2Ugc2Vuc2UuDQo+Pj4gDQo+Pj4gSSBiZWxpdmUgdGhp
cyBpcyB0aGUgc2FtZSBlcnJvciBhcyBTdGVmYW5vIGhhcyBvYnNlcnZlZC4gSG93ZXZlciwgeW91
ciBwYXRjaCB3aWxsIHVuZm9ydHVuYXRlbHkgbm90IHdvcmsgaWYgeW91IGhhdmUgYSBzeXN0ZW0g
d2l0aCBhIG1peCBvZiBwcm90ZWN0ZWQgYW5kIG5vbi1wcm90ZWN0ZWQgRE1BLWNhcGFibGUgZGV2
aWNlcy4NCj4+IFllcyB5b3UgYXJlIHJpZ2h0IHRoYXRzIHdoYXQgSSB0aG91Z2ggd2hlbiBJIGZp
eGVkIHRoZSBlcnJvciBidXQgdGhlbiBJIHRob3VnaHQgaW4gZGlmZmVyZW50IGRpcmVjdGlvbiBp
ZiBJT01NVSBpcyBlbmFibGVkIHN5c3RlbSB3aXNlIGV2ZXJ5IGRldmljZSBzaG91bGQgYmUgcHJv
dGVjdGVkIGJ5IElPTU1VLg0KPiBJIGFtIG5vdCBhd2FyZSBvZiBhbnkgcnVsZSBwcmV2ZW50aW5n
IGEgbWl4IG9mIHByb3RlY3RlZCBhbmQgdW5wcm90ZWN0ZWQgRE1BLWNhcGFibGUgZGV2aWNlcy4N
Cj4gDQo+IEhvd2V2ZXIsIGV2ZW4gaWYgdGhleSBhcmUgYWxsIHByb3RlY3RlZCBieSBhbiBJT01N
VSwgc29tZSBvZiB0aGUgSU9NTVVzIG1heSBoYXZlIGJlZW4gZGlzYWJsZWQgYnkgdGhlIGZpcm13
YXJlIHRhYmxlcyBmb3IgdmFyaW91cyByZWFzb25zIChlLmcuIHBlcmZvcm1hbmNlLCBidWdneSBT
TU1VLi4uKS4gRm9yIGluc3RhbmNlLCB0aGlzIGlzIHRoZSBjYXNlIG9uIEp1bm8gd2hlcmUgMiBv
dXQgb2YgMyBTTU1VcyBhcmUgZGlzYWJsZWQgaW4gdGhlIExpbnV4IHVwc3RyZWFtIERULg0KPiAN
Cj4gQXMgd2UgZG9uJ3Qga25vdyB3aGljaCBkZXZpY2Ugd2lsbCB1c2UgdGhlIGdyYW50IGZvciBE
TUEsIHdlIGFsd2F5cyBuZWVkIHRvIHJldHVybiB0aGUgbWFjaGluZSBwaHlzaWNhbCBhZGRyZXNz
Lg0KDQpUaGFua3MgZm9yIHRoZSBpbmZvcm1hdGlvbiBmb3IgY2xlYXJpbmcgbXkgZG91YnRzLiAN
Cg0KTm93IEkgdW5kZXJzdGFuZCB0aGF0IHdlIG5lZWQgdG8gcmV0dXJuIHRoZSBtYWNoaW5lIHBo
eXNpY2FsIGFkZHJlc3MuIEkgZml4ZWQgdGhlIGlzc3VlIHdoZW4gdGhlcmUgaXMgbm8gSU9NTVUg
bWFwcGluZyBjYWxsIGZvciBncmFudCBwYWdlcy4gSSB0aG91Z2h0IGlmIHBhZ2UgdGFibGVzIGlz
IG5vdCBzaGFyZWQgYmV0d2VlbiBJT01NVSBhbmQgQ1BVLCBpbiB0aGF0IHNjZW5hcmlvIG9ubHkg
d2UgY2FuIGFkZCB0aGUgbWFwcGluZyBmb3IgdGhlIGdyYW50IHRhYmxlIGluIElPTU1VIHBhZ2Ug
dGFibGVzIGJ5IGNhbGxpbmcNCmlvbW11X21hcC9pb21tdV91bm1hcCBmdW5jdGlvbnMuIFRoYXTi
gJlzIHdoeSBJIGZpeGVkIHRoZSBpc3N1ZSB0byByZXR1cm4gSVBBIGFzIHRoZXJlIGlzIG5vICht
Zm4gLT4gbWZuKSBtYXBwaW5nIGluIElPTU1VIHBhZ2UgdGFibGUgZm9yIERNQS4gQWZ0ZXIgdGhp
cyBwYXRjaCB3ZSBkb27igJl0IG5lZWQgdG8gcmV0dXJuIHRoZSBJUEEgYXMgKG1mbiAtPiBtZm4p
IG1hcHBpbmcgd2lsbCBiZSBwcmVzZW50IGluIFAyTS4NCg0KUmVnYXJkcywNClJhaHVsDQoNCj4g
DQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

