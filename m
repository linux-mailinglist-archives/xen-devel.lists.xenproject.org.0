Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E402B345B91
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:01:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100576.191765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdqn-0008Ud-7N; Tue, 23 Mar 2021 10:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100576.191765; Tue, 23 Mar 2021 10:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdqn-0008U6-2p; Tue, 23 Mar 2021 10:01:25 +0000
Received: by outflank-mailman (input) for mailman id 100576;
 Tue, 23 Mar 2021 10:01:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdql-0008Eu-Gb
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:01:23 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 873b4118-5e5b-48cb-b00d-f294f73c1ab0;
 Tue, 23 Mar 2021 10:01:21 +0000 (UTC)
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
X-Inumbo-ID: 873b4118-5e5b-48cb-b00d-f294f73c1ab0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=JEqqKhCzXBW6qHbrKAeTor+WoqPsh+w4N7npvMDHYaI=;
  b=WBhVzkLvYIs4e6tV5pO1T6TYjgcWwTFwoIy7MttHoCr7PHWHHYD2HIx9
   LRSAoN64cwujgd84Y8tNeBmet+j/oUSO5Q/IOYpqodWACwKZn31kYtcCn
   NiGM8SjicWUfeX4gIC6A5ku/S9lcQVQAzEevHWy4yliKfTi/m5xizMeqy
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: eu3bNrFhAMzJJjkq8gmzcFblaLfGCJMJg+infIysrEEoo28BuKZzRilD1DS3JTR84AReX5cXE8
 XddaAdzKt3hVz0McTECm2ZWAt5T86bQqlNSEhJyXxxX7yGcPoEmyhiWLK2QjBmznJ+2V3/N0x1
 WUYy2cVxhJ0O5XVfTIxDOss15MEQTi5gRSzwQ2C/yhoyYR9n9eZ7RU+v6W2kGsUMwoZhQIgeuP
 BYRpxGIAvut35IbbknRVnyT/OSFShGBBMvm6fZ7yegqXzvAhMp0RQLAEdLrGo6qNQMIb2yYJOX
 zyU=
