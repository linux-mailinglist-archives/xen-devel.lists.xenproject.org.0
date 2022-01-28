Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D380549FB76
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 15:18:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262048.454093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDS4p-00071A-75; Fri, 28 Jan 2022 14:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262048.454093; Fri, 28 Jan 2022 14:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDS4p-0006yT-3j; Fri, 28 Jan 2022 14:18:11 +0000
Received: by outflank-mailman (input) for mailman id 262048;
 Fri, 28 Jan 2022 14:18:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PBCP=SM=epam.com=prvs=402709c4a7=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nDS4o-0006yL-1E
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 14:18:10 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d2fd1dc-8045-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 15:18:08 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20SEDj6j007414;
 Fri, 28 Jan 2022 14:18:00 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dvj2hr1uc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 14:17:57 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by HE1PR0301MB2329.eurprd03.prod.outlook.com (2603:10a6:3:67::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 14:15:08 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.018; Fri, 28 Jan 2022
 14:15:08 +0000
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
X-Inumbo-ID: 1d2fd1dc-8045-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmwmrXBx01QJ8sdLW913TcGMJv+n49+7gxh8zxFFXmAcIv/WvLHghNtAbOvFh2Z8bchknKsbjix9eys2S4Zk6VZuEu3mPcEAgn95GoIYOr+9206ubsWSjymsUtBIrstnDQt381wXdPEmUlm5uXW3tfURh1h8IFqGVaTJtM7167nhfOGQSB4cwxlJmZCkUuidyae6asVUFcy+GoXcjt6prpLFDb7ou3gUuUGsjXAVSJ85pj7Zrww+Rqx/IyjWOIjALq2yNBqFnNM4JD40kBAj02JmwsdVHnJfwE0RPYFmnCFyl/mnYa6JOCKmmWnsz3Z0LKmjANBLYiAcAUgBarCR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPF9nHunv7XD0KUnYJZA7t9DKxyrbKorhO9y6n1LCno=;
 b=EJ15lScqQRY2ldvb3Qu/OvSjloaSTsmC95q5FRr3ujk8/bZkElLSKYDejcYLm8voH53OKwRTj7QoZ6J2NDJ1n6F36/c0O7Uyn9tTfdYAvJFq/lYVq2Hify5iQwPSkxMrlAm/QmTm8LqA/HeuwB1QGA3O/w42Fn1BnnrcAif4e99caoIvBCA2G7Um7mk5CWpNKm9uU78BhiATNKB4EN5L5Hbxci/hQD4f1RBdPzBaHfsJCa+fo04E+AhariUyHDsQMHboGfopEa1EFk7YB4iccKjunLrDIJGec76RTXiTb2wJQUsGtz018FhAvi/EZMohYmWkfNBOG7J8KTScK9k7rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPF9nHunv7XD0KUnYJZA7t9DKxyrbKorhO9y6n1LCno=;
 b=ioBxxfoRHYXmpd47+bDHwRstqn/86UYD3k/4fwVo6zAV2OmqiRs/b1/i6buLwpvPYjC69MQJ3npbLFsCxXFs/VHXiP0jZuZBtlEVLBW5cSjryIPgsXizUFs6Wt2uoO/Pfp4NX9Qx0ZCkOmHxt1KOkieQpBbKm+TbX8JOqCf5STOvj2XAy9MGuhoL10GbHdmBY+onRzPjB/CanyVmLz/a4UiULgNXM7/9MqUVfswZXxmBAFxBTeq3ESiHlFYZtpsge0Jq6zgUB1Qo4eWR7k/q8n7eDW0crKxl1EUB1yOT+axKehdDiOtyZe5wC1ehmjmUMWP+U5D4jwqrDmvk3imEtQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Jan Beulich
	<jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Thread-Index: AQHX4ewHDku9OOCAtECwEMPLB4JkU6xfxaAAgAAMrQCAAALDgIABHnKAgBfrjIA=
Date: Fri, 28 Jan 2022 14:15:08 +0000
Message-ID: <c937d26a-5357-1ced-ee6a-ef713a3c5964@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-4-andr2000@gmail.com>
 <c7a9020a-9713-47b6-45bf-5ac2c6d4157c@suse.com>
 <Yd73Aq4w2H1Eo01h@Air-de-Roger>
 <4fb1d547-6f6d-c4e8-b2ef-0dea780dd66d@suse.com>
 <Yd/pnYDBwsdyLrPN@Air-de-Roger>
In-Reply-To: <Yd/pnYDBwsdyLrPN@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3efb7ea2-884b-45e1-8a13-08d9e26896ba
x-ms-traffictypediagnostic: HE1PR0301MB2329:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <HE1PR0301MB2329648A3F7BA8C0654FA3CDE7229@HE1PR0301MB2329.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1YVaGIy7cYlZD8CduClYfteS9V3LQPB240aaGtOKXTOEDTRJKWUAFv6NswfaXLXyoCI2Tm8b3RMZTvulhjPjqlNYRk4sZT1ez9Zswps/rW+Y41IuOrUylM9QK3Dvy6Z2osukUvtbFlSWChbh0xIpSPtZWR8zwkpetR1awjqaSTJgZg/SuYYV5j1LY02uRF77vPqUTSe14AafDEtuzcR8cjPkLTsGOCbEeub88DB0R46gVWrk7wtQ9vFBFPay7gNJypaApCJtZLWDqnqthj2YAt406DfYfAg8azwZao1GcNLiKguD4V2XNQLf788Hba7l8hXft3DNGpNJ1tTzpFIHYPUL3D5FOxlwkvPbNbJ4bXtEe1rD6TfoE05VbY+H2H0jFGNIxez4CnYjISb0btYD9qIkrUePObBm/teczUkUbhbBZOXOFoZ8tj7otLvnvS5v48xxqXeeNzLxvYN90YdkN9eXv3x5JODyNUxC2LBKhXsO/mn5j1HVMbSqWJxo/JsSzmqjqcWd2xQeK2rQnhREaj6RESfcAH3IBOkscZbeuHeGqABA15Jq04BliNgUJAOGrfIbL8EgXmQ3SPLYXI6c5Otka1BLBfjgVtU7Q86CZEAQlsu70xeymBcIeYulTxUdLrc8tvUEx20G/xIt8e/dIcolEwldUdkl13k00ubAsDBQ3yegE6FtJPCm3r5oFDh23zhDT6a7fMZ1Nz4BIbYb2ZGqhdZnczVyWSsefg7iHbIndZ72P0HX5Jzw8l+QMf7E
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(110136005)(26005)(6486002)(54906003)(508600001)(2616005)(71200400001)(316002)(186003)(36756003)(31686004)(91956017)(66446008)(64756008)(66556008)(66946007)(66476007)(76116006)(53546011)(8676002)(31696002)(7416002)(122000001)(6512007)(4326008)(38070700005)(6506007)(8936002)(38100700002)(107886003)(5660300002)(86362001)(2906002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eGxVVGg0MW5EWjRtRkZsYlBsdXdwOHpHMDNydC9pbDlpOU5WQjMzckpVSUIr?=
 =?utf-8?B?UWRrQVFUSjhoTGFtbGJaT2hYcmgwRU01NFJCMWQ3THREemZ2L0lQVVJYclNa?=
 =?utf-8?B?YUFyb1A3RzIwTjBtNmpGWUZ0Z3g3YUVXMGVUdUdoQlVGVkR4dWVGVHVmUnhY?=
 =?utf-8?B?VkNtMlJzQ3pzN0k4Y3NNNTd1RGh4NXAzc2J6cTNNblhQT2FGVENtbkJ2SmVz?=
 =?utf-8?B?Y0xDS1VNMEQzT3NpNFFkZEo2VXhiOUVlL1VGbmREMStFN2E0L3A1b3k2QkFO?=
 =?utf-8?B?SHRwRWRUWW5IVVRHalNHMnl6ZjdNdXBoSDdGeXF5djNqUm1GaHp1RkJ4bklV?=
 =?utf-8?B?OXQrMTlxdkdkbm80dndqaUc5cmgySVZhMHJDRVByYnZvUm1RblduWTQ1Yjlp?=
 =?utf-8?B?dGsrL2x4M3ArWEdaRE04b2R1ZzUweWRSc1MvNkh3SU4wclZHR3hxOUpOMmY5?=
 =?utf-8?B?L3NPVU5YalF2a0ZqYVBsUW1nT3BCN3N3Y25kVFppVlhPMU9RMmdOSi9jdjRM?=
 =?utf-8?B?NXp5YXl0SGFVbERpUTlZTGJReFFrUFZ1SFBUVmRMOTVLSEdYYUJvcUE5TGFt?=
 =?utf-8?B?Wkp2VnI4TjZKOUV0bDJCR2V6Y25ZaWNoYmNjOGJsbWY0ZHFMNysvTjZ3ejR2?=
 =?utf-8?B?VldlcExwcWNtK3p0OHRaY29qcHJWMUh4UUMvN0xrS0daNE04NnJKM1cwQ24w?=
 =?utf-8?B?NXlkOGdTOGlsMTVsV05NOFlqamVnNzc1ZzhXSitpOVc1TllXWngzSmwzUHNP?=
 =?utf-8?B?TzFPVzd2VzBFeFZLd0NXSjE1M0hrWDRIUXJWZnl1Zm82NkdDRVdJUGlxclVm?=
 =?utf-8?B?eVdTOExLVzc4RjY4UTRVVWNRMEc3Nm92dW9GRFhtMlZabWowYXpFSWY4bkph?=
 =?utf-8?B?VEhseFBXQTkwMEVNYkpiUWlEZTNibUs2Y0pVNE83WEdmaDZsWTlrbEVGQS9z?=
 =?utf-8?B?cGlZMzljVGtBbktOZi8yMWV1Vi82Rnp1TXJOMHNyOVp6L1JWd0h1U3krTEda?=
 =?utf-8?B?T3RDUFdseDhkUThUY1lYVFVCeTREZEtENjYvOVlnRFFkOVpOKzVoZFZhMFl2?=
 =?utf-8?B?NVdIQXA5SGMyWmVrVThMeUdXcEZmc0NucFpmSkx6T0s4TlRCYWdrRXlhemxo?=
 =?utf-8?B?RStzRkJIYmFzbEE1M1pZd2RmajUzR3Z2cHhzd1ZuMmpiNVp5YkYydWdxYitG?=
 =?utf-8?B?OXQ2aTNOL2JoU0ZzY05RTzNjdnlZQ2hBbzZrTnh4WTJ5RHRNVWhoN0crNnRQ?=
 =?utf-8?B?VkdCbi92M3R2N2pCeDJBb0tjYzEvSC9KZ3FPRWM0V29Kd3YwZlR1SDUxVnhM?=
 =?utf-8?B?bG9CNFBKVGZ6TFl1K2NrRFA4YXBxdko2WFNJYyt5R1JpcmJkY0pzV2JoZUsw?=
 =?utf-8?B?V2kxR3N5RVdsTlpXMU1qcjRISUlpa0U1amRyRW9NVHRKOWpndEc0eGpyY1JB?=
 =?utf-8?B?RmRiL04weCtxbng4MWVWOGN2Y2NmWlJ6em1Ya2NZQk9Ic1dpOVFkNzRZbkhp?=
 =?utf-8?B?dEV6bHd1MlM2MzRBc2ROelBaRWZWeW5KRXpwSndka1AxVEdVZU5GWWxVQkUx?=
 =?utf-8?B?bkEreE5UU1dtU2REK0VsVFNVemQ1c0ZxWW44dTNOdWpVcVFtdE1XWSszZnNV?=
 =?utf-8?B?b00vMEZoeUZPSXZPdEpDcWFDYVRUZklZZVlGbDN4V0VoMWpjbzh4OE90RENI?=
 =?utf-8?B?NTV3VVVsNk00bnpmNitoTkJ4bnozaEU3OStLallSdG1mdCs2UFFjS1ZxM2J6?=
 =?utf-8?B?eVJ1b0lKbHJsUUpFM212VVhmZFBPRmhqTDZSNU5OTjdoRENpUUFhQ21LbzdJ?=
 =?utf-8?B?em1LUng4L0g5dERmN3JNM0FrM0tRNjdzNlpMQ2czRzQ0Zi93WU9DL2dXVGxJ?=
 =?utf-8?B?aUtrLysxVCtidGM0aWRzc055RmhzN1M0MkhZQjJVREZKdWwyVHB4emVjT1dY?=
 =?utf-8?B?dDNRZ3puc28yYnpJb2dkZnd2akh6b3EvMHVPelhtb2FVc0pvTGpxdGt0UW93?=
 =?utf-8?B?QkdYQ1dhbnhjRkJHNWZMSWM0VjV6ci9EWFhkNjdlZzgvTmJ4UU5Qb2RoVkhy?=
 =?utf-8?B?MWJWakFXS2duUlE5NkJqR0NCYVdFTmVRNVhXWk1EdUl6cS84OEM1QzR6VU9O?=
 =?utf-8?B?NFVDa3NMeW0wZFBLdTIwSDRaSHRkZWE0UGhlamVxSlBZTHg3emppMktkaFdX?=
 =?utf-8?B?S1E3Snh3ZlYyRmxYR3g5czYvdUNYNndFZW8xOE01OC9FeHlFVGV5dDJudi9k?=
 =?utf-8?B?Y0JGb2hiTW40L0VEYk52UWVWT3F3TFhRZkF5TVBiS1BJdCtvT1ExK1dRWUZh?=
 =?utf-8?B?RWZrcFF4REt0OVZPSkM0QlJMcW1MOXJwL1VtS0U3U3RPeXQzZGxwZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1A519863B36EC44956C70B814A719DC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3efb7ea2-884b-45e1-8a13-08d9e26896ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 14:15:08.2138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BTcs3eqSyRlwanxB7SSJMrjfREs/W/b+ZI4U5igkEFt3YoOlVzOQbq447aTx474yMeTFCkb9xtNtvsr4MWZjaLNhaTwP0Zv447bn1LyGRqxSdwzlxfhjASgoTAXi0xGH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2329
X-Proofpoint-ORIG-GUID: EzYFDjtgVCSd_wTbWYyAw9aK9oDy6QKT
X-Proofpoint-GUID: EzYFDjtgVCSd_wTbWYyAw9aK9oDy6QKT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280091

SGksIFJvZ2VyLCBKYW4hDQoNCk9uIDEzLjAxLjIyIDEwOjU4LCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOg0KPiBPbiBXZWQsIEphbiAxMiwgMjAyMiBhdCAwNDo1Mjo1MVBNICswMTAwLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+IE9uIDEyLjAxLjIwMjIgMTY6NDIsIFJvZ2VyIFBhdSBNb25uw6kgd3Jv
dGU6DQo+Pj4gT24gV2VkLCBKYW4gMTIsIDIwMjIgYXQgMDM6NTc6MzZQTSArMDEwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDI1LjExLjIwMjEgMTI6MDIsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4gQEAgLTM3OSw3ICszOTYsNiBAQCB1aW50MzJfdCB2cGNpX3Jl
YWQocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSkN
Cj4+Pj4+ICAgDQo+Pj4+PiAgICAgICAgICAgZGF0YSA9IG1lcmdlX3Jlc3VsdChkYXRhLCB0bXBf
ZGF0YSwgc2l6ZSAtIGRhdGFfb2Zmc2V0LCBkYXRhX29mZnNldCk7DQo+Pj4+PiAgICAgICB9DQo+
Pj4+PiAtICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsNCj4+Pj4+ICAgDQo+Pj4+
PiAgICAgICByZXR1cm4gZGF0YSAmICgweGZmZmZmZmZmID4+ICgzMiAtIDggKiBzaXplKSk7DQo+
Pj4+PiAgIH0NCj4+Pj4gSGVyZSBhbmQgLi4uDQo+Pj4+DQo+Pj4+PiBAQCAtNDc1LDEzICs0OTgs
MTIgQEAgdm9pZCB2cGNpX3dyaXRlKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywg
dW5zaWduZWQgaW50IHNpemUsDQo+Pj4+PiAgICAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4gICAg
ICAgICAgIEFTU0VSVChkYXRhX29mZnNldCA8IHNpemUpOw0KPj4+Pj4gICAgICAgfQ0KPj4+Pj4g
KyAgICBzcGluX3VubG9jaygmcGRldi0+dnBjaV9sb2NrKTsNCj4+Pj4+ICAgDQo+Pj4+PiAgICAg
ICBpZiAoIGRhdGFfb2Zmc2V0IDwgc2l6ZSApDQo+Pj4+PiAgICAgICAgICAgLyogVGFpbGluZyBn
YXAsIHdyaXRlIHRoZSByZW1haW5pbmcuICovDQo+Pj4+PiAgICAgICAgICAgdnBjaV93cml0ZV9o
dyhzYmRmLCByZWcgKyBkYXRhX29mZnNldCwgc2l6ZSAtIGRhdGFfb2Zmc2V0LA0KPj4+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgZGF0YSA+PiAoZGF0YV9vZmZzZXQgKiA4KSk7DQo+Pj4+PiAt
DQo+Pj4+PiAtICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsNCj4+Pj4+ICAgfQ0K
Pj4+PiAuLi4gZXZlbiBtb3JlIHNvIGhlcmUgSSdtIG5vdCBzdXJlIG9mIHRoZSBjb3JyZWN0bmVz
cyBvZiB0aGUgbW92aW5nDQo+Pj4+IHlvdSBkbzogV2hpbGUgcGRldi0+dnBjaSBpbmRlZWQgZG9l
c24ndCBnZXQgYWNjZXNzZWQsIEkgd29uZGVyDQo+Pj4+IHdoZXRoZXIgdGhlcmUgd2Fzbid0IGFu
IGludGVudGlvbiB0byBhdm9pZCByYWNpbmcgY2FsbHMgdG8NCj4+Pj4gdnBjaV97cmVhZCx3cml0
ZX1faHcoKSB0aGlzIHdheS4gSW4gYW55IGV2ZW50IEkgdGhpbmsgc3VjaCBtb3ZlbWVudA0KPj4+
PiB3b3VsZCBuZWVkIGp1c3RpZmljYXRpb24gaW4gdGhlIGRlc2NyaXB0aW9uLg0KPj4+IEkgYWdy
ZWUgYWJvdXQgdGhlIG5lZWQgZm9yIGp1c3RpZmljYXRpb24gaW4gdGhlIGNvbW1pdCBtZXNzYWdl
LCBvcg0KPj4+IGV2ZW4gYmV0dGVyIHRoaXMgYmVpbmcgc3BsaXQgaW50byBhIHByZS1wYXRjaCwg
YXMgaXQncyBub3QgcmVsYXRlZCB0bw0KPj4+IHRoZSBsb2NrIHN3aXRjaGluZyBkb25lIGhlcmUu
DQo+Pj4NCj4+PiBJIGRvIHRoaW5rIHRoaXMgaXMgZmluZSBob3dldmVyLCBhcyByYWNpbmcgY2Fs
bHMgdG8NCj4+PiB2cGNpX3tyZWFkLHdyaXRlfV9odygpIHNob3VsZG4ndCBiZSBhIHByb2JsZW0u
IFRob3NlIGFyZSBqdXN0IHdyYXBwZXJzDQo+Pj4gYXJvdW5kIHBjaV9jb25mX3tyZWFkLHdyaXRl
fSBmdW5jdGlvbnMsIGFuZCB0aGUgcmVxdWlyZWQgbG9ja2luZyAoaW4NCj4+PiBjYXNlIG9mIHVz
aW5nIHRoZSBJTyBwb3J0cykgaXMgYWxyZWFkeSB0YWtlbiBjYXJlIGluDQo+Pj4gcGNpX2NvbmZf
e3JlYWQsd3JpdGV9Lg0KPj4gSU9XIHlvdSBjb25zaWRlciBpdCBhY2NlcHRhYmxlIGZvciBhIGd1
ZXN0IChyZWFsbHk6IERvbTApIHJlYWQgcmFjaW5nDQo+PiBhIHdyaXRlIHRvIHJlYWQgYmFjayBv
bmx5IHBhcnQgb2Ygd2hhdCB3YXMgd3JpdHRlbiAoc28gZmFyKT8gSSB3b3VsZA0KPj4gdGhpbmsg
aW5kaXZpZHVhbCBtdWx0aS1ieXRlIHJlYWRzIGFuZCB3cml0ZXMgc2hvdWxkIGFwcGVhciBhdG9t
aWMgdG8NCj4+IHRoZSBndWVzdC4NCj4gV2Ugc3BsaXQgNjRiaXQgd3JpdGVzIGludG8gdHdvIDMy
Yml0IG9uZXMgd2l0aG91dCB0YWtpbmcgdGhlIGxvY2sgZm9yDQo+IHRoZSB3aG9sZSBkdXJhdGlv
biBvZiB0aGUgYWNjZXNzLCBzbyBpdCdzIGFscmVhZHkgcG9zc2libGUgdG8gc2VlIGENCj4gcGFy
dGlhbGx5IHVwZGF0ZWQgc3RhdGUgYXMgYSByZXN1bHQgb2YgYSA2NGJpdCB3cml0ZS4NCj4NCj4g
SSdtIGdvaW5nIG92ZXIgdGhlIFBDSShlKSBzcGVjIGJ1dCBJIGRvbid0IHNlZW0gdG8gZmluZCBh
bnl0aGluZyBhYm91dA0KPiB3aGV0aGVyIHRoZSBFQ0FNIGlzIGFsbG93ZWQgdG8gc3BsaXQgbWVt
b3J5IHRyYW5zYWN0aW9ucyBpbnRvIG11bHRpcGxlDQo+IENvbmZpZ3VyYXRpb24gUmVxdWVzdHMs
IGFuZCB3aGV0aGVyIHRob3NlIGNvdWxkIHRoZW4gaW50ZXJsZWF2ZSB3aXRoDQo+IHJlcXVlc3Rz
IGZyb20gYSBkaWZmZXJlbnQgQ1BVLg0KU28sIHdpdGggdGhlIGFib3ZlIGlzIGl0IHN0aWxsIGZp
bmUgZm9yIHlvdSB0byBoYXZlIHRoZSBjaGFuZ2UgYXMgaXMgb3INCnlvdSB3YW50IHRoaXMgb3B0
aW1pemF0aW9uIHRvIGdvIGludG8gYSBkZWRpY2F0ZWQgcGF0Y2ggYmVmb3JlIHRoaXMgb25lPw0K
Pg0KPiBUaGFua3MsIFJvZ2VyLg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

