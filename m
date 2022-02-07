Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9244AD07A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 06:07:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267337.461235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHIht-0003ca-V7; Tue, 08 Feb 2022 05:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267337.461235; Tue, 08 Feb 2022 05:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHIht-0003aU-Rp; Tue, 08 Feb 2022 05:06:25 +0000
Received: by outflank-mailman (input) for mailman id 267337;
 Mon, 07 Feb 2022 17:58:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ErhA=SW=epam.com=prvs=40371fc674=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1nH8HR-0008EP-L6
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 17:58:25 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a724a8a-883f-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 18:58:24 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217HhGRo022567;
 Mon, 7 Feb 2022 17:58:19 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e377b8834-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 17:58:19 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by VI1PR03MB4062.eurprd03.prod.outlook.com (2603:10a6:803:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 17:58:14 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::e975:b192:b8cd:4f73]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::e975:b192:b8cd:4f73%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 17:58:14 +0000
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
X-Inumbo-ID: 8a724a8a-883f-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJKqqxzz4z0DjZw9DPkUz02F+8wu3M/lwESewqEty9NA4GlQuIyrnIwKDPxCS5mDj7/9MpTplStiDfIK34+RAdIiZDY0QA4fQna9JfvdCfddKiqZMWtUUDJRLItkllaTMaRECvA7UF67dJtkHptl3DEwrkE7fl9LdwjWE9RhhcDCyZIfPxXQ9mdnl1WdS6Do3YBaYW5SlGnpmxI5uy4zsjTT/iZN7lZ51/jSac4KQJvSZMkfKhaLyE5mm9mQX+7qcpZD5XZoGf3uHTuOTLjZqu/wPFfq3I48V8+ozx+5pGAG5FXu6Z+ygQU6iVxtNz7hnras+d0DRLInjIghk+4Qvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsIXGB17eFaEWtUTc9hevLg1d7sVITjjbZekA2/V+0M=;
 b=SmOgxKyoEd5QhcLH2jpzjfK8bGUK9HIJMyCGn7TovIkJQZeV69FlBVpLopeRfylnjw6P+Uo8jNDURLwqQtzl+J2vntgkkzwoez8MYFaW255D2iS9RnLzTL2Rw7FmyuRVJxDBSOGRCwOGSN3ZdV4QGkOm9gk+9TW7is46bCIqZRFT2Khw0sfYpRSbh2WO6ocxpRHA0RoC4E6JcknVwog1oECWqh/7hxzReM1znXxX02JAlvPbHmYdfcTWXECPltq1CvoG7ffirHSB+tUVqYL0zy2YBC8dY/pv0/hWMvOxpAWhG2T9W8INo7gUQw67B+XXGUNE74plh183sAJLQ1zZqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsIXGB17eFaEWtUTc9hevLg1d7sVITjjbZekA2/V+0M=;
 b=TP2eyssj+VWFw1GlkG2gj4wU0MplRRZ578nv+WL50utaPcaFMM2Lk+5izezFo3CZE5ktKauSVEfKVQGXWy7bjlURB9K1MI9RNhiKtD4XFeBI2QHMSosvs4TrZhMiu31qgPX7E9OIoMHOLRG6m8qlOzRpunjIHbNZAgDOUSM7vqQJBCGvgCun/Ux4yVybFGaNdiLLfZqo79gjNSE0w3Ccb9vQ1VhtzBB/kfi4piA1KRdNC2ScafvQFqRvEttNU2cGxJfTAKuAekTHsON6auVW3o1PEPcVpp9HtZX/I/rd/xzuur7XBfmwLFIepnPpu/8ggdPtRrfnmUfo9kH9H6A3yQ==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>
CC: Oleksandr <olekstysh@gmail.com>, Jan Beulich <jbeulich@suse.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Bob Eshleman
	<bobbyeshleman@gmail.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Connor Davis <connojdavis@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
Thread-Topic: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on
 Arm
Thread-Index: AQHYAomKM/4d8JNsdEqc8nNA4dib2KxWDBOAgAAkKACAMl6jAIAABJuA
Date: Mon, 7 Feb 2022 17:58:14 +0000
Message-ID: <46822a8c-998b-6ebb-5e2a-c9df5f7650e9@epam.com>
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
 <a7a905fe-3feb-507a-7ce4-ed7dce78de86@suse.com>
 <aeba1af9-8386-3bca-dfbd-1c9110ae09de@gmail.com>
 <ef4f77d7-2ad7-998e-c32b-534fdbc64e7f@xen.org>