X-SBRS: 5.2
X-MesageID: 40055712
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Bfu7766UnB44deoPnwPXwS6EI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex3h3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdBHW3tV2kZ
 1te60WMrHNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2FXQotLhj0JbTqzOEtwWQVAGN4FD5
 Ka/MVKvH6Nfn4QY8S9CBA+LpX+jvfMk4/rZgNDOg4/5GC1/EmVwZPZMzzd5BcRVDtT3awvmF
 KlryXV7riu2svLsyP0+HTU6/1t6b7c4/9iIODJtcQPMDXrjW+TFfVccpmPpio8ru3qyHtCqq
 i1nz4aM85+62zccwiOyHOHsWSQs0dNmgzf4GSVnGf5pojBTC86YvAx+75xSAfT6EYrobhHoc
 R29l+e3qAnaS/orWDW4tjFUAxSjUykoXYuuv57tQ0hbaIuLJBWtoAR50VTDdMpGz/78pkuFK
 1UANjb/+s+SyLWU1np+k1UhPC8VHU6GRmLBmAEp8yuyjBT2FR01VERysAzlmoJnahNB6Vs1q
 DhCOBFhbtORsgZYeZWH+EaW/a6DWTLXFblLH+SCU6PLtBHB1v977rMpJkl7uCjf5IFiLEono
 7abV9evWkuP2rzFMy12oFR+BylehTyYR3djuVlo7RpsLz1Q7TmdQeZTko1rsemq/IDRuLBXf
 KeP49XHu/DIWPiFZ0h5Xy8Z7BibV0lFOEFsNcyXFyD5ujRLJfxi+DdePHPYJrheAxUGF/XMz
 8mZnzeNc9A5kekVjvTmx7KQU7gfUT54NZVGKje9O4D9ZgVOuR3w00ooGX8wvvOBSxJs6Qwck
 c7CqjgiLmHqW6/+nuNyGl1JBxHDAJw7K/7W31H4S8GWnmEPooripG6QyR/zXGHLhhwQ4f9Cw
 hEvWl6/qqxMti33iAtC9WuN0qAlHsNrHe2T5MR85fzpfvNS9cdNNILSaZxHQLEG1heggBxsl
 pObwcCWwviDD/0sL6ki5YVHenbUNF5jG6QUIppgEOakX/ZidAkR3MdUTLrdcKMmw4hSwBZgU
 BL/7YFjKCNniuuLmUDkP01WWc8GFi/MfZjNkCodY9UkrfkdEVLQWCGiSezpjszdmDpnn9izl
 DJHGmxQ7XmE1BdsndX3uLW61tybHyaZF81QGt9q5dBGWPPvWtT3eeHarGo6XaYbkIPz4gmQX
 b4SApXBjkr68G81RaTljrHKG4vwY82OPfBSJskaLPe1xqWWfq1vJBDO8UR2plrNNrj6LBWFc
 2efhKYNzP+BacC3RePqnMsJSlzrz0FnJrTqWjYxVn9+ER6J/zYZGlCbfU8Bfq36mD/XfaG0J
 ljl7sOzKKNG1S0TuTD8L3daj5IFwjarmG3Rdw5sJw8h9NBiJJDW73gFQbS3H5J3B8CPN75uU
 MXTqN8+q3AMOZUDrgvUhMc2lIokdiVRXFbyTDeM6sbfVs3iWXcMM7My73UqaA3Cknpnnq6BX
 Cvtwlc9ezCRS2NyPozDL8xO31fbAwZ5G559O2PM63WBwPCTZAIwHOKdlu8eqRaUq6LBPE5qQ
 t7+ciBm6uvTBXDsTqgywdTE+Zp6GaoQcS7HQKKF6ppyrWBSCixq5rvxtWygjfxQSa8cGICi+
 R+BAotUvg=
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="40055712"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3b7VeRfzxsoTUrd7vG+Q17Zx9YfiV9BpQ7pPbXCP4vDt8XnEsOElHohp7yEzd3fuEj7W7DRzMGV/V1cXUsXTUR7hJb7WwowBTb/XsD5+tdx+E/oDdav9hfzM/9jISpHURvregdy7G6tJDYzuypi3GOG+kZxpVUCaDgqSxm4LI6Ha1/Pt8dlODlRlQnEDkDcJ6cnIzBRBWwBVreYrHimLGJMUCD1dBFGb1EtKAeqpfk8HerLuzmT2AeoeV4dvjpMAgMrqLuq38c7gnS+aXyrkQATVe3F6PuoFfrFS3TbTb5gEiIlh1MUarVdQKmYwjavUkUL+fMiHg96rVnernYihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdRb+QnYrgGEQMcTps13tpcI68Xa9umSiWj/KPzruTk=;
 b=brRQTwPON1m8Ujab8hR8nUPJFI2C8FyGsLEw+6y203/3iRen+tx4jRApEoqjwp2Zrz9gqFcupmndqE1m2CyBTgLPOwGygL8Tjq88tCmkl27MS6YH6qNOhSxt4Fk4Q0cwtapjFuBP0UqXMsfo1CetOef9a22fZN1Wlq9OnHzLOeNjbcMwZGO5vVrLfXWijWrA46m9d/BgRvheVVUea/MUYAnlWbbn7oQp/HDCKEpIDcRcW8Lx5V+PjiCLjttIX/CeeRagJdKsDw6VhWjwcSGOSW4Fi5d4BxdS+h5zIqqk2QToZZSJaafuenq8uyk6psr9OHSQ8w8sJkcJl+RXyVgS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdRb+QnYrgGEQMcTps13tpcI68Xa9umSiWj/KPzruTk=;
 b=TEamV24AxFsN6mVgb7Ilv25t/118jfiXh7qsyQFue39tdsCatpy+BbjQ9ED5JgmNbNlly8JXYdeFKkTUvI7d2Y46u6xcsVeY6U6ARvh6NzBEyXp143kpolxe4ryobCqqp3hOITH3vQ4kaAwgVoj+AhMxhy5Y2LSkWhqCto5T4Wo=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 18/21] libs/guest: rework xc_cpuid_xend_policy
