Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE88D4AD6CF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 12:30:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268235.462031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHOgv-0005up-AZ; Tue, 08 Feb 2022 11:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268235.462031; Tue, 08 Feb 2022 11:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHOgv-0005sx-6b; Tue, 08 Feb 2022 11:29:49 +0000
Received: by outflank-mailman (input) for mailman id 268235;
 Tue, 08 Feb 2022 11:29:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHOgt-0005sr-05
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 11:29:47 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a0e9fab-88d2-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 12:29:45 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218BONSj020471;
 Tue, 8 Feb 2022 11:29:42 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3qkyg0n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 11:29:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0301MB2222.eurprd03.prod.outlook.com (2603:10a6:800:27::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 11:29:07 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 11:29:07 +0000
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
X-Inumbo-ID: 6a0e9fab-88d2-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2E/rEANJ7kUXGNEWzSPsNv8/bKjohbGbWqcHm3NY4hn5m5TQmzpKqM4anWZJN5US7celyB+mRRMOkhA4hHja/MDeq6VGcK2fMQvNR7JwIeOtcqfYWM+9beS1CHkQEAnF0joZAVqfWMO5acYvuMzSifoY+clkB7JTNh988LJDyScPsUshbR95325/j4eAlcC+kSJ2E7iaLQIk9I2250BpsGUTtJgR1FwH7Tmac6XNvHWkkYX49MwaGFBHrEZ2+bEc1fdKMcpqg7LkjtTDHzFuTr9+/Lmhj/8SCE+97+LwF5LrgqKommrIVFhRrbdXNxxlXombFyVVCCHjK2kzOnDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKh9PX+YySR0kcBGD/nKT8csk9cjqsi0iuqbh6UUB0A=;
 b=Cs6MGLpUonwSP+pG9dQeroBLSWG2BQmL/vooQuXcOKohciZr5nRN0GEsTugtbDLKuY4iCVNjPEVY4AwhQjASxUkXCF9FFqB5IQiCzgV71SXSjbrF128U6AWWF6z+rwTyvtZAGwTBq8xHl1IdhiIpCMXVigzgUV16Chs+VoXoMZb0bi3+dZ5dwXqK7KORbZJhggv02EnygbROu1dTTipIvudlgPiDhiQKq3NxdvPTYIpqKzY6/61QSAzw7+t1PFBZZE4sIq+rPfN/3zIvLcM1tam3M9zkvbEt3Mle5FfbO/4FV1nyKFTqCK7Rbog450aAW5SIMZU9c348dhLE6fdotg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKh9PX+YySR0kcBGD/nKT8csk9cjqsi0iuqbh6UUB0A=;
 b=TSBQbbsZ2KQSnMMZpRcy0GR31h6Rbmz55Tgw7bisV/dpWvsFU2EwWszTzX2EV9lkbkoUF7J+cT9shQqVdzEDgTJ1owsJDaV3Aeqrop8M+cOCaNW87A1zK2iOunJcFNKhk7zGcl0kzMR1CsEJT2YuXD740HkmEo0rmsEyJB7cRnqTl8ul71qaWrjJ+U7D/AfKtfjfKjZi1Kr9QdF0jZBRk3IgsLuyNT6a9AFMhMF6+AkLEIL6xVSV14vbxC2M/bODE9iuep5VyQhn8opbyj4rSlPdhkuYdpQpLi2G0oXcy1ndFtuguCeJBiCAk872CSkEHqwDLZw0wwyWe7tvrYfGig==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
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
Subject: Re: [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Index: 
 AQHYGZFfEau2yoVfs02TXHZP7JM5E6yDcw0AgAXhW4CAABY4AIAAAW6AgAAD24CAAAHYgIAAFHwAgAAEyQA=
Date: Tue, 8 Feb 2022 11:29:07 +0000
Message-ID: <ec27927e-6c05-0e61-c0b8-c28bfd4d3d5e@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-10-andr2000@gmail.com>
 <7df2379e-1c30-c362-3106-c7ef23af5c73@suse.com>
 <0ff2a524-9a65-861a-df87-cf3f682862d7@epam.com>
 <140e163c-87d0-2ae8-d57b-7ebc6757de9e@suse.com>
 <08d02313-349d-9ad4-926d-0d1419866363@epam.com>
 <186b7264-1190-3df2-415d-f1ec73a7c03f@suse.com>
 <ccaaa9b8-8ed9-054e-b724-70ca07401be9@epam.com>
 <YgJP/jMhWBrLOpb2@Air-de-Roger>
In-Reply-To: <YgJP/jMhWBrLOpb2@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02fc6f77-5abb-44c9-7152-08d9eaf63801
x-ms-traffictypediagnostic: VI1PR0301MB2222:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0301MB2222C6028734E7FA09E4CD77E72D9@VI1PR0301MB2222.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 h4RF+V0dHqKqLu0QsOScmq0vwk7z54nNX0yw7XM8sO2nPBD/11/SwaF8mip6wPL3ZBA1Jv4DX4ybis5lJ5vn6YdUBryDaHuuUvSMQdrmOje+1qpgrqr9VoZo+59ON5Rbc4ZJe6pFYNcgPC8i0NmLpKBFmx0RocG/xkbuC9/usex6PfRMi9GQYYwSlJvHOCGHO4RJwktJwi1M31+xu5FC6PQJHOCSqqldFl9jXuLchjVETPy5RgFnFSEGm75QSMgKkRbqfADUo0NSJISddaE87mHobg7At2Nvjicy3HFkNaGr01ZKd/DB7gqELW8RnBB1rL9mdh7pCNzg9Lpb2Ief/plkrqGJdG39xTKwZo3i4HACrFxXgNLmV85iDyMzLo9wIPPVU9J/WyynkFt4Syl/WPgbjx4yIegrL+UO7CHZjYgmuh5avCVo2fXymxXD+ol+L+QJPdwExDO/3vJP/1e9KmkEEcrww65Q6kOzvD6DcQDXzYfMEKx3g3H+W0y+GQVlSRGO4P2NHsu3fYdqkEUqCwwXQpv44rpffV3J02fYe7UI7lFv9lducOrxXjn9OiBHxXWI0fv/LpSTrANTtOOOMSnKoCzrfeShOCyDZzMCKDuOUpyrADJQYe8/yLfzQcuRl6JIuBqBS0Fz97SIj3otM+r+W93XvJSBUfbHvMFMMz+PeZGigFFuziqGACbydIUa1Wd4lyhzHQ75GgPc38Y65QHcgLahR6wfFaYIi8W/nGu8efbTG3geyfWOZsNnC2VX
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(4326008)(8936002)(107886003)(91956017)(66556008)(83380400001)(66446008)(64756008)(66476007)(31686004)(36756003)(8676002)(508600001)(26005)(6486002)(66946007)(38070700005)(86362001)(53546011)(55236004)(31696002)(6512007)(5660300002)(122000001)(38100700002)(76116006)(6506007)(6916009)(186003)(54906003)(7416002)(71200400001)(2906002)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VlN2Rm9pZ1hSSHM0U29jQmd5YnVLdmpROE5LK3BXaDdYRUNnWTlNazEydXlx?=
 =?utf-8?B?ZEQ1K0l2RHJBQVhzdjNoR3Y5b0w0dXB2UnpkOWxlNG9xa3ZhL2sxZTU2RmVX?=
 =?utf-8?B?QUN3Yi9QMUJqZjdYQXorVi9iVjEvN25namNua09obWw2c25sVEgwRmd5ZHQr?=
 =?utf-8?B?WUtldVkrSE04THpaRWc1ZVdVcU1veG02eWZaMnBIZ1BZWW03OFBIR3J3TW8z?=
 =?utf-8?B?dEtxamtCY01QeU9vS2lORnE0WFJtd0pZN1lTSTFqQmdHNTBTVWJtaUhFNGRQ?=
 =?utf-8?B?NitQRnJnbVBRMDdQS2hEaGJjN2k3WndBUlVTMEhvVWFraC9ZSHB4UXFJeDF6?=
 =?utf-8?B?MkFlVkhlUmQzUW51UHRvM3hRMEk4TS9iL3BOU3BKYTVnbDR6MzhMUThnYXNt?=
 =?utf-8?B?blRjSlk3RnVOUEs1SHBMUDMxdlgrbFhJUkMwTElZTlNVdjZveTNFS2RKdTFk?=
 =?utf-8?B?RDNtVlZJZWozTXo3WTJ4VXc1V1NhVFR5dU14RVdlY3haTlJBUDRDaksrbFkx?=
 =?utf-8?B?NkJSTDdrQkkySlNkNnRNKzdINHcwOFNIRE5LWGs4Z2pld3FScEZwZ2hjbHlW?=
 =?utf-8?B?L0RrSmVnYXNCSlUrbTlOQVlPRGdZTXZoeE9oM3NxRG9wRFc4cVhIU1ZVdGtp?=
 =?utf-8?B?UDI2MWRlbEtWTGI5MEF1SHpjVDJCU0xCZm41NUdQSVZmVFdHaWtsYXdTek9U?=
 =?utf-8?B?NXJuZmN1RnNHd3F3TnlEcWJOc2NZbHlZdFp5QTlkeGRJcUQzL0RUZmNSUmZO?=
 =?utf-8?B?aHMwcmZyK0FwclZRVTg0Y1VzWlduQ1hQZHpzSVpra2RIRDNLTzVJRFo0RjlQ?=
 =?utf-8?B?NHI5S0IrV1VvdmFXOGxwV1FFUkM1Sm56RGxwa0RqQzNEbVRncmtRK0gwWkNY?=
 =?utf-8?B?VzRwSk9vdncwZDBCcEIzMEFjdzhWdUVGSVhtRzBBdW5sbjFmZFQ5cmtBZlY2?=
 =?utf-8?B?VEtwRWJ2bGdVUVRCUmZTemE1YUFVeHJid0VWbnFpQlV5QmEwV3VpM05JRjBT?=
 =?utf-8?B?L1Q3MXNYaUE5US9OQ1dJK3NKc2Fuc3ZqWlZGTVlIM0l5TFc5RGl5UTNNK2tw?=
 =?utf-8?B?eTRSNHNaUWNIdFI3UlpZNU03NjRIYTFqT1R4eFBZRm9BdUFySkpRRFVmeHB1?=
 =?utf-8?B?SjV5SDlhbXRLMzBIV2FadTMzTEFGditxVEpCNmxwRUMvaHpKM0c1Q1RXVTBH?=
 =?utf-8?B?d21CVEMycVZJSHJkRDk0b2Q3alJCK2NvRkpENUpucmVUWlZsVHl3dlpnTVNX?=
 =?utf-8?B?eFJYMCt5YWtmS0g4VkVMWXBFNXVsVWE0QjFqT0RBTmxRcWFvaVduSU95Y0VK?=
 =?utf-8?B?RHVXbHB2M09UdkFRVHhpZDk5czVsOTQyTUYrRGl0cC92ZXVSM0YrQXk4UnIx?=
 =?utf-8?B?ZDl6Y1VUV0FzTmo2UCtHeElEWktpd3FTekFXMVd2K3VhYStBb2VZVEJRVmty?=
 =?utf-8?B?ZEFaQzNFdzIrc25tQ3MxcCtCNFZYMkNMSG0xU09pZnNoMVFKd0VULytnQ0ZB?=
 =?utf-8?B?NTVPajUveU4xRDNhQkdiTEhiN0pSMkZONklOQ2IzRUlLWFQxdnhQSXFTblRo?=
 =?utf-8?B?VjNlaU9rK2phYVlIRkxCVWRkMUFJeStFVzU1dFo2eVdDV1ovcjNlTm9DM0dz?=
 =?utf-8?B?MitZS2hrK0ZIL05IRzhLeUhOSWNhbXk5RmtLOWxwTU1YUC9CTUhQRGw5TnV2?=
 =?utf-8?B?a3dqcGlpUFBneklTL2RtY3hlRURzVHg1NE1RUzBhc3lUV0hKdTN3Z0g3ZDBz?=
 =?utf-8?B?NDI0RTFCaENSZFRPMDY3QTg5SkYxZXg1SEo0NllGWjRYSDNFNkt4VndJaHZn?=
 =?utf-8?B?akhXQlgrZE5VaFk5ckV6K3dQNzY0K0VuOEZHVEFXdUtRa2Y4cjFMNjB5ZVRt?=
 =?utf-8?B?RFhEV3NNT3ZCRVJieVV6QklLbXdBbndMQkZ5VnVld3BQbEs2YnV0Z3NKeGFx?=
 =?utf-8?B?VVlKakxyK2xTNVFzbW9nWW1ZOGhsd2FsZ2VyZDREclVFTytlTTVBay95WXpP?=
 =?utf-8?B?VVk4b3BlRnBWV2hqTEVHNEVONFNXZ2duT3p1Z0Z0a29NZVo5eFNvSDdRM0pW?=
 =?utf-8?B?T0tHZTY1K0RhUFp2czVrRGhQQTN4TDJhbGdkN1lZbDVQZkdzUGdpNGJ4R29M?=
 =?utf-8?B?aTZuNi85NktTMmtRTXlJbytlck5kMWc4UTNaU2FKY1I0RitNd0JOeHkzQW5D?=
 =?utf-8?B?bkpKbGxjUDY1eUE4VzVXU3BQWUFaNzhhOGkwL0pDRjE2clQ2NHh5bTllU3h6?=
 =?utf-8?B?OEErUWdYUjZnRUhiWTJ4QXkyYitXdXEzc1l1NXp6U2tOQ25GSHZVYWdlMlZG?=
 =?utf-8?B?djRxOCtkM1VJM01sdkZ3Z1lrajlEdVVZVCtrVXpEbHBTWmhrb3I3eDgzQWpQ?=
 =?utf-8?Q?kuu9S3O9vT1WFww0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9BF365DC23D7240BE54072F284CD13D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fc6f77-5abb-44c9-7152-08d9eaf63801
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 11:29:07.0859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q8eWy46Chxc9XFweLVDEKiyierrK+K+/jvNUxi3xOyY/cSZAt4n3WzAoHfgYjRnZILpskiNxegp6fmZxHJy92zA4S5P0xnfKX6duAZ6QZv51sa3kVDsjcL100sju0dxm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB2222
X-Proofpoint-GUID: Xm5lDoUcKfQaylzmGXnNgfdd19KWLBH0
X-Proofpoint-ORIG-GUID: Xm5lDoUcKfQaylzmGXnNgfdd19KWLBH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_03,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=872 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202080069

DQoNCk9uIDA4LjAyLjIyIDEzOjExLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUdWUs
IEZlYiAwOCwgMjAyMiBhdCAwOTo1ODo0MEFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAwOC4wMi4yMiAxMTo1MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+
Pj4gT24gMDguMDIuMjAyMiAxMDozOCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+
Pj4+IE9uIDA4LjAyLjIyIDExOjMzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDA4LjAy
LjIwMjIgMDk6MTMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+IE9uIDA0
LjAyLjIyIDE2OjI1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4gT24gMDQuMDIuMjAyMiAw
NzozNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4+PiAtLS0gYS94ZW4v
ZHJpdmVycy92cGNpL2hlYWRlci5jDQo+Pj4+Pj4+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hl
YWRlci5jDQo+Pj4+Pj4+PiBAQCAtNDU0LDYgKzQ1NCwyMiBAQCBzdGF0aWMgdm9pZCBjbWRfd3Jp
dGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+Pj4+Pj4+
PiAgICAgICAgICAgICAgcGNpX2NvbmZfd3JpdGUxNihwZGV2LT5zYmRmLCByZWcsIGNtZCk7DQo+
Pj4+Pj4+PiAgICAgIH0NCj4+Pj4+Pj4+ICAgICAgDQo+Pj4+Pj4+PiArc3RhdGljIHZvaWQgZ3Vl
c3RfY21kX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVn
LA0KPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBjbWQsIHZv
aWQgKmRhdGEpDQo+Pj4+Pj4+PiArew0KPj4+Pj4+Pj4gKyAgICAvKiBUT0RPOiBBZGQgcHJvcGVy
IGVtdWxhdGlvbiBmb3IgYWxsIGJpdHMgb2YgdGhlIGNvbW1hbmQgcmVnaXN0ZXIuICovDQo+Pj4+
Pj4+PiArDQo+Pj4+Pj4+PiArI2lmZGVmIENPTkZJR19IQVNfUENJX01TSQ0KPj4+Pj4+Pj4gKyAg
ICBpZiAoIHBkZXYtPnZwY2ktPm1zaS0+ZW5hYmxlZCB8fCBwZGV2LT52cGNpLT5tc2l4LT5lbmFi
bGVkICkNCj4+Pj4+Pj4+ICsgICAgew0KPj4+Pj4+Pj4gKyAgICAgICAgLyogR3Vlc3Qgd2FudHMg
dG8gZW5hYmxlIElOVHguIEl0IGNhbid0IGJlIGVuYWJsZWQgaWYgTVNJL01TSS1YIGVuYWJsZWQu
ICovDQo+Pj4+Pj4+PiArICAgICAgICBjbWQgfD0gUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFOw0K
Pj4+Pj4+Pj4gKyAgICB9DQo+Pj4+Pj4+PiArI2VuZGlmDQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiAr
ICAgIGNtZF93cml0ZShwZGV2LCByZWcsIGNtZCwgZGF0YSk7DQo+Pj4+Pj4+PiArfQ0KPj4+Pj4+
PiBJdCdzIG5vdCByZWFsbHkgY2xlYXIgdG8gbWUgd2hldGhlciB0aGUgVE9ETyB3YXJyYW50cyB0
aGlzIGJlaW5nIGENCj4+Pj4+Pj4gc2VwYXJhdGUgZnVuY3Rpb24uIFBlcnNvbmFsbHkgSSdkIGZp
bmQgaXQgcHJlZmVyYWJsZSBpZiB0aGUgbG9naWMNCj4+Pj4+Pj4gd2FzIGZvbGRlZCBpbnRvIGNt
ZF93cml0ZSgpLg0KPj4+Pj4+IE5vdCBzdXJlIGNtZF93cml0ZSBuZWVkcyB0byBoYXZlIGd1ZXN0
J3MgbG9naWMuIEFuZCB3aGF0J3MgdGhlDQo+Pj4+Pj4gcHJvZml0PyBMYXRlciBvbiwgd2hlbiB3
ZSBkZWNpZGUgaG93IFBDSV9DT01NQU5EIGNhbiBiZSBlbXVsYXRlZA0KPj4+Pj4+IHRoaXMgY29k
ZSB3aWxsIGxpdmUgaW4gZ3Vlc3RfY21kX3dyaXRlIGFueXdheXMNCj4+Pj4+IFdoeSAid2lsbCI/
IFRoZXJlJ3Mgbm90aGluZyBjb25jZXB0dWFsbHkgd3Jvbmcgd2l0aCBwdXR0aW5nIGFsbCB0aGUN
Cj4+Pj4+IGVtdWxhdGlvbiBsb2dpYyBpbnRvIGNtZF93cml0ZSgpLCBpbnNpZGUgYW4gaWYoIWh3
ZG9tKSBjb25kaXRpb25hbC4NCj4+Pj4+IElmIGFuZCB3aGVuIHdlIGdhaW4gQ0VULUlCVCBzdXBw
b3J0IG9uIHRoZSB4ODYgc2lkZSAoYW5kIEknbSB0b2xkDQo+Pj4+PiB0aGVyZSdzIGFuIEFybSBl
cXVpdmFsZW50IG9mIHRoaXMpLCB0aGVuIHRvIG1ha2UgdGhpcyBhcyB1c2VmdWwgYXMNCj4+Pj4+
IHBvc3NpYmxlIGl0IGlzIGdvaW5nIHRvIGJlIGRlc2lyYWJsZSB0byBsaW1pdCB0aGUgbnVtYmVy
IG9mIGZ1bmN0aW9ucw0KPj4+Pj4gY2FsbGVkIHRocm91Z2ggZnVuY3Rpb24gcG9pbnRlcnMuIFlv
dSBtYXkgaGF2ZSBzZWVuIEFuZHJldydzIGh1Z2UNCj4+Pj4+ICJ4ODY6IFN1cHBvcnQgZm9yIENF
VCBJbmRpcmVjdCBCcmFuY2ggVHJhY2tpbmciIHNlcmllcy4gV2Ugd2FudCB0bw0KPj4+Pj4ga2Vl
cCBkb3duIHRoZSBudW1iZXIgb2Ygc3VjaCBhbm5vdGF0aW9uczsgdGhlIHZhc3QgcGFydCBvZiB0
aGUgc2VyaWVzDQo+Pj4+PiBpcyBhYm91dCBhZGRpbmcgb2Ygc3VjaC4NCj4+Pj4gV2VsbCwgd2hp
bGUgSSBzZWUgbm90aGluZyBiYWQgd2l0aCB0aGF0LCBmcm9tIHRoZSBjb2RlIG9yZ2FuaXphdGlv
bg0KPj4+PiBpdCB3b3VsZCBsb29rIGEgYml0IHN0cmFuZ2U6IHdlIGRvbid0IGRpZmZlcmVudGlh
dGUgaHdkb20gaW4gdnBjaQ0KPj4+PiBoYW5kbGVycywgYnV0IGluc3RlYWQgcHJvdmlkZSBvbmUg
Zm9yIGh3ZG9tIGFuZCBvbmUgZm9yIGd1ZXN0cy4NCj4+Pj4gV2hpbGUgSSB1bmRlcnN0YW5kIHlv
dXIgY29uY2VybiBJIHN0aWxsIHRoaW5rIHRoYXQgYXQgdGhlIG1vbWVudA0KPj4+PiBpdCB3aWxs
IGJlIG1vcmUgaW4gbGluZSB3aXRoIHRoZSBleGlzdGluZyBjb2RlIGlmIHdlIHByb3ZpZGUgYSBk
ZWRpY2F0ZWQNCj4+Pj4gaGFuZGxlci4NCj4+PiBUaGUgZXhpc3RpbmcgY29kZSBvbmx5IGRlYWxz
IHdpdGggRG9tMCwgYW5kIGhlbmNlIGRvZXNuJ3QgaGF2ZSBhbnkNCj4+PiBwYWlycyBvZiBoYW5k
bGVycy4NCj4+IFRoaXMgaXMgZmFpcg0KPj4+ICAgIEZUQU9EIHdoYXQgSSBzYWlkIGFib3ZlIGFw
cGxpZXMgZXF1YWxseSB0byBvdGhlcg0KPj4+IHNlcGFyYXRlIGd1ZXN0IHJlYWQvd3JpdGUgaGFu
ZGxlcnMgeW91IG1heSBiZSBpbnRyb2R1Y2luZy4gVGhlDQo+Pj4gZXhjZXB0aW9uIGJlaW5nIHdo
ZW4gZS5nLiBhIGhhcmR3YXJlIGFjY2VzcyBoYW5kbGVyIGlzIHB1dCBpbiBwbGFjZQ0KPj4+IGZv
ciBEb20wIChmb3Igb2J2aW91cyByZWFzb25zLCBJIHRoaW5rKS4NCj4+IEBSb2dlciwgd2hhdCdz
IHlvdXIgcHJlZmVyZW5jZSBoZXJlPw0KPiBUaGUgbmV3bHkgaW50cm9kdWNlZCBoYW5kbGVyIGVu
ZHMgdXAgY2FsbGluZyB0aGUgZXhpc3Rpbmcgb25lLA0KQnV0IGJlZm9yZSBkb2luZyBzbyBpdCBp
bXBsZW1lbnRzIGd1ZXN0IHNwZWNpZmljIGxvZ2ljIHdoaWNoIHdpbGwgYmUNCmV4dGVuZGVkIGFz
IHdlIGFkZCBtb3JlIGJpdHMgb2YgZW11bGF0aW9uDQo+ICAgc28gaW4NCj4gdGhpcyBjYXNlIGl0
IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8gZXhwYW5kIGNtZF93cml0ZSB0byBhbHNvIGNhdGVyIGZvcg0K
PiB0aGUgZG9tVSBjYXNlPw0KU28sIGZyb20gdGhlIGFib3ZlIEkgdGhvdWdodCBpcyB3YXMgb2sg
dG8gaGF2ZSBhIGRlZGljYXRlZCBoYW5kbGVyDQo+DQo+IEkgdGhpbmsgd2UgbmVlZCB0byBiZSBz
ZW5zaWJsZSBoZXJlIGluIHRoYXQgd2UgZG9uJ3Qgd2FudCB0byBlbmQgdXANCj4gd2l0aCBoYW5k
bGVycyBsaWtlOg0KPg0KPiByZWdpc3Rlcl9yZWFkKC4uLikNCj4gew0KPiAgICAgaWYgKCBpc19o
YXJkd2FyZV9kb21haW4oKSApDQo+ICAgICAgICAgLi4uLg0KPiAgICAgZWxzZQ0KPiAgICAgICAg
IC4uLg0KPiB9DQo+DQo+IElmIHRoZXJlJ3Mgc2hhcmVkIGNvZGUgaXQncyBJTU8gYmV0dGVyIHRv
IG5vdCBjcmVhdGUgYXMgZ3Vlc3Qgc3BlY2lmaWMNCj4gaGFuZGxlci4NCj4NCj4gSXQncyBhbHNv
IG1vcmUgcmlza3kgdG8gdXNlIHRoZSBzYW1lIGhhbmRsZXJzIGZvciBkb20wIGFuZCBkb21VLCBh
cyBhDQo+IGNoYW5nZSBpbnRlbmRlZCB0byBkb20wIG9ubHkgbWlnaHQgZW5kIHVwIGxlYWtpbmcg
aW4gdGhlIGRvbVUgcGF0aCBhbmQNCj4gdGhhdCBjb3VsZCBlYXNpbHkgYmVjb21lIGEgc2VjdXJp
dHkgaXNzdWUuDQpTbywganVzdCBmb3IgeW91ciBqdXN0aWZpY2F0aW9uOiBCQVJzLiBJcyB0aGlz
IHNvbWV0aGluZyB3ZSBhbHNvIHdhbnQNCnRvIGJlIGtlcHQgc2VwYXJhdGUgb3Igd2Ugd2FudCBp
ZiAoaXNfaHdkb20pPw0KSSBndWVzcyB0aGUgZm9ybWVyLg0KPg0KPiBUaGFua3MsIFJvZ2VyLg0K
VGhhbmsgeW91LA0KT2xla3NhbmRy