In-Reply-To: <ef4f77d7-2ad7-998e-c32b-534fdbc64e7f@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6e640da-93a9-4f37-4560-08d9ea63699c
x-ms-traffictypediagnostic: VI1PR03MB4062:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR03MB40625C9C5790F397D1D863B7862C9@VI1PR03MB4062.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XIhKzCHQ/S7Zka5FUTweyon3gTazImaGM37wS9BZrFUC7JuVItUroixGNZlXB5Jmq1m/mX9BHKVCC3HqIYqO+ukiez3xtz41cgAi+CXtaV4WW3+bnsIAjeRxIQznOhw6i1ecP2dQsvdj1PeI8dlpQbKrUAS3L8GDpSbTJ6TmSJHMvV5arrI+ePdQjTgLS+cNglUU5r984jbGycBP2yFQAx8IqjrMLRuYirxZm5saQqyNEdWb3b56kSS7GZm1myCYWLcSrmbkbjYKOnjhg38YMtx1N/xMh0nL1kLoZSirX74yYTvXYFsr0P4OsxF2HQUKj2NpH4Odj0sjNxqk0qGXvtphUZctUmd03seTmqqqLAFVs+T0CqNIEPwyM2p4Tm6q0MoCkcYy0um/OQxfEAwECBcZhWbPDdu6NwLv03ShoXdqOlqlT7p9xPClXZUReUyPR9OBkos6wD+Hz6OYYhXp72s9qlRq+hG0IIm7vZdJhBws4B/TXAngIClztbg7X0ErI3PZjZXjmDLn+KGkaYobu4TU2sptqtR7VHi+Wf4Hy5i/NnN5Pji3dqCsZw7o9tRWJD6+5XTAZIdt9FplYHP71mwN1aGU0MOsmu/9uw6fldwZvAcAMF3Yh+3lkH4F3zjZZC4cLGBg8snhRjQ5Ll80ohLQPFX8xmYbwNk0H3hO5o6KSRH/5yTXY4us/QQBvEIT6pPyUkLQLYVSdEEAD1krFfdD8IR5qOXAHL6ZKKveYDuXHPgOIcMHCywE2Jd2/2zP1mI0ST7biQbK69zK3OQrvYoOr1ido3t6FujJouS6bEpgiGBrfjrzoW9Egr+dtnWM
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(38100700002)(2906002)(6916009)(966005)(6486002)(508600001)(54906003)(7416002)(4744005)(122000001)(4326008)(86362001)(5660300002)(31696002)(38070700005)(53546011)(31686004)(55236004)(6512007)(6506007)(8936002)(66946007)(91956017)(76116006)(8676002)(64756008)(36756003)(83380400001)(26005)(66476007)(186003)(71200400001)(66446008)(66556008)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bnhwM0J5SVlmSXNYa2lqYXM4WXdHK2tuOG9JeTZWM1NEU2FuY1Q4MStSWXBr?=
 =?utf-8?B?eHVlUVVuUGt6STJGTisya24zT0sxVkU4YnV4Ykd3QTJTWEtRZG5NNjBzekFB?=
 =?utf-8?B?VEJBSnBlU044VkhEazJ1dUg5ZVdJQlFFRGpyZHp1YlFLTnVvbm5NRGFmVzAv?=
 =?utf-8?B?bHNpMEllZ1dkUmRoejIzYkpDTWRiNDBXeU5KZldTVk1qMW8yV0lVYU50R09M?=
 =?utf-8?B?M2dnWXUwZ0k0U3RQZWoyME5qSjZqM2FHMEtUZkVPSjg4Z1VsRWZmZEpmdDND?=
 =?utf-8?B?ZmY0UlpzTlFKTFFSK05oY3VSblRRdkw0eG54T2V5cG9qTW1CWTNicC9aeUg4?=
 =?utf-8?B?R3RST2NLQ0xvUUdNaFJBU1hxSTcrdFY1RUVyYzdHcExGVEo0ZG80WGF3RVJT?=
 =?utf-8?B?akUxeWVGSGwxUVdVV09kWDVDcXZKbjhjL0ZWQk1VQWcxRFl2aTRrWHpjdlVZ?=
 =?utf-8?B?all4SnVzdExtdjJwQU5USmZ3SVZvRVZYaE1IazFwNTZjNER2L2RiNlNRbzV6?=
 =?utf-8?B?dXVyS0RpL0lpa21jTkNlUVVYbkxwSCtWSndLdXByZEF2V3p0VTl1WFFsK05O?=
 =?utf-8?B?eGYzN1lHbUZydStsNVJxdFdqWGJFVDZTMGFjSk5FL29OQ2V5M3VnMkR3SmNw?=
 =?utf-8?B?a3JYMUl3NWRrTjhsb0ZLUEJxWGZjeTFDVmxEcEV4RExoRzdSUDk3dnJrWEJn?=
 =?utf-8?B?V3lic09sRTN2TnF0cFNHWjVTeTZVVUVOZTJYbnUyZFl4NGViVGFQRmxGYndU?=
 =?utf-8?B?Y2tVODV6eS9qT0o1TktCMUlUSUh6Q2VlT3pDZlg3cW12aTVrQTh1SnlrbERl?=
 =?utf-8?B?U3IzcHNXN1RpQWpySWRyTFNtV2Z1NUhSdElZd0ppRkwwYlFtckczZ2xwRDRi?=
 =?utf-8?B?VVoydVpMVGVQVTR6eDc5ZmtnaDJJMXhHQVVHS1lsY2IxZG5MV0tIZGJlWVVJ?=
 =?utf-8?B?ZllubjFhb1pqOHZMcXZvUWhJUzhKSjFra3dYMGJid3M0OW1WZXJ0aXJrUGZ4?=
 =?utf-8?B?TFlydjM2QlJxM1pnZlgwaThjQWxLTVBXSzVEelVteVZHZTU3bGF4Wm4vVDFa?=
 =?utf-8?B?VzNrcmR6N1B3LzNrZmgxZXlJaUpvVTJha0lSb3FEQ29tYmJ0RTJ4QUIwNW1M?=
 =?utf-8?B?ZUs5TmlnamVHUjF0aHpORDI5eVE4NHNHMHZScFkrL1hsNWNpaFd5NFVGcWJu?=
 =?utf-8?B?M3BGT3ZZeXJxSHBicDJQNTJ3YTk5WkYxYUUzeUhoZ28ySmFPRDJ2T3RWRUhZ?=
 =?utf-8?B?UzhrUGN0TEdzQUdOSDFkbXVnUHhOTlRSZkdTLzFvMWtvWGwvUkJZaXBib1Zj?=
 =?utf-8?B?a2srRU1aa0c5dTRMRVBIQmtJbHd5RldnMm1hQTZ6MHhmY1laeWhTRTYrMzdY?=
 =?utf-8?B?MnBIY29SVCtvTjluMmRYYzhxRGlrMWNvZU9JWFBxWWl0ZDBBS2lhb1gwTlVS?=
 =?utf-8?B?Z3ErYjZXRjA2YTRNeGtIdFhBZnpYOWgrYnJESXpoNFFUQzJ1bGszSDdQUWxr?=
 =?utf-8?B?TTdlT1lWeGFOOEc4dDhYQllTdHRVcjVvQTBvMmpxeFlFZ3hhU0FyeENYOS9F?=
 =?utf-8?B?eUc5cW54Z21OYUNyOURLVUpaSXZjaHhlRUNOSXg0SUxuTndaVFJ2Y2pKbkQy?=
 =?utf-8?B?VHB1ZE1JeTBzSmNSWkVsKzdUTWhaNGlramt6bFBETEVGOFN2TWNOTFZJaGIv?=
 =?utf-8?B?VnRsQlpoV0FzSE1GSVk1OGFMbHVHS21NS243VXhKY3d6ZDNqVlNkUERFSGVL?=
 =?utf-8?B?REdXemhCVWRNT05yQVB0WFR6UDZrWENaWHhxSENHSkU5VUZYbmIraHVsdHdK?=
 =?utf-8?B?NTR0bE1JN0hEejRiempTdEtsZmZXS3cxRWY0dHJITWpSOFJiUnlycHVNd1ZT?=
 =?utf-8?B?amhYenlsRGpHV0F4alU3NTRzMFZsaWgzNnd5RDJqT1RmSEVzNkdWTWxIdXFY?=
 =?utf-8?B?MzRUcHh5bkc2ejI5QjV6dmUvaC85TGJzOVZwaGp6RHBQcXhBZy9aT3MwNy8z?=
 =?utf-8?B?cDBxb2pHelErZFdnd29BeDNoUjJSaFQzMVUzbW1zWFJNVXA5VU4xdkUvRjJU?=
 =?utf-8?B?VnIvbS9vamVibHdmSWRrVU9iY3ArK0FDTUtGWmNsNDBSa1o4eXBjc0JvUVRx?=
 =?utf-8?B?dVBvd2JpNlBOMEQ5d3VrTE5zS3B5OVhzYVFIN09xVnp1NmNyYXlHQXprZ1lq?=
 =?utf-8?B?cHJPSmxkZGlXR0N2RThzVUlySVhrWFVCZzQrN3I3a0cxeGxpWWV5bHVGOG01?=
 =?utf-8?Q?Jq0p+cwfadbHgT0/khfCc1due2V7S8L/+2UzKlq3aE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4887C915859FA45930C02158F3F826B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e640da-93a9-4f37-4560-08d9ea63699c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 17:58:14.3365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rk5yCl3sUkGs4jO4QesHDQFGXZ9niwmoXmyDldb8jDkkzKRxCrMaz8PcVUX+r0cER26pOdnLyV4kmH+IW3+J34So6cHgPpzrgJua7St+WYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4062