Date: Tue, 23 Mar 2021 10:58:46 +0100
Message-ID: <20210323095849.37858-19-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0132.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: add2c9df-e090-4a3a-1405-08d8ede29a33
X-MS-TrafficTypeDiagnostic: DM6PR03MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4969BAA96EB17A627DB63A418F649@DM6PR03MB4969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:64;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AR3kC9/MOD/EPz9y/NVMDmkgwehbXsWhbdGVVLSpxBILgRanA88HcA8m6p9RyuKS/1BhVYFai5HZciz6py+lVUB/n1y8b62VRcwZgFYE1EX9nU1CZdPZP70d01NRsuSTNMLtdfScyqJQNHv8dSgsH0piu/z/gZiVMN4rx0lGc5lYmbSsbLb/l9ZQ+xEtoSbsESXIZ5rrW856Pa29eAdY4M2AhxGPU91WbPOLU9C8iS0vSiIoyyfInMlfr+5FxrzLS6b6iOHCwUb+AJ55XGpwNYDIgOkIJRaPcPuzyp7I/dzo+uh6OaUpyYW4keq8va/memRRPvxdUlEDDWhLNB65PpcFyIMmCdn+G52yHvGn8k6A+eF1AbH4LzjYe7zMKXtYOy6TIBjj7z1L7y8K6ze4L9B65JG40OVF+SHcIjxza9J2nP4z5PrlNPXhkl3ww2VnD58AR8RRQrYLU37K7RZKlBxv3se14ByUXG+gg5Ij2bupOqGUNjmNYbcGrcgipeAxeyZFdArXTBNB31OxdYz1rsreNQY1ayU8kLVFZHiI6m1EVvoD98JA3p5CYXJQ6OgATyOOj1RVoT2JX0J21uXX+PBjuXscooeyqu8tb1Ph6YPChBvDRd2ruADmbzTq3iskKBIcgVGAbu9lZyAYRn42eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(54906003)(36756003)(2616005)(316002)(26005)(6486002)(956004)(16526019)(186003)(2906002)(86362001)(66556008)(6916009)(478600001)(5660300002)(8936002)(6496006)(38100700001)(83380400001)(6666004)(66476007)(8676002)(66946007)(1076003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bXIvNGFXUEhBV2RISGZTQnFJS0JPdjk0UWg2T09Bb3pXTnpMVmxOM25zQlc5?=
 =?utf-8?B?OHMzT2UwMkpBR0NGZUN0WjVUY1V5bWM2OEJ0RFhVcmI3NU04SUJXRHd2QjhL?=
 =?utf-8?B?dmlIdFJodmhMc0lrbUl0c3NsZUtQdjhsMDNlV25wOWZ2KzdnU3Y5UFhrSUlt?=
 =?utf-8?B?Ym4zb2RxLzY1UEZNT0oxYk15RWU0b0M1Z0dnSnJRWEJUOFo1UWlVdTZGcGZl?=
 =?utf-8?B?UitVbWZFVHdTZzRaczc5WWsyMFZmeFBIdzZ6UXR3R0VwaTh3V2k0VVB3c0RR?=
 =?utf-8?B?Y1IwamtFaXNQcjhwVHY4M1JxZURodStvdmxVb1lJT0VZMUxTZlI1dTZ3Zk50?=
 =?utf-8?B?TXFrS0JORTFiQzFweGV2ZDFJODR4aENRNEI2V29ZQzZpbjF2L0lXbHlXTUVO?=
 =?utf-8?B?dTlwNEdhZDRkZWw2eDBDSFNkcDdnTHJtQVJDaTlEd1R2VVZEcURndGM0OVhW?=
 =?utf-8?B?WFUwa1dsVmwyMjd4aWc2VG9MaEE5Zm9FNjNTTnVtOG91dUt3bG1TU2lwaDBE?=
 =?utf-8?B?RGpsUUpDVEpxQW1IT0s2YkZkNlpwNHJyalZwSjZLZUFHVlVabzJoSU9kS3kx?=
 =?utf-8?B?Uk4yQUptVERwY0Nhd2VnelZHV1dQYkx4aTRWeG9vUkwzNDNtekx0bnBQeXk1?=
 =?utf-8?B?bjVMSlQvUEJDSkdDRUVOTjRLaWZHUzEyQ3dVd3liT2RQSnNCL3pzaUJqcGRS?=
 =?utf-8?B?RWFmWFhqQ0l0M245UDlLY2hqa2V4bS9EY05LQUcwUjFrQldBTGpTSUdJMTJ6?=
 =?utf-8?B?SGo4eGFOc1M4Rk53V0hCQS9jSXpOZTJIMGYrazJEU2RMa1dRTHE1VWQzZnc1?=
 =?utf-8?B?K2YrUy9tQ3VuMkN4aVdVQ1Fwbko1bStkMHA0RHhlM0ZCbm1SWTBQVmlDZHk5?=
 =?utf-8?B?UTFQYWI4eXl4SXMvUE9VeHgyMFVRS1FzTmZWanJvWUxRMlU5b3VhaWxsdjV2?=
 =?utf-8?B?S1QxVFVrK2NsQUhFVDhYOEJBWm1xVlZxT2ZmUG1KcHVFYllrQWlJUXgzQjJQ?=
 =?utf-8?B?TytSTkd0dnhXSEN3MG1MWm1jczBvN1N3TGpWTGJFMTdCcWJ3dCs3dER3aStH?=
 =?utf-8?B?Wml1dU9SU2NDQ2V5MUx4d3BBblI4bnY1WnFGWXRQbmFiUkl1K1NIak1sY2o4?=
 =?utf-8?B?cXdiS0hiSnBhUVhNUlZlZUdLYTNGUnpFVzZmUlN4VGlJS1JjMHZ3dW1RWXZD?=
 =?utf-8?B?dEdDWGZpOFhlcG9tSHpjdEJQbjJaRlNQSHdrdkc0REFmSDVzVncvQ1d6bFdW?=
 =?utf-8?B?SW5PZUZQaWdLRFFhTkJjdjZpNk5SbVIrVllML3hmb3dEMVlyY3NsVHlrYktq?=
 =?utf-8?B?NEg1RjdUTXFleTFHRjBIWlRKWklyOWlSQkJGU29KRnI0SzgvYmZUMFd6OE5T?=
 =?utf-8?B?OFNQUDh0WFhhUDlZRElxYlJEbVgxa3VHb0hLTWFzOFBmbU1nQ2I1NGFpMDc0?=
 =?utf-8?B?YXpOSXYrKzRvdmhJVDY0SnpldEVLdHFUZ3ZQVElpaWJ5TVRDYnZ1ZHh3T0J0?=
 =?utf-8?B?Q2NkN0RveGRqNWFYQVl6bWh1MCtTZWxiM24xU3ViUkcxUDVneTlycW43eS9J?=
 =?utf-8?B?WWF1eXlNbjA1UTFuRkhaM1RJYWNQVmhjVWJCUU8vRlVxQ3Q2eDlwbVlsVk9s?=
 =?utf-8?B?bldnc1ZFLytrMElSTkFBSDM4amZka01PdDdyYkZHKzZjSUtEZ1NsVkNZS1dv?=
 =?utf-8?B?NGRZTndYSjRCRGxQU1VOK2dMUlQwd09mcXFQYS9EOSt0K2NISDRPUWxtbFhk?=
 =?utf-8?Q?pT0yAbi+hiJqXyTAgqYHWIxrvh3+OzOhDJTpp3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: add2c9df-e090-4a3a-1405-08d8ede29a33
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 10:01:17.9331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdOA5dJOU6dijJhJu44CdG1YZI4IqWwIKBg8CFvvLnZJtFOnSvbVkVDLdiZEuouprC6gSonI2w7gxqaZ+RBoMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969
X-OriginatorOrg: citrix.com

Rename xc_cpuid_xend_policy to xc_cpu_policy_apply_cpuid and make it
public. Modify the function internally to use the new xc_cpu_policy_*
set of functions. Also don't apply the passed policy to a domain
directly, and instead modify the provided xc_cpu_policy_t. The caller
will be responsible of applying the modified cpu policy to the domain.

Note that further patches will end up removing this function, since
the parsing of a cpu policy in xend format is a layering violation,
now the callers should have the necessary helpers to modify an
xc_cpu_policy_t themselves.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |   4 +
 tools/libs/guest/xg_cpuid_x86.c | 200 +++++++++++++-------------------
 2 files changed, 83 insertions(+), 121 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 9f94e61523e..07b8bfc08aa 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2635,6 +2635,10 @@ int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
 int xc_cpu_policy_topology(xc_interface *xch, xc_cpu_policy_t policy,
                            bool hvm);
 
+/* Apply an xc_xend_cpuid object to the policy. */
+int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
+                              const struct xc_xend_cpuid *cpuid, bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index d50822c0abb..ce4a4a1a436 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -258,144 +258,107 @@ static int set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     return ret;
 }
 
-static int compare_leaves(const void *l, const void *r)
-{
-    const xen_cpuid_leaf_t *lhs = l;
-    const xen_cpuid_leaf_t *rhs = r;
-
-    if ( lhs->leaf != rhs->leaf )
-        return lhs->leaf < rhs->leaf ? -1 : 1;
-
-    if ( lhs->subleaf != rhs->subleaf )
-        return lhs->subleaf < rhs->subleaf ? -1 : 1;
-
-    return 0;
-}
-
-static xen_cpuid_leaf_t *find_leaf(
-    xen_cpuid_leaf_t *leaves, unsigned int nr_leaves,
-    const struct xc_xend_cpuid *xend)
-{
-    const xen_cpuid_leaf_t key = { xend->leaf, xend->subleaf };
-
-    return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
-}
-
-static int xc_cpuid_xend_policy(
-    xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
+int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
+                              const struct xc_xend_cpuid *cpuid, bool hvm)
 {
     int rc;
-    xc_dominfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    /*
-     * Three full policies.  The host, domain max, and domain current for the
-     * domain type.
-     */
-    xen_cpuid_leaf_t *host = NULL, *max = NULL, *cur = NULL;
-    unsigned int nr_host, nr_max, nr_cur;
+    xc_cpu_policy_t host = NULL, max = NULL;
 
-    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
-         di.domid != domid )
-    {
-        ERROR("Failed to obtain d%d info", domid);
-        rc = -ESRCH;
-        goto fail;
-    }
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto fail;
-    }
-
-    rc = -ENOMEM;
-    if ( (host = calloc(nr_leaves, sizeof(*host))) == NULL ||
-         (max  = calloc(nr_leaves, sizeof(*max)))  == NULL ||
-         (cur  = calloc(nr_leaves, sizeof(*cur)))  == NULL )
-    {
-        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
-        goto fail;
-    }
-
-    /* Get the domain's current policy. */
-    nr_msrs = 0;
-    nr_cur = nr_leaves;
-    rc = get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
-    if ( rc )
+    host = xc_cpu_policy_init();
+    max = xc_cpu_policy_init();
+    if ( !host || !max )
     {
-        PERROR("Failed to obtain d%d current policy", domid);
-        rc = -errno;
-        goto fail;
+        PERROR("Failed to init policies");
+        rc = -ENOMEM;
+        goto out;
     }
 
     /* Get the domain's max policy. */