X-Proofpoint-ORIG-GUID: BtVVE05XEHOGRV7Yp0tAxDL_8sMhkDDA
X-Proofpoint-GUID: BtVVE05XEHOGRV7Yp0tAxDL_8sMhkDDA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=851
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070111

DQpPbiAwNy4wMi4yMiAxOTo0MSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSwNCg0KDQpIaSBK
dWxpZW4NCg0KDQo+DQo+IFNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4NCg0KbnANCg0KDQo+DQo+
IE9uIDA2LzAxLzIwMjIgMTY6MzAsIE9sZWtzYW5kciB3cm90ZToNCj4NCj4gU28gSSBhZ3JlZSB3
aXRoIEphbiB0aGF0IHRoZSBuYW1lIHNob3VsZCBiZSBhZGp1c3RlZCBpZiBpdCBzdGF5cyB3aGVy
ZSANCj4gaXQgaXMuDQo+DQo+IFRoYXQgc2FpZCwgSSB3b3VsZCBhY3R1YWxseSBwcmVmZXIgdGhl
IGFkanVzdG1lbnQgaW4gDQo+IGFsbG9jX2hlYXBfcGFnZXMoKS4gSXQgaXMgb25lIGxlc3MgYXNz
aWdubWVudCBwZXIgcGFnZSBhbmQgSSBkb24ndCANCj4gZXhwZWN0IGFueSBpc3N1ZSB3aXRoIHNl
dHRpbmcgdGhlIGJpdHMgdG8gSU5WQUxJRF9HRk4gZXZlcnl3aGVyZSBpbiANCj4gdGhlIGZ1dHVy
ZSBvbiBBcm0uDQoNCg0KU29ycnkgSSBsb3N0IHRoZSBjb250ZXh0LiBUbyBjbGFyaWZ5LCBhcmUg
eW91IHNwZWFraW5nIGFib3V0IHdoYXQgSSANCnByb3Bvc2VkIGF0IFsxXT8NCg0KDQpJZiB5ZXMs
IHRoZW4gLi4uDQoNCg0KPg0KPiBOb3RlIHRoYXQgeW91IHdvdWxkIGFsc28gbmVlZCB0byB1cGRh
dGUgYWNxdWlyZV9zdGF0aWNtZW1fcGFnZXMoKS4NCg0KDQogwqAuLi4geWVzLCB3aWxsIGRvLg0K
DQoNClsxXSANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC9iNDgzMjI4NC05YmZj
LWQ2MDAtMTRiMS0xNzg0ZjUzZTVkOWZAZ21haWwuY29tLw0KDQoNCj4NCj4NCj4gQ2hlZXJzLA0K
Pg0KLS0gDQpSZWdhcmRzLA0KDQpPbGVrc2FuZHIgVHlzaGNoZW5rbw0K