-    nr_msrs = 0;
-    nr_max = nr_leaves;
-    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_max
+    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_max
                                            : XEN_SYSCTL_cpu_policy_pv_max,
-                               &nr_max, max, &nr_msrs, NULL);
+                                  max);
     if ( rc )
     {
-        PERROR("Failed to obtain %s max policy", di.hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto fail;
+        PERROR("Failed to obtain %s max policy", hvm ? "hvm" : "pv");
+        goto out;
     }
 
     /* Get the host policy. */
-    nr_msrs = 0;
-    nr_host = nr_leaves;
-    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
-                               &nr_host, host, &nr_msrs, NULL);
+    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
     if ( rc )
     {
         PERROR("Failed to obtain host policy");
-        rc = -errno;
-        goto fail;
+        goto out;
     }
 
     rc = -EINVAL;
-    for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
+    for ( ; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid )
     {
-        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur, xend);
-        const xen_cpuid_leaf_t *max_leaf = find_leaf(max, nr_max, xend);
-        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend);
+        xen_cpuid_leaf_t cur_leaf;
+        xen_cpuid_leaf_t max_leaf;
+        xen_cpuid_leaf_t host_leaf;
 
-        if ( cur_leaf == NULL || max_leaf == NULL || host_leaf == NULL )
+        rc = xc_cpu_policy_get_cpuid(xch, policy, cpuid->leaf, cpuid->subleaf,
+                                     &cur_leaf);
+        if ( rc )
+        {
+            ERROR("Failed to get current policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
+        rc = xc_cpu_policy_get_cpuid(xch, max, cpuid->leaf, cpuid->subleaf,
+                                     &max_leaf);
+        if ( rc )
         {
-            ERROR("Missing leaf %#x, subleaf %#x", xend->leaf, xend->subleaf);
-            goto fail;
+            ERROR("Failed to get max policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
+        rc = xc_cpu_policy_get_cpuid(xch, host, cpuid->leaf, cpuid->subleaf,
+                                     &host_leaf);
+        if ( rc )
+        {
+            ERROR("Failed to get host policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
         }
 
-        for ( unsigned int i = 0; i < ARRAY_SIZE(xend->policy); i++ )
+        for ( unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++ )
         {
-            uint32_t *cur_reg = &cur_leaf->a + i;
-            const uint32_t *max_reg = &max_leaf->a + i;
-            const uint32_t *host_reg = &host_leaf->a + i;
+            uint32_t *cur_reg = &cur_leaf.a + i;
+            const uint32_t *max_reg = &max_leaf.a + i;
+            const uint32_t *host_reg = &host_leaf.a + i;
 
-            if ( xend->policy[i] == NULL )
+            if ( cpuid->policy[i] == NULL )
                 continue;
 
             for ( unsigned int j = 0; j < 32; j++ )
             {
                 bool val;
 
-                if ( xend->policy[i][j] == '1' )
+                switch ( cpuid->policy[i][j] )
+                {
+                case '1':
                     val = true;
-                else if ( xend->policy[i][j] == '0' )
+                    break;
+
+                case '0':
                     val = false;
-                else if ( xend->policy[i][j] == 'x' )
+                    break;
+
+                case 'x':
                     val = test_bit(31 - j, max_reg);
-                else if ( xend->policy[i][j] == 'k' ||
-                          xend->policy[i][j] == 's' )
+                    break;
+
+                case 'k':
+                case 's':
                     val = test_bit(31 - j, host_reg);
-                else
-                {
+                    break;
+
+                default:
                     ERROR("Bad character '%c' in policy[%d] string '%s'",
-                          xend->policy[i][j], i, xend->policy[i]);
-                    goto fail;
+                          cpuid->policy[i][j], i, cpuid->policy[i]);
+                    goto out;
                 }
 
                 clear_bit(31 - j, cur_reg);
@@ -403,25 +366,19 @@ static int xc_cpuid_xend_policy(
                     set_bit(31 - j, cur_reg);
             }
         }
-    }
 
-    /* Feed the transformed currrent policy back up to Xen. */
-    rc = set_domain_cpu_policy(xch, domid, nr_cur, cur, 0, NULL,
-                               &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto fail;
+        rc = xc_cpu_policy_update_cpuid(xch, policy, &cur_leaf, 1);
+        if ( rc )
+        {
+            PERROR("Failed to set policy leaf %#x subleaf %#x",
+                   cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
     }
 
-    /* Success! */
-
- fail:
-    free(cur);
-    free(max);
-    free(host);
+ out:
+    xc_cpu_policy_destroy(max);
+    xc_cpu_policy_destroy(host);
 
     return rc;
 }
@@ -429,7 +386,7 @@ static int xc_cpuid_xend_policy(
 int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                           const uint32_t *featureset, unsigned int nr_features,
                           bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *xend)
+                          const struct xc_xend_cpuid *cpuid)
 {
     int rc;
     xc_dominfo_t di;
@@ -551,6 +508,10 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     if ( rc )
         goto out;
 
+    rc = xc_cpu_policy_apply_cpuid(xch, &policy, cpuid, di.hvm);
+    if ( rc )
+        goto out;
+
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
     if ( rc )
     {
@@ -568,9 +529,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     }
 
-    if ( xend && (rc = xc_cpuid_xend_policy(xch, domid, xend)) )
-        goto out;
-
     rc = 0;
 
 out:
-- 
2.30.1


